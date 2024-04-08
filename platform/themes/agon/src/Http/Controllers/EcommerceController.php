<?php

namespace Theme\Agon\Http\Controllers;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Ecommerce\Facades\Cart;
use Botble\Ecommerce\Facades\EcommerceHelper;
use Botble\Ecommerce\Models\Customer;
use Botble\Ecommerce\Repositories\Interfaces\FlashSaleInterface;
use Botble\Ecommerce\Repositories\Interfaces\ProductCategoryInterface;
use Botble\Ecommerce\Repositories\Interfaces\ProductInterface;
use Botble\Ecommerce\Services\Products\GetProductService;
use Botble\Theme\Facades\Theme;
use Botble\Theme\Http\Controllers\PublicController;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Theme\Agon\Http\Resources\BrandResource;
use Theme\Agon\Http\Resources\ProductCategoryResource;

class EcommerceController extends PublicController
{
    public function __construct(protected BaseHttpResponse $httpResponse)
    {
        $this->middleware(function ($request, $next) {
            if (! $request->ajax()) {
                return $this->httpResponse->setNextUrl(route('public.index'));
            }

            return $next($request);
        })->only([
            'ajaxGetProducts',
            'ajaxGetFeaturedProductCategories',
            'ajaxGetFeaturedBrands',
            'ajaxGetFlashSale',
            'ajaxGetFeaturedProducts',
            'ajaxGetProductsByCategoryId',
            'ajaxCart',
            'ajaxGetQuickView',
            'ajaxGetRelatedProducts',
            'ajaxSearchProducts',
            'ajaxGetProductReviews',
            'ajaxGetProductCategories',
            'ajaxGetRecentlyViewedProducts',
            'ajaxContactSeller',
        ]);
    }

    protected function getWishlistIds(array $productIds = []): array
    {
        if (! EcommerceHelper::isWishlistEnabled()) {
            return [];
        }

        if (auth('customer')->check()) {
            /**
             * @var Customer $customer
             */
            $customer = auth('customer')->user();

            return $customer->wishlist()->whereIn('product_id', $productIds)->pluck('product_id')->all();
        }

        return collect(Cart::instance('wishlist')->content())
            ->sortBy([['updated_at', 'desc']])
            ->whereIn('id', $productIds)
            ->pluck('id')
            ->all();
    }

    public function ajaxGetProducts(Request $request)
    {
        $products = get_products_by_collections([
                'collections' => [
                    'by' => 'id',
                    'value_in' => [(int)$request->input('collection_id')],
                ],
                'take' => (int)$request->input('limit', 10),
                'with' => [
                    'slugable',
                    'variations',
                    'productCollections',
                    'variationAttributeSwatchesForProductList',
                ],
            ] + EcommerceHelper::withReviewsParams());

        $wishlistIds = $this->getWishlistIds($products->pluck('id')->all());

        $data = [];
        foreach ($products as $product) {
            $data[] = Theme::partial('ecommerce.product-item', compact('product', 'wishlistIds'));
        }

        return $this->httpResponse->setData($data);
    }

    public function ajaxGetFeaturedProductCategories()
    {
        $categories = get_featured_product_categories(['take' => null]);

        return $this->httpResponse->setData(ProductCategoryResource::collection($categories));
    }

    public function ajaxGetFeaturedBrands()
    {
        $brands = get_featured_brands();

        return $this->httpResponse->setData(BrandResource::collection($brands));
    }

    public function ajaxGetFlashSale($id, FlashSaleInterface $flashSaleRepository)
    {
        $flashSale = $flashSaleRepository->getModel()
            ->notExpired()
            ->where('id', $id)
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->with([
                'products' => function ($query) {
                    $reviewParams = EcommerceHelper::withReviewsParams();

                    if (EcommerceHelper::isReviewEnabled()) {
                        $query->withAvg($reviewParams['withAvg'][0], $reviewParams['withAvg'][1]);
                    }

                    return $query
                        ->where('status', BaseStatusEnum::PUBLISHED)
                        ->withCount($reviewParams['withCount']);
                },
            ])
            ->first();

        if (! $flashSale) {
            return $this->httpResponse->setData([]);
        }

        $data = [];
        $isFlashSale = true;
        $wishlistIds = $this->getWishlistIds($flashSale->products->pluck('id')->all());

        foreach ($flashSale->products as $product) {
            if (! EcommerceHelper::showOutOfStockProducts() && $product->isOutOfStock()) {
                continue;
            }

            $data[] = Theme::partial('ecommerce.product-item', compact('product', 'flashSale', 'isFlashSale', 'wishlistIds'));
        }

        return $this->httpResponse->setData($data);
    }

    public function ajaxGetFeaturedProducts(Request $request)
    {
        $data = [];

        $products = get_featured_products([
                'take' => (int)$request->input('limit', 10),
                'with' => [
                    'slugable',
                    'variations',
                    'productCollections',
                    'variationAttributeSwatchesForProductList',
                ],
            ] + EcommerceHelper::withReviewsParams());

        $wishlistIds = $this->getWishlistIds($products->pluck('id')->all());

        foreach ($products as $product) {
            $data[] = Theme::partial('ecommerce.product-item', compact('product', 'wishlistIds'));
        }

        return $this->httpResponse->setData($data);
    }

    public function ajaxGetProductsByCategoryId(
        Request $request,
        ProductInterface $productRepository,
        ProductCategoryInterface $productCategoryRepository
    ) {
        $categoryId = $request->input('category_id');

        if (! $categoryId) {
            return $this->httpResponse;
        }

        $category = $productCategoryRepository->findOrFail($categoryId);

        $products = $productRepository->getProductsByCategories([
                'categories' => [
                    'by' => 'id',
                    'value_in' => array_merge([$category->id], $category->activeChildren->pluck('id')->all()),
                ],
                'take' => (int)$request->input('limit', 10),
            ] + EcommerceHelper::withReviewsParams());

        $wishlistIds = $this->getWishlistIds($products->pluck('id')->all());

        $data = [];
        foreach ($products as $product) {
            $data[] = Theme::partial('ecommerce.product-item', compact('product', 'wishlistIds'));
        }

        return $this->httpResponse->setData($data);
    }

    public function ajaxCart()
    {
        return $this->httpResponse->setData([
            'count' => Cart::instance('cart')->count(),
            'total_price' => format_price(Cart::instance('cart')->rawSubTotal() + Cart::instance('cart')->rawTax()),
            'html' => Theme::partial('ecommerce.cart-mini.list'),
        ]);
    }

    public function ajaxGetQuickView(Request $request, $id = null)
    {
        if (! $id) {
            $id = (int)$request->input('product_id');
        }

        $product = null;

        if ($id) {
            $product = get_products([
                    'condition' => [
                        'ec_products.id' => $id,
                        'ec_products.status' => BaseStatusEnum::PUBLISHED,
                    ],
                    'take' => 1,
                    'with' => [
                        'slugable',
                        'tags',
                        'tags.slugable',
                    ],
                ] + EcommerceHelper::withReviewsParams());
        }

        if (! $product) {
            return $this->httpResponse->setError()->setMessage(__('This product is not available.'));
        }

        [$productImages, $productVariation, $selectedAttrs] = EcommerceHelper::getProductVariationInfo($product);

        $wishlistIds = $this->getWishlistIds([$product->id]);

        return $this
            ->httpResponse
            ->setData(Theme::partial('ecommerce.quick-view', compact('product', 'selectedAttrs', 'productImages', 'productVariation', 'wishlistIds')));
    }

    public function ajaxGetRelatedProducts(
        $id,
        Request $request,
        ProductInterface $productRepository
    ) {
        $product = $productRepository->findOrFail($id);

        $products = get_related_products($product, $request->input('limit'));

        $data = [];
        foreach ($products as $product) {
            $data[] = Theme::partial('ecommerce.product-item', compact('product'));
        }

        return $this->httpResponse->setData($data);
    }

    public function ajaxSearchProducts(Request $request, GetProductService $productService)
    {
        $request->merge(['num' => 12]);

        $with = [
            'slugable',
            'variations',
            'productCollections',
            'variationAttributeSwatchesForProductList',
        ];

        $products = $productService->getProduct($request, null, null, $with);

        $queries = $request->input();
        foreach ($queries as $key => $query) {
            if (! $query || $key == 'num' || (is_array($query) && ! Arr::get($query, 0))) {
                unset($queries[$key]);
            }
        }

        $total = $products->count();
        $message = $total != 1 ? __(':total Products found', compact('total')) : __(':total Product found', compact('total'));

        return $this->httpResponse
            ->setData(Theme::partial('ajax-search-results', compact('products', 'queries')))
            ->setMessage($message);
    }

    public function ajaxGetProductCategories(
        Request $request,
        BaseHttpResponse $response,
        ProductCategoryInterface $productCategoryRepository
    ) {
        $categoryIds = $request->input('categories', []);
        if (empty($categoryIds)) {
            return $response;
        }

        $categories = $productCategoryRepository->advancedGet([
            'condition' => [
                'status' => BaseStatusEnum::PUBLISHED,
                ['id', 'IN', $categoryIds],
            ],
            'with' => ['slugable'],
        ]);

        return $response->setData(ProductCategoryResource::collection($categories));
    }

    public function ajaxGetRecentlyViewedProducts(Request $request, ProductInterface $productRepository)
    {
        if (! EcommerceHelper::isEnabledCustomerRecentlyViewedProducts()) {
            abort(404);
        }

        $limit = max((int)$request->input('limit') ?: 6, 12);

        $queryParams = [
                'with' => ['slugable'],
                'take' => $limit,
            ] + EcommerceHelper::withReviewsParams();

        if (auth('customer')->check()) {
            $products = $productRepository->getProductsRecentlyViewed(auth('customer')->id(), $queryParams);
        } else {
            $products = collect();

            $itemIds = collect(Cart::instance('recently_viewed')->content())
                ->sortBy([['updated_at', 'desc']])
                ->take($limit)
                ->pluck('id')
                ->all();

            if ($itemIds) {
                $products = $productRepository->getProductsByIds($itemIds, $queryParams);
            }
        }

        return $this->httpResponse
            ->setData(Theme::partial('ecommerce.recently-viewed-products', compact('products')));
    }
}
