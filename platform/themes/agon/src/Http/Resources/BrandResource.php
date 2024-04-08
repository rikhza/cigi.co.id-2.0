<?php

namespace Theme\Agon\Http\Resources;

use Botble\Ecommerce\Models\Brand;
use Botble\Media\Facades\RvMedia;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Str;

/**
 * @mixin Brand
 */
class BrandResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'url' => $this->url,
            'description' => Str::limit($this->description, 150),
            'logo' => RvMedia::getImageUrl($this->logo, null, false, RvMedia::getDefaultImage()),
        ];
    }
}
