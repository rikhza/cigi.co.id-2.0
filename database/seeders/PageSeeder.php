<?php

namespace Database\Seeders;

use Botble\Base\Facades\Html;
use Botble\Base\Facades\MetaBox;
use Botble\Base\Supports\BaseSeeder;
use Botble\Page\Models\Page;
use Botble\Slug\Facades\SlugHelper;
use Botble\Slug\Models\Slug;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\File;
use Illuminate\Support\HtmlString;
use Illuminate\Support\Str;

class PageSeeder extends BaseSeeder
{
    public function run(): void
    {
        $this->uploadFiles('homepage1');
        $this->uploadFiles('company');

        Page::query()->truncate();

        $weAreTrusted = $this->weAreTrustedShortcode();
        $companies = $this->companiesShortcode();
        $companies2 = $this->companiesShortcode('2');
        $weFacilitate = $this->weFacilitateShortcode();
        $weFacilitate1x = $this->weFacilitateShortcode('1x', ['style' => 'style-1']);
        $weFacilitate2 = $this->weFacilitateShortcode('2');
        $weDoYouGet = $this->weDoYouGetShortcode();
        $weDoYouGet2 = $this->weDoYouGetShortcode('2');
        $weDoYouGet1x = $this->weDoYouGetShortcode('1', [
            'title' => 'An Exceptionally unique experience Tailored to you',
            'subtitle' => 'In a professional context it often happens that private or corporate clients order a publication news while still not being ready. Business advisory service advises current and future businesses prospects of a client',
            'image' => 'general/banner8.png',
        ]);
        $weDoYouGet3 = $this->weDoYouGetShortcode('3');
        $weDoYouGet4 = $this->weDoYouGetShortcode('4');
        $weDoYouGet5 = $this->weDoYouGetShortcode('5');
        $weDoYouGet6 = $this->weDoYouGetShortcode('6');
        $weDoYouGet7 = $this->weDoYouGetShortcode('7');
        $weDoYouGet8 = $this->weDoYouGetShortcode('8');
        $howItWorks = $this->howItWorksShortcode();
        $howItWorks2 = $this->howItWorksShortcode('2');
        $howItWorks3 = $this->howItWorksShortcode('3');
        $howItWorks4 = $this->howItWorksShortcode('4');
        $howItWorks5 = $this->howItWorksShortcode('5');
        $howItWorks6 = $this->howItWorksShortcode('6');
        $howItWorks7 = $this->howItWorksShortcode('7');
        $howItWorks7x = $this->howItWorksShortcode('7', [
            'title' => 'Building the Work Ecosystem',
            'subtitle' => 'From year to year we strive to invent the most innovative technology that is used by both small and big enterprises',
        ]);
        $howItWorks2x = $this->howItWorksShortcode('2', [
            'title' => 'Built exclusively for you',
            'subtitle' => 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit laborum — semper quis lectus nulla.',
        ]);
        $howItWorks2y = $this->howItWorksShortcode('2', ['title' => '', 'subtitle' => '']);
        $quotation = $this->quotationShortcode();
        $quotation1x = $this->quotationShortcode('2', ['style' => 'style-1']);
        $quotation3 = $this->quotationShortcode('3');
        $statistical = $this->statisticalShortcode();
        $statistical2 = $this->statisticalShortcode('2');
        $statistical3 = $this->statisticalShortcode('3');
        $ourTeam = $this->ourTeamShortcode();
        $ourLocation = $this->ourLocationShortcode();
        $newsletter = Html::tag(
            'div',
            '[newsletter name="newsletter" title="Subscribe our newsletter" subtitle="By clicking the button, you are agreeing with our Term & Conditions" link="/" text_link="Term & Conditions" image="general/img-newsletter.png" mini_image="general/chart.png"][/newsletter]'
        );
        $ourNews = Html::tag(
            'div',
            '[our-news title="From Our Blog" subtitle="From Our blog and Event fanpage" number_of_displays="6"][/our-news]'
        );
        $ourNews2 = Html::tag(
            'div',
            '[our-news title="From Our Blog" subtitle="From Our blog and Event fanpage" number_of_displays="6" style="style-2"][/our-news]'
        );
        $ourNews3 = Html::tag(
            'div',
            '[our-news title="Explore by Categories." subtitle="We provide many categories, choose a category according to your expertise to make it easier to find a job." number_of_displays="4" style="style-3" category_id="1"][/our-news]'
        );
        $ourNews1x = Html::tag(
            'div',
            '[our-news title="Latest news" subtitle="From Our blog and Event fanpage" number_of_displays="6"][/our-news]'
        );
        $ourNews2x = Html::tag(
            'div',
            '[our-news title="Featured Articles" subtitle="From Our Blog And Event Fanpage" number_of_displays="5" type="featured" style="style-2"][/our-news]'
        );
        $ourNews4 = Html::tag(
            'div',
            '[our-news title="Latest news" subtitle="From Our blog and Event fanpage" number_of_displays="9" style="style-4"][/our-news]'
        );

        $youtubeVideo = Html::tag(
            'div',
            '[youtube-video image="general/bg-video-1.png"]https://www.youtube.com/watch?v=oRI37cOPBQQ[/youtube-video]'
        );

        $pages = [
            1 => [
                'name' => 'Homepage 1',
                'content' =>
                    Html::tag(
                        'div',
                        '[hero-banner title="We are awesome team for your business dream" highlight_text="awesome team" subtitle="Integrated workflow designed for product teams. We create world-class development and branding" image="homepage1/banner.png" bg_color="#990099" bg_image_1="homepage1/bg-1.png" bg_image_2="homepage1/bg-2.png" video_url="https://www.youtube.com/watch?v=oRI37cOPBQQ" video_bg="homepage1/video-bg.png" primary_title="Get Start" primary_url="/" secondary_title="Learn More" secondary_url="/"][/hero-banner]'
                    ) .
                    $companies .
                    $weAreTrusted .
                    $weFacilitate .
                    $weDoYouGet .
                    $howItWorks .
                    Html::tag(
                        'div',
                        '[testimonials title="Our Happy Customers" subtitle="Know about our clients, we are a worldwide corporate brand"][/testimonials]'
                    ) .
                    $ourNews1x .
                    $quotation .
                    $newsletter,
                'template' => 'homepage',
            ],
            2 => [
                'name' => 'Blog',
                'description' => 'From year to year we strive to invent the most innovative technology that is used by both small enterprises and space enterprises.',
                'content' => '---',
            ],
            3 => [
                'name' => 'Contact',
                'content' =>
                    Html::tag(
                        'div',
                        '[page-header title="Contact Us" subtitle="Equidem necessitatibus ei eam, ceteros expetenda hendrerit ei per, tation vituperatoribus ut."][/page-header]'
                    ) .
                    Html::tag(
                        'div',
                        '[contact-form title="Have an project in mind?" subtitle="The right move at the right time saves your investment. live the dream of expanding your business." highlight="Contact us" image="general/email.png" name="Agon Studio" address="4517 Washington Ave. Manchester, Kentucky 39495" phone="(239) 555-0108" email="contact@agon.com"][/contact-form]'
                    ) .
                    $ourLocation,
            ],
            4 => [
                'name' => 'Cookie Policy',
                'content' => Html::tag('h3', 'EU Cookie Consent') .
                    Html::tag(
                        'p',
                        'To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.'
                    ) .
                    Html::tag('h4', 'Essential Data') .
                    Html::tag(
                        'p',
                        'The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.'
                    ) .
                    Html::tag(
                        'p',
                        '- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.'
                    ) .
                    Html::tag(
                        'p',
                        '- XSRF-Token Cookie: Laravel automatically generates a CSRF "token" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.'
                    ),
                'template' => 'page-detail',
            ],
            5 => [
                'name' => 'About us',
                'content' =>
                    Html::tag(
                        'div',
                        '[hero-banner title="A small creative team excited to create beautiful things" highlight_text="What We Do, What You Get" subtitle="Integrated workflow designed for product teams. We create world-class development and branding" image="general/banner1.png" bg_color="#990099" bg_image_1="general/bg-about-1.png" mini_image="general/banner2.png" primary_title="Join Our Team" primary_url="/" secondary_title="Contact Us" secondary_url="/" style="style-2"][/hero-banner]'
                    ) .
                    $statistical .
                    Html::tag(
                        'div',
                        '[youtube-video title="What We Do, What You Get" subtitle="We believe in the power of creative ideas" image="general/bg-video-1.png"]https://www.youtube.com/watch?v=oRI37cOPBQQ[/youtube-video]'
                    ) .
                    $howItWorks2 .
                    $weFacilitate2 .
                    $ourTeam .
                    Html::tag(
                        'div',
                        '[testimonials title="Our Happy Customers" subtitle="Know about our clients, we are a worldwide corporate brand"][/testimonials]'
                    ) .
                    $ourNews1x,
            ],
            6 => [
                'name' => 'Service',
                'content' =>
                    Html::tag(
                        'div',
                        '[hero-banner title="Building the Work Ecosystem" subtitle="Connect your conversations with the tools and services that you use to get the job done. With over 1,500 apps and a robust API" image="general/banner3.png" mini_image="general/banner4.png" primary_title="Get Started" primary_url="/" secondary_title="How it works" secondary_url="/" style="style-3" quantity="2" title_1="Projects done" count_1="12" extra_1="k" image_1="general/icon-project-done.png" title_2="Offices / Factories" count_2="18" image_2="general/icon-officer.png"][/hero-banner]'
                    ) .
                    $howItWorks5 .
                    $weDoYouGet2 .
                    $quotation1x .
                    $newsletter,
            ],
            7 => [
                'name' => 'Pricing',
                'content' =>
                    $quotation1x .
                    $howItWorks3 .
                    Html::tag(
                        'div',
                        '[testimonials title="Our Happy Customers" subtitle="Know about our clients, we are a worldwide corporate brand" style="style-2"][/testimonials]'
                    ) .
                    Html::tag(
                        'div',
                        '[faq title="Frequently Asked Questions" subtitle="Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus, blandit and cursus varius and magnis sapien"][/faq]'
                    ) .
                    $newsletter,
            ],
            8 => [
                'name' => 'FAQs',
                'content' =>
                    Html::tag(
                        'div',
                        '[faq-ask title="We are here to help you" subtitle="We are collect your searching keywords to improve our services"][/faq-ask]'
                    ) .
                    $howItWorks6 .
                    Html::tag(
                        'div',
                        '[faq title="Pricing Plan questions" subtitle="Feeling inquisitive? Have a read through some of our FAQs or contact our supporters for help" style="style-2" quantity="2" title_1="Boost your sale" subtitle_1="The latest design trends meet hand-crafted templates." icon_1="fi fi-rr-leaf" title_2="Introducing New Features" subtitle_2="The latest design trends meet hand-crafted templates." icon_2="fi fi-rr-leaf" primary_url="/" secondary_url="/"][/faq]'
                    ) .
                    $quotation1x .
                    Html::tag(
                        'div',
                        '[testimonials title="Still have a questions?" subtitle="If you cannot find answer to your question in our FAQ, you can always
                    contact us. We wil answer to you shortly! Meet our Support team" style="style-3"][/testimonials]'
                    ),
                'header_css_class' => 'header-style-5',
            ],
            9 => [
                'name' => 'Homepage 2',
                'content' =>
                    Html::tag(
                        'div',
                        '[hero-banner title="Advanced analytics to grow your business" highlight_text="Digital Marketing Agency" subtitle="Integrated workflow designed for product teams. We create world-class development and branding" image="general/balance.png" mini_image="general/payment.png" bg_image_1="general/banner5.png" bg_image_2="homepage1/bg-5.png" primary_title="Get Start" primary_url="/" secondary_title="How it works" secondary_url="/" style="style-4" quantity="3" title_1="Happy Clients" count_1="38" extra_1="k" title_2="Project Done" count_2="45" extra_2="k" title_3="Client Satisfaction" count_3="100" extra_3="%"][/hero-banner]'
                    ) .
                    $companies2 .
                    $howItWorks7 .
                    $weDoYouGet3 .
                    $howItWorks2x .
                    $weDoYouGet2 .
                    Html::tag(
                        'div',
                        '[testimonials title="Our Happy Customers" subtitle="Know about our clients, we are a worldwide corporate brand" style="style-2"][/testimonials]'
                    ) .
                    $quotation1x .
                    $newsletter,
                'template' => 'homepage',
            ],
            10 => [
                'name' => 'Homepage 3',
                'content' =>
                    Html::tag(
                        'div',
                        '[hero-banner title="Advanced analytics to grow your business" highlight_text="Digital Marketing Agency" subtitle="Get a website to be found on the first page of Google  avoid missing out on potential visitors and sales." primary_title="Start free trial" primary_url="/" secondary_title="Learn more" secondary_url="/" style="style-5"][/hero-banner]'
                    ) .
                    $youtubeVideo .
                    $howItWorks2 .
                    $weDoYouGet .
                    Html::tag(
                        'div',
                        '[testimonials title="Don’t take our word for it. See what our clients say." subtitle="Know about our clients, we are a worldwide corporate brand" highlight="Built Exclusively For You" link="/" style="style-4"][/testimonials]'
                    ) .
                    Html::tag(
                        'div',
                        '[faq title="Frequently asked questions" subtitle="Feeling inquisitive? Have a read through some of our FAQs or contact our supporters for help" style="style-2" quantity="2" title_1="Boost your sale" subtitle_1="The latest design trends meet hand-crafted templates." icon_1="fi fi-rr-leaf" title_2="Introducing New Features" subtitle_2="The latest design trends meet hand-crafted templates." icon_2="fi fi-rr-leaf" primary_url="/" secondary_url="/"][/faq]'
                    ) .
                    $ourNews1x .
                    Html::tag(
                        'div',
                        '[contact-form title="Have an project in mind?" subtitle="Aliquam a augue suscipit, luctus neque purus ipsum neque at dolor primis libero tempus, blandit" highlight="Contact us" image="general/email.png" name="Agon Studio" address="4517 Washington Ave. Manchester, Kentucky 39495" phone="(239) 555-0108" email="contact@agon.com"][/contact-form]'
                    ) .
                    $newsletter,
                'template' => 'homepage',
            ],
            11 => [
                'name' => 'Homepage 4',
                'content' =>
                    Html::tag(
                        'div',
                        '[hero-banner title="Advanced analytics to grow your business" highlight_text="Digital Marketing Agency" subtitle="Get a website to be found on the first page of Google  avoid missing out on potential visitors and sales." image="general/banner6.png" video_url="https://www.youtube.com/watch?v=oRI37cOPBQQ" primary_title="Start free trial" primary_url="/" secondary_title="Learn more" secondary_url="/" style="style-6" quantity="3"  title_1="Happy Clients" count_1="5000" extra_1="+" title_2="Project Done" count_2="756" extra_2="+" title_3="Client Satisfaction" count_3="100"  extra_3="%"][/hero-banner]'
                    ) .
                    $youtubeVideo .
                    $howItWorks2 .
                    $weDoYouGet .
                    Html::tag(
                        'div',
                        '[testimonials title="Don’t take our word for it. See what our clients say." subtitle="Know about our clients, we are a worldwide corporate brand" highlight="Built Exclusively For You" link="/" bg_color="#BEE1E6" style="style-4"][/testimonials]'
                    ) .
                    $howItWorks7 .
                    $quotation1x .
                    $ourNews1x .
                    $newsletter,
                'template' => 'homepage',
                'header_css_class' => 'header-style-2',
            ],
            12 => [
                'name' => 'Homepage 5',
                'content' =>
                    Html::tag(
                        'div',
                        '[hero-banner title="Let go of the challenge See yourself better" highlight_text="Exclusive Smart Watch" subtitle="Real-time display of data such as exercise duration, mileage, heart rate, etc" image="general/banner9.png" mini_image="general/chart.png" bg_image_1="general/circle-1.png" bg_image_2="general/circle-2.png" style="style-10" primary_url="/" primary_title="Join Pre-Order" title_1="Anti fingerprints" title_2="Delicate touch" title_3="Hardness screen" title_4="Dust prevention" title_5="3D anti-chip" title_6="Impact resistant"][/hero-banner]'
                    ) .
                    Html::tag('div', '[products-by-category title="" category_id="1"][/products-by-category]') .
                    Html::tag('div', '[featured-products title="Featured Products"][/featured-products]') .
                    Html::tag(
                        'div',
                        '[explore-by-categories title="Explore by Categories" subtitle="We provide many categories, choose a category according to your expertise to make it easier to find a job." link="#"][/explore-by-categories]'
                    ) .
                    $howItWorks4 .
                    $companies2,
                'template' => 'homepage',
            ],
            13 => [
                'name' => 'Homepage 6',
                'content' =>
                    Html::tag(
                        'div',
                        '[hero-banner title="The Fastest way to achieve success" highlight_text="Digital Marketing Agency" subtitle="It was popularised in the 1960s with the release sheets. We bring the right people together" image="general/banner12.png" bg_image_1="general/line-chart.png" bg_image_2="general/balance.png" primary_title="Get Start" primary_url="/" secondary_title="How it works" secondary_url="/" style="style-11"][/hero-banner]'
                    ) .
                    $weDoYouGet5 .
                    $statistical2 .
                    $howItWorks2y .
                    $weDoYouGet4 .
                    $companies .
                    $newsletter .
                    $ourNews1x,
                'template' => 'homepage',
            ],
            14 => [
                'name' => 'Homepage 7',
                'content' =>
                    Html::tag(
                        'div',
                        '[hero-banner title="Advanced analytics to grow your business" subtitle="Feugiat primis ligula risus auctor egestas and augue viverra mauri tortor in iaculis magna a feugiat mauris ipsum and placerat viverra" primary_title="Get Start" primary_url="/" secondary_title="How it works" secondary_url="/" style="style-12"][/hero-banner]'
                    ) .
                    $statistical3 .
                    Html::tag(
                        'div',
                        '[testimonials title="Don’t take our word for it. See what our clients say." subtitle="Know about our clients, we are a worldwide corporate brand" highlight="Built Exclusively For You" link="/" style="style-4"][/testimonials]'
                    ) .
                    $weDoYouGet6 .
                    $ourNews3 .
                    $ourNews2 .
                    $newsletter,
                'template' => 'homepage',
            ],
            15 => [
                'name' => 'Homepage 8',
                'content' =>
                    Html::tag(
                        'div',
                        '[hero-banner title="Search Your Next Holiday from Our Destinations" highlight_text="CHECK OUR BEST PROMOTIONS" subtitle="Get a website to be found on the first page of Google to avoid missing out on potential visitors and sales." image="general/banner15.png" bg_image_1="general/banner13.png" bg_image_2="general/banner14.png" primary_title="Search" primary_url="/" style="style-13"][/hero-banner]'
                    ) .
                    $weDoYouGet7 .
                    $weDoYouGet8 .
                    Html::tag(
                        'div',
                        '[testimonials title="Our Happy Customers" subtitle="Know about our clients, we are a worldwide corporate brand"][/testimonials]'
                    ) .
                    $companies2 .
                    $newsletter,
                'template' => 'homepage',
            ],
            16 => [
                'name' => 'Service 2',
                'content' =>
                    Html::tag(
                        'div',
                        '[hero-banner title="Advanced analytics to grow your business" highlight_text="analytics" subtitle="Connect your conversations with the tools and services that you use to get the job done. With over 1,500 apps and a robust API" image="general/banner10.png" mini_image="general/banner3.png" bg_image_1="general/banner11.png" bg_image_2="general/banner4.png" primary_title="Get Started" primary_url="/" secondary_title="How it works" secondary_url="/" style="style-9"][/hero-banner]'
                    ) .
                    $companies2 .
                    $howItWorks7x .
                    $howItWorks .
                    Html::tag(
                        'div',
                        '[faq title="Frequently asked questions" subtitle="Feeling inquisitive? Have a read through some of our FAQs or contact our supporters for help" style="style-2" quantity="2" title_1="Boost your sale" subtitle_1="The latest design trends meet hand-crafted templates." icon_1="fi fi-rr-leaf" title_2="Introducing New Features" subtitle_2="The latest design trends meet hand-crafted templates." icon_2="fi fi-rr-leaf" primary_url="/" secondary_url="/"][/faq]'
                    ) .
                    $newsletter,
            ],
            17 => [
                'name' => 'Pricing 2',
                'content' =>
                    $quotation3 .
                    $howItWorks2 .
                    $howItWorks7 .
                    Html::tag(
                        'div',
                        '[contact-form title="Have an project in mind?" subtitle="Aliquam a augue suscipit, luctus neque purus ipsum neque at dolor primis libero tempus, blandit" highlight="Contact us" image="general/email.png" name="Agon Studio" address="4517 Washington Ave. Manchester, Kentucky 39495" phone="(239) 555-0108" email="contact@agon.com"][/contact-form]'
                    ) .
                    $newsletter,
            ],
            18 => [
                'name' => 'FAQs 2',
                'content' =>
                    Html::tag(
                        'div',
                        '[faq-ask title="Join the community with more than 12,368 topics already created" subtitle="Professional support team will solve your problem." style="style-2"][/faq-ask]'
                    ) .
                    $howItWorks6 .
                    Html::tag('div', '[faq title="" subtitle="" style="style-1" quantity="1"][/faq]') .
                    $quotation1x .
                    Html::tag(
                        'div',
                        '[testimonials title="Still have a questions?" subtitle="If you cannot find answer to your question in our FAQ, you can always
                    contact us. We wil answer to you shortly! Meet our Support team" style="style-3"][/testimonials]'
                    ),
            ],
            19 => [
                'name' => 'Career',
                'content' =>
                    Html::tag(
                        'div',
                        '[hero-banner title="Working with us, <br> the awesome team" highlight_text="Success Together" subtitle="Our focus is always on finding the best people to work with. Our bar is high, but you look ready to take on the challenge." primary_title="Join our team" primary_url="/" secondary_title="Learn more" secondary_url="/" background_color="#FFFFFF" style="style-5" quantity="6"][/hero-banner]'
                    ) .
                    $youtubeVideo .
                    $weFacilitate1x .
                    Html::tag('div', htmlentities('[career-list title="Choose the category <br> where you expert" description="In a professional context it often happens that private or corporate <br> clients order a publication to publish news." career_ids="1,3,4,5,2,6"][/career-list]')) .
                    Html::tag(
                        'div',
                        '[testimonials title="Why Our Team Is One Of The Best!" subtitle="There are countless great reasons to work at our company and we hate to brag, but it’s too hard not to!" highlight="Built Exclusively For You" link="/" style="style-4"][/testimonials]'
                    ) .
                    $ourNews .
                    $newsletter,
            ],
            20 => [
                'name' => 'Senior Full Stack Engineer, Creator Success Full Time',
                'content' => File::get(database_path('/seeders/contents/career-detail.html')),
                'template' => 'page-detail',
            ],
            21 => [
                'name' => 'About Us 2',
                'content' =>
                    Html::tag(
                        'div',
                        '[hero-banner title="Start Your Dream Business Today" highlight_text="What We Do, What You Get" subtitle="Integrated workflow designed for product teams. We create world-class development and branding" image="general/banner7.png" bg_color="#990099" primary_title="Join Our Team" primary_url="/" secondary_title="Contact Us" secondary_url="/" style="style-7" quantity="3"  title_1="Projects done" count_1="12" extra_1="k" image_1="general/icon-project-done.png" title_2="Offices / Factories" count_2="28" extra_2="k" image_2="general/icon-officer.png" title_3="Constant clients" count_3="15" extra_3="k" image_3="general/icon-constant.png"][/hero-banner]'
                    ) .
                    $howItWorks4 .
                    Html::tag(
                        'div',
                        '[our-news title="Learn about us" subtitle="Know more about our potentiality" number_of_displays="6"][/our-news]'
                    ) .
                    Html::tag(
                        'div',
                        '[faq title="Frequently Asked Questions" subtitle="Feeling inquisitive? Have a read through some of our FAQs or contact our supporters for help"][/faq]'
                    ) .
                    Html::tag(
                        'div',
                        '[contact-form title="Have an project in mind?" subtitle="Aliquam a augue suscipit, luctus neque purus ipsum neque at dolor primis libero tempus, blandit" highlight="Contact us" image="general/email.png" name="Agon Studio" address="4517 Washington Ave. Manchester, Kentucky 39495" phone="(239) 555-0108" email="contact@agon.com"][/contact-form]'
                    ) .
                    Html::tag(
                        'div',
                        '[testimonials title="Don’t take our word for it. See what our clients say." subtitle="Know about our clients, we are a worldwide corporate brand" highlight="Built Exclusively For You" style="style-1"][/testimonials]'
                    ),
                'header_css_class' => 'header-style-3',
            ],
            22 => [
                'name' => 'About Us 3',
                'content' =>
                    Html::tag(
                        'div',
                        '[hero-banner title="Our Story" subtitle="We supply enterprises, organizations and institutes of high-tech industries with modern components. We build long-term trusting relationships with our customers and partnes for further fruitful cooperations." style="style-8"][/hero-banner]'
                    ) .
                    Html::tag(
                        'div',
                        '[youtube-video image="general/bg-video-2.png"]https://www.youtube.com/watch?v=oRI37cOPBQQ[/youtube-video]'
                    ) .
                    $howItWorks2 .
                    Html::tag(
                        'div',
                        '[testimonials title="Don’t take our word for it. See what our clients say." subtitle="Know about our clients, we are a worldwide corporate brand" highlight="Built Exclusively For You" link="/" style="style-4"][/testimonials]'
                    ) .
                    $weDoYouGet1x .
                    $statistical .
                    $howItWorks7x .
                    $ourNews .
                    $newsletter,
            ],
            23 => [
                'name' => 'Blog - 2',
                'content' =>
                    Html::tag(
                        'div',
                        '[page-header title="Our Blog" subtitle="From year to year we strive to invent the most innovative technology that is used by both small enterprises and space enterprises." bg_color="#F2F4F7"][/page-header]'
                    ) .
                    $ourNews2x .
                    $ourNews4 .
                    $newsletter,
            ],
        ];

        foreach ($pages as $item) {
            if (! Arr::has($item, 'template')) {
                $item['template'] = 'default';
            }
            $only = Arr::only($item, ['name', 'content', 'template']);
            $only['user_id'] = 1;
            $page = Page::query()->create($only);

            Slug::query()->create([
                'reference_type' => Page::class,
                'reference_id' => $page->id,
                'key' => Str::slug($page->name),
                'prefix' => SlugHelper::getPrefix(Page::class),
            ]);

            if (Arr::has($item, 'header_css_class')) {
                MetaBox::saveMetaBoxData($page, 'header_css_class', Arr::get($item, 'header_css_class'));
            }
        }
    }

    protected function weAreTrustedShortcode()
    {
        $list = [
            1 => [
                'tab_name' => 'Branding',
                'title' => 'Optimize and scale, easy to start',
                'subtitle' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                'link' => '/',
                'link_title' => 'Learn more',
                'video' => 'https://www.youtube.com/watch?v=oRI37cOPBQQ',
                'image' => 'homepage1/img-1.jpg',
                'bg_color' => '#FFF3EA',
            ],
            2 => [
                'tab_name' => 'Development',
                'title' => 'Design Studios That Everyone Should Know',
                'subtitle' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                'link' => '/',
                'link_title' => 'Learn more',
                'video' => 'https://www.youtube.com/watch?v=oRI37cOPBQQ',
                'image' => 'homepage1/img-2.jpg',
                'bg_color' => '#EAE4E9',
            ],
            3 => [
                'tab_name' => 'Animation',
                'title' => 'We can blend colors multiple ways',
                'subtitle' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                'link' => '/',
                'link_title' => 'Learn more',
                'video' => 'https://www.youtube.com/watch?v=oRI37cOPBQQ',
                'image' => 'homepage1/img-3.jpg',
                'bg_color' => '#FDE2E4',
            ],
            4 => [
                'tab_name' => 'User Experience',
                'title' => 'Choose The Best Plan That\'s For You',
                'subtitle' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                'link' => '/',
                'link_title' => 'Learn more',
                'video' => 'https://www.youtube.com/watch?v=oRI37cOPBQQ',
                'image' => 'homepage1/img-4.jpg',
                'bg_color' => '#FAD2E1',
            ],
            5 => [
                'tab_name' => 'Social Network',
                'title' => 'Subscribe our newsletter to get gift',
                'subtitle' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                'link' => '/',
                'link_title' => 'Learn more',
                'video' => 'https://www.youtube.com/watch?v=oRI37cOPBQQ',
                'image' => 'homepage1/img-5.jpg',
                'bg_color' => '#DBECE5',
            ],
            6 => [
                'tab_name' => 'Marketing',
                'title' => 'Ready to get started? Create and Account',
                'subtitle' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                'link' => '/',
                'link_title' => 'Learn more',
                'video' => 'https://www.youtube.com/watch?v=oRI37cOPBQQ',
                'image' => 'homepage1/img-6.jpg',
                'bg_color' => '#BEE1E6',
            ],
        ];

        $data = [
            'title' => 'See why we are trusted the world over',
            'subtitle' => 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit laborum — semper quis lectus nulla.',
            'background_image' => 'homepage1/bg-3.png',
        ];

        return $this->getShortcode('we-are-trusted', $data, $list);
    }

    protected function getShortcode(string $name, array $data, array $list): HtmlString
    {
        $text = '';

        if (! Arr::get($data, 'quantity')) {
            $data['quantity'] = count($list) ?: 1;
        }

        foreach ($data as $key => $value) {
            $text .= ($key . '="' . $value . '" ');
        }

        foreach ($list as $i => $item) {
            foreach ($item as $key => $value) {
                $text .= ($key . '_' . $i . '="' . $value . '" ');
            }
        }

        return Html::tag('div', '[' . $name . ' ' . $text . '][/' . $name . ']');
    }

    protected function companiesShortcode(?string $style = '1'): HtmlString
    {
        $list = [
            1 => [
                'title' => 'Agon',
                'image' => 'company/1.png',
                'link' => '#',
            ],
            2 => [
                'title' => 'Monst',
                'image' => 'company/2.png',
                'link' => '#',
            ],
            3 => [
                'title' => 'Figwire',
                'image' => 'company/3.png',
                'link' => '#',
            ],
            4 => [
                'title' => 'Evara',
                'image' => 'company/4.png',
                'link' => '#',
            ],
            5 => [
                'title' => 'Frox',
                'image' => 'company/5.png',
                'link' => '#',
            ],
            6 => [
                'title' => 'Alithemes',
                'image' => 'company/6.png',
                'link' => '#',
            ],
        ];

        $data = [
            'title' => '',
        ];

        if ($style == '2') {
            $list = array_merge($list, [
                7 => [
                    'title' => 'NestMart',
                    'image' => 'company/7.png',
                    'link' => '#',
                ],
                8 => [
                    'title' => 'TheFlow',
                    'image' => 'company/8.png',
                    'link' => '#',
                ],
                9 => [
                    'title' => 'stacker',
                    'image' => 'company/9.png',
                    'link' => '#',
                ],
            ]);

            $data['subtitle'] = 'Trusted by the world’s leading companies';
        }

        return $this->getShortcode('companies', $data, $list);
    }

    protected function weFacilitateShortcode(?string $style = '1', array $extraData = []): HtmlString
    {
        switch ($style) {
            case '2':
                $list = [
                    1 => [
                        'title' => 'Business Strategy',
                        'subtitle' => 'You are always welcome to visit our little den. Professional in teir craft! All products were super amazing with strong attension to details, comps and overall vibe.',
                        'image' => 'homepage1/business-strategy.png',
                        'border_color' => '#FAD2E1',
                        'bg_color' => '#DBECE5',
                    ],
                    2 => [
                        'title' => 'Local Marketing',
                        'subtitle' => 'You are always welcome to visit our little den. Professional in teir craft! All products were super amazing with strong attension to details, comps and overall vibe.',
                        'image' => 'homepage1/local.png',
                        'border_color' => '#BEE1E6',
                        'bg_color' => '#D1ECFD',
                    ],
                    3 => [
                        'title' => 'Social media',
                        'subtitle' => 'You are always welcome to visit our little den. Professional in teir craft! All products were super amazing with strong attension to details, comps and overall vibe.',
                        'image' => 'homepage1/social.png',
                        'border_color' => '#FAD2E1',
                        'bg_color' => '#FFF3EA',
                    ],
                ];

                $data = [
                    'title' => 'Bringing the world’s ideas to life',
                    'subtitle' => 'Developers are trusted to create an engaging experience for their companies, so we build tools to help them.',
                    'highlight' => 'What We Do, What You Get',
                ];

                break;
            case '1x':
                $list = [
                    1 => [
                        'title' => 'Design & Creatives',
                        'subtitle' => 'You are always welcome to visit our little den. Professional in teir craft! All products were super amazing with strong attension to details, comps and overall vibe.',
                        'image' => 'homepage1/business-strategy.png',
                        'bottom_image' => 'homepage1/business-white.png',
                        'bg_color' => '#DBECE5',
                    ],
                    2 => [
                        'title' => 'Work and travel',
                        'subtitle' => 'You are always welcome to visit our little den. Professional in teir craft! All products were super amazing with strong attension to details, comps and overall vibe.',
                        'image' => 'homepage1/local.png',
                        'bottom_image' => 'homepage1/local-white.png',
                        'bg_color' => '#D1ECFD',
                    ],
                    3 => [
                        'title' => 'Smart salary',
                        'subtitle' => 'You are always welcome to visit our little den. Professional in teir craft! All products were super amazing with strong attension to details, comps and overall vibe.',
                        'image' => 'homepage1/social.png',
                        'bottom_image' => 'homepage1/social-white.png',
                        'bg_color' => '#FFF3EA',
                    ],
                ];

                $data = [
                    'title' => 'Join a Workplace That Gives You More',
                    'subtitle' => 'Interactively transform magnetic growth strategies whereas prospective “outside the box” thinking.',
                ];

                break;
            default:
                $list = [
                    1 => [
                        'title' => 'Business Strategy',
                        'subtitle' => 'You are always welcome to visit our little den. Professional in teir craft! All products were super amazing with strong attension to details, comps and overall vibe.',
                        'image' => 'homepage1/business-strategy.png',
                        'bottom_image' => 'homepage1/business-white.png',
                        'bg_color' => '#DBECE5',
                    ],
                    2 => [
                        'title' => 'Local Marketing',
                        'subtitle' => 'You are always welcome to visit our little den. Professional in teir craft! All products were super amazing with strong attension to details, comps and overall vibe.',
                        'image' => 'homepage1/local.png',
                        'bottom_image' => 'homepage1/local-white.png',
                        'bg_color' => '#D1ECFD',
                    ],
                    3 => [
                        'title' => 'Social media',
                        'subtitle' => 'You are always welcome to visit our little den. Professional in teir craft! All products were super amazing with strong attension to details, comps and overall vibe.',
                        'image' => 'homepage1/social.png',
                        'bottom_image' => 'homepage1/social-white.png',
                        'bg_color' => '#FFF3EA',
                    ],
                ];

                $data = [
                    'title' => 'We facilitate the creation of strategy and design',
                    'subtitle' => 'Interactively transform magnetic growth strategies whereas prospective “outside the box” thinking.',
                ];

                break;
        }

        $data['style'] = 'style-' . $style;
        $data = array_merge($data, $extraData);

        return $this->getShortcode('we-facilitate', $data, $list);
    }

    protected function weDoYouGetShortcode(?string $style = '1', array $extraData = []): HtmlString
    {
        switch ($style) {
            case '2':
                $list = [
                    1 => [
                        'title' => 'Boost your sale',
                        'subtitle' => 'The latest design trends meet hand-crafted templates.',
                        'icon' => 'fi fi-rr-leaf',
                    ],
                    2 => [
                        'title' => 'Smart Installation Tools',
                        'subtitle' => 'The latest design trends meet hand-crafted templates.',
                        'icon' => 'fi fi-rr-leaf',
                    ],
                    3 => [
                        'title' => 'Introducing New Features',
                        'subtitle' => 'The latest design trends meet hand-crafted templates.',
                        'icon' => 'fi fi-rr-leaf',
                    ],
                    4 => [
                        'title' => 'Dynamic Boosting',
                        'subtitle' => 'The latest design trends meet hand-crafted templates.',
                        'icon' => 'fi fi-rr-leaf',
                    ],
                ];

                $data = [
                    'title' => 'From the big picture to every tiny detail, we got you covered.',
                    'subtitle' => 'Necessary to deliver white glove, fully managed campaigns that surpass industry benchmarks.Take your career to next level. Apply to our team and see what we can do together. You’re good enough.',
                    'highlight' => 'Built Exclusively For You',
                    'image' => 'general/img-built.png',
                    'mini_image' => 'general/img-built-2.png',
                ];

                break;
            case '3':
                $list = [
                    1 => [
                        'title' => 'Work smarter with powerful features',
                        'subtitle' => 'Aliquam a augue suscipit, luctus neque purus ipsum neque at dolor primis libero tempus, blandit',
                        'image' => 'general/icon-work.png',
                    ],
                    2 => [
                        'title' => 'Designed for teams of all sorts and sizes',
                        'subtitle' => 'Aliquam a augue suscipit, luctus neque purus ipsum neque at dolor primis libero tempus, blandit',
                        'image' => 'general/icon-design.png',
                    ],
                    3 => [
                        'title' => 'Advanced analytics to grow your business',
                        'subtitle' => 'Aliquam a augue suscipit, luctus neque purus ipsum neque at dolor primis libero tempus, blandit',
                        'image' => 'general/icon-advance.png',
                    ],
                ];

                $data = [
                    'title' => 'Fresh Ideas. Thoughtful Design.',
                    'subtitle' => 'Feugiat primis ligula risus auctor egestas and augue viverra mauri tortor in iaculis magna a feugiat mauris ipsum and placerat viverra tortor gravida purus.',
                    'highlight' => 'What We Do, What You Get',
                    'image' => 'general/img-2.png',
                    'mini_image' => 'general/chart.png',
                ];

                break;
            case '4':
                $list = [
                    1 => [
                        'title' => 'Boost your sale',
                        'icon' => 'fi fi-rr-leaf',
                    ],
                    2 => [
                        'title' => 'Smart Installation Tools',
                        'icon' => 'fi fi-rr-leaf',
                    ],
                    3 => [
                        'title' => 'Introducing New Features',
                        'icon' => 'fi fi-rr-leaf',
                    ],
                    4 => [
                        'title' => 'Dynamic Boosting',
                        'icon' => 'fi fi-rr-leaf',
                    ],
                ];

                $data = [
                    'title' => 'Exceptional Solution for Digital Business Model',
                    'subtitle' => 'In a professional context it often happens that private or corporate clients order a publication news while still not being ready.',
                    'highlight' => 'What We Do, What You Get',
                    'image' => 'general/img-6.png',
                ];

                break;
            case '5':
                $list = [
                    1 => [
                        'title' => 'Computer for Designer, Art',
                        'icon' => 'fi fi-rr-camera',
                        'image' => 'general/img-7.png',
                    ],
                    2 => [
                        'title' => 'Computer for Designer, Art',
                        'icon' => 'fi fi-rr-briefcase',
                        'image' => 'general/img-8.png',
                    ],
                    3 => [
                        'title' => 'Computer for Designer, Art',
                        'subtitle' => 'Real-time display of data',
                        'icon' => 'fi fi-rr-building',
                        'image' => 'general/img-9.png',
                    ],
                ];

                $data = [];

                break;
            case '6':
                $list = [
                    1 => [
                        'title' => 'Boost your sale',
                        'subtitle' => 'The latest design trends meet hand-crafted templates.',
                        'icon' => 'fi fi-rr-leaf',
                    ],
                    2 => [
                        'title' => 'Smart Installation Tools',
                        'subtitle' => 'The latest design trends meet hand-crafted templates.',
                        'icon' => 'fi fi-rr-leaf',
                    ],
                    3 => [
                        'title' => 'Introducing New Features',
                        'subtitle' => 'The latest design trends meet hand-crafted templates.',
                        'icon' => 'fi fi-rr-leaf',
                    ],
                    4 => [
                        'title' => 'Dynamic Boosting',
                        'subtitle' => 'The latest design trends meet hand-crafted templates.',
                        'icon' => 'fi fi-rr-leaf',
                    ],
                ];

                $data = [
                    'title' => 'Our Process',
                    'subtitle' => 'How we work',
                    'image' => 'general/chart.png',
                    'mini_image' => 'general/safety.png',
                    'background' => 'general/img-10.png',
                ];

                break;
            case '7':
                $list = [
                    1 => [
                        'title' => 'Account',
                        'subtitle' => 'All the necessary information to create your account are below this.',
                        'image' => 'general/user.png',
                    ],
                    2 => [
                        'title' => 'Select Destination',
                        'subtitle' => 'Aliquam a augue suscipit, luctus neque purus ipsum neque at dolor primis libero tempus, blandit',
                        'image' => 'general/destination.png',
                    ],
                    3 => [
                        'title' => 'Book a Trip',
                        'subtitle' => 'Aliquam a augue suscipit, luctus neque purus ipsum neque at dolor primis libero tempus, blandit',
                        'image' => 'general/trip.png',
                    ],
                    4 => [
                        'title' => 'Take your flight',
                        'subtitle' => 'Aliquam a augue suscipit, luctus neque purus ipsum neque at dolor primis libero tempus, blandit',
                        'image' => 'general/flight.png',
                    ],
                ];

                $data = [
                    'title' => 'How does it works',
                    'subtitle' => 'We find the absolute best prices on hotels & flights then we pass these savings directly to you.',
                    'image' => 'general/img-11.png',
                ];

                break;
            case '8':
                $list = [
                    1 => [
                        'title' => 'Best Price Guarantee',
                        'subtitle' => 'Aliquam a augue suscipit, luctus neque purus ipsum neque at dolor primis libero tempus, blandit',
                        'image' => 'general/icon-work.png',
                    ],
                    2 => [
                        'title' => 'Easy & Quick Booking',
                        'subtitle' => 'Aliquam a augue suscipit, luctus neque purus ipsum neque at dolor primis libero tempus, blandit',
                        'image' => 'general/icon-design.png',
                    ],
                ];

                $data = [
                    'title' => 'A Simply Perfect Place To Get Lost',
                    'subtitle' => 'Feugiat primis ligula risus auctor egestas and augue viverra mauri tortor in iaculis magna a feugiat mauris ipsum and placerat viverra tortor gravida purus.',
                    'image' => 'general/img-12.png',
                ];

                break;
            default:
                $list = [
                    1 => [
                        'title' => 'Automated reports',
                        'subtitle' => 'The latest design trends meet hand-crafted templates.',
                        'icon' => 'fi fi-rr-leaf',
                    ],
                    2 => [
                        'title' => 'Realtime analytics',
                        'subtitle' => 'The latest design trends meet hand-crafted templates.',
                        'icon' => 'fi fi-rr-leaf',
                    ],
                    3 => [
                        'title' => 'Funnel optimization',
                        'subtitle' => 'The latest design trends meet hand-crafted templates.',
                        'icon' => 'fi fi-rr-leaf',
                    ],
                    4 => [
                        'title' => 'User journey',
                        'subtitle' => 'The latest design trends meet hand-crafted templates.',
                        'icon' => 'fi fi-rr-leaf',
                    ],
                ];

                $data = [
                    'title' => 'We believe that our works can contribute to a better world.',
                    'subtitle' => 'Necessary to deliver white glove, fully managed campaigns that surpass industry benchmarks. Take your career to next level.',
                    'highlight' => 'What We Do, What You Get',
                    'image' => 'homepage1/img-7.png',
                ];

                break;
        }

        $data['style'] = 'style-' . $style;

        $data = array_merge($data, $extraData);

        return $this->getShortcode('we-do-you-get', $data, $list);
    }

    protected function howItWorksShortcode(?string $style = '1', array $extraData = []): HtmlString
    {
        switch ($style) {
            case '2':
                $list = [
                    1 => [
                        'title' => 'Acquisition',
                        'subtitle' => 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit laborum — semper quis lectus nulla.',
                        'image' => 'general/icon-acquis.png',
                    ],
                    2 => [
                        'title' => 'Activation',
                        'subtitle' => 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit laborum — semper quis lectus nulla.',
                        'image' => 'general/icon-active.png',
                    ],
                    3 => [
                        'title' => 'Retention',
                        'subtitle' => 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit laborum — semper quis lectus nulla.',
                        'image' => 'general/icon-retent.png',
                    ],
                ];

                $data = [
                    'title' => 'Providing solutions of every kind',
                    'subtitle' => 'In a professional context it often happens that private or corporate clients order a publication to publish news.',
                    'background_image' => 'homepage1/bg-4.png',
                ];

                break;

            case '3':
                $list = [
                    1 => [
                        'title' => 'Acquisition',
                        'subtitle' => 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit laborum — semper quis lectus nulla.',
                        'image' => 'general/icon-acquis.png',
                    ],
                    2 => [
                        'title' => 'Activation',
                        'subtitle' => 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit laborum — semper quis lectus nulla.',
                        'image' => 'general/icon-active.png',
                    ],
                    3 => [
                        'title' => 'Retention',
                        'subtitle' => 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit laborum — semper quis lectus nulla.',
                        'image' => 'general/icon-retent.png',
                    ],
                ];

                $data = [
                    'title' => 'How It Works',
                    'subtitle' => 'Ac sapien purus tristique neque nibh vitae faucibus non phasellus vulputate nulla in eget amet, risus',
                ];

                break;
            case '4':
                $list = [
                    1 => [
                        'title' => 'Start Plan',
                        'subtitle' => 'Choose any of our packages',
                        'image' => 'general/icon-start-plan.png',
                    ],
                    2 => [
                        'title' => 'Connect',
                        'subtitle' => 'Receive concepts In 24 hours',
                        'image' => 'general/icon-connect.png',
                    ],
                    3 => [
                        'title' => 'Match',
                        'subtitle' => 'Development Stage',
                        'image' => 'general/icon-match.png',
                        'bg_color' => '#DBECE5',
                    ],
                    4 => [
                        'title' => 'Review',
                        'subtitle' => 'Project launch and checkout',
                        'image' => 'general/icon-review.png',
                        'bg_color' => '#D1ECFD',
                    ],
                    5 => [
                        'title' => 'Complete',
                        'subtitle' => 'After-release Support',
                        'image' => 'general/icon-complete.png',
                        'bg_color' => '#DBECE5',
                    ],
                ];

                $data = [
                    'title' => 'How It Works',
                    'subtitle' => 'Elevate your Employee Development Journey',
                ];

                break;
            case '5':
                $list = [
                    1 => [
                        'title' => 'Support Engineer',
                        'subtitle' => 'We commit to original work of the highest standard and giving credit where it’s due.',
                        'image' => 'general/icon-support.png',
                    ],
                    2 => [
                        'title' => 'Web Developer',
                        'subtitle' => 'We become a bonafide agency with a tiny team of 3 and then hire our first developers',
                        'image' => 'general/icon-web.png',
                    ],
                    3 => [
                        'title' => 'Business Analyst',
                        'subtitle' => 'We create our first campaign for Kaleidoscope Tech and it goes viral',
                        'image' => 'general/icon-business.png',
                    ],
                    4 => [
                        'title' => 'Product Designer',
                        'subtitle' => 'With a growing body of work, we bring more artists, designers on board.',
                        'image' => 'general/icon-product.png',
                    ],
                    5 => [
                        'title' => 'Share stories',
                        'subtitle' => 'We commit to original work of the highest standard and giving credit where it’s due.',
                        'image' => 'general/icon-share.png',
                    ],
                    6 => [
                        'title' => 'Support Engineer',
                        'subtitle' => 'We commit to original work of the highest standard and giving credit where it’s due.',
                        'image' => 'general/icon-build.png',
                    ],
                    7 => [
                        'title' => 'Support Engineer',
                        'subtitle' => 'We commit to original work of the highest standard and giving credit where it’s due.',
                        'image' => 'general/icon-team.png',
                    ],
                ];

                $data = [
                    'title' => 'What We Do',
                    'subtitle' => 'We’re always looking for new faces and fresh ideas',
                ];

                break;
            case '6x':
                $list = [
                    1 => [
                        'title' => 'Graphic designer',
                        'subtitle' => 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit laborum — semper quis lectus nulla.',
                        'image' => 'general/icon-acquis.png',
                    ],
                    2 => [
                        'title' => 'Web Developer',
                        'subtitle' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        'image' => 'general/icon-active.png',
                    ],
                    3 => [
                        'title' => 'Data scientistn',
                        'subtitle' => 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        'image' => 'general/icon-retent.png',
                    ],
                    4 => [
                        'title' => 'Technical Support',
                        'subtitle' => 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit laborum — semper quis lectus nulla.',
                        'image' => 'general/icon-acquis.png',
                    ],
                    5 => [
                        'title' => 'Digital Marketing',
                        'subtitle' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        'image' => 'general/icon-active.png',
                    ],
                    6 => [
                        'title' => 'UI/UX designer',
                        'subtitle' => 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        'image' => 'general/icon-retent.png',
                    ],
                ];

                $data = [
                    'title' => 'Choose the category where you expert',
                    'subtitle' => 'In a professional context it often happens that private or corporate clients order a publication to publish news.',
                ];

                break;
            case '6':
                $list = [
                    1 => [
                        'title' => 'Market research',
                        'subtitle' => 'One make creepeth, man bearing theira firmament.',
                        'image' => 'homepage1/market.png',
                    ],
                    2 => [
                        'title' => 'Strategic Consulting',
                        'subtitle' => 'One make creepeth, man bearing theira firmament.',
                        'image' => 'homepage1/consulting.png',
                    ],
                    3 => [
                        'title' => 'Cognitive Solution',
                        'subtitle' => 'One make creepeth, man bearing theira firmament.',
                        'image' => 'homepage1/cognity.png',
                    ],
                ];

                $data = [
                    'title' => 'Or choose a category',
                    'subtitle' => 'Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus, blandit and cursus varius and magnis sapien',
                ];

                break;
            case '7':
                $list = [
                    1 => [
                        'title' => 'Cross-Platform',
                        'subtitle' => 'Your site is not complete with only landings. Get essential inner pages using our ready demos.',
                        'image' => 'general/temp-1.png',
                    ],
                    2 => [
                        'title' => 'Extremely Flexible',
                        'subtitle' => 'Your site is not complete with only landings. Get essential inner pages using our ready demos.',
                        'image' => 'general/temp-2.png',
                    ],
                ];

                $data = [
                    'title' => 'Discover powerful features to boost your productivity',
                    'subtitle' => 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit laborum — semper quis lectus nulla.',
                ];

                break;
            default:
                $list = [
                    1 => [
                        'title' => 'Market research',
                        'subtitle' => 'One make creepeth, man bearing theira firmament.',
                        'image' => 'homepage1/market.png',
                    ],
                    2 => [
                        'title' => 'Strategic Consulting',
                        'subtitle' => 'One make creepeth, man bearing theira firmament.',
                        'image' => 'homepage1/consulting.png',
                    ],
                    3 => [
                        'title' => 'Cognitive Solution',
                        'subtitle' => 'One make creepeth, man bearing theira firmament.',
                        'image' => 'homepage1/cognity.png',
                    ],
                ];

                $data = [
                    'title' => 'What We Offer',
                    'subtitle' => 'What makes us different from others? We give holistic solutions with strategy, design & technology.',
                ];

                break;
        }

        $data['style'] = 'style-' . $style;

        $data = array_merge($data, $extraData);

        return $this->getShortcode('how-it-works', $data, $list);
    }

    protected function quotationShortcode(?string $style = '1', array $extraData = []): string
    {
        switch ($style) {
            case '3':
                $list = [
                    1 => [
                        'title' => 'Standard',
                        'subtitle' => 'Save %20',
                        'month_price' => '$35',
                        'year_price' => '$420',
                        'link' => '/',
                        'checked' => 'Unlimited updates;Custom designs & features;Custom permissions',
                        'uncheck' => 'Custom instructors;Many devices',
                    ],
                    2 => [
                        'title' => 'Essentials',
                        'subtitle' => 'Save %20',
                        'month_price' => '$89',
                        'year_price' => '$1068',
                        'link' => '/',
                        'checked' => 'Unlimited updates;Custom designs & features;Custom permissions',
                        'uncheck' => 'Custom instructors;Many devices',
                    ],
                    3 => [
                        'title' => 'Premium',
                        'subtitle' => 'Save %20',
                        'month_price' => '$125',
                        'year_price' => '$1500',
                        'link' => '/',
                        'checked' => 'Unlimited updates;Custom designs & features;Custom permissions;Custom instructors',
                        'uncheck' => 'Many devices',
                    ],
                    4 => [
                        'title' => 'Unlimited',
                        'subtitle' => 'Save %20',
                        'month_price' => '$199',
                        'year_price' => '$2388',
                        'link' => '/',
                        'checked' => 'Unlimited updates;Custom designs & features;Custom permissions;Custom instructors;Many devices',
                    ],
                ];

                $data = [
                    'title' => 'Choose The Best Plan That’s For You',
                    'subtitle' => '',
                ];
                $data['primary_title'] = 'Start free trial';
                $data['primary_url'] = '/';
                $data['secondary_title'] = 'View plans comparison';
                $data['secondary_url'] = '/';
                $data['background_image_1'] = 'homepage1/bg-1.png';
                $data['background_image_2'] = 'homepage1/bg-2.png';

                break;

            case '2':
                $list = [
                    1 => [
                        'title' => 'Standard',
                        'subtitle' => 'All the basics for businesses that are just getting started.',
                        'month_price' => '$35',
                        'year_price' => '$420',
                        'link' => '/',
                        'checked' => 'Unlimited updates;Custom permissions',
                        'uncheck' => 'Custom designs & features;Custom hashtags',
                    ],
                    2 => [
                        'title' => 'Essentials',
                        'subtitle' => 'All the basics for businesses that are just getting started.',
                        'month_price' => '$89',
                        'year_price' => '$1068',
                        'link' => '/',
                        'checked' => 'Unlimited updates;Custom permissions;Custom instructors',
                        'uncheck' => 'Optimize hashtags',
                        'active' => 'yes',
                    ],
                    3 => [
                        'title' => 'Premium',
                        'subtitle' => 'Advanced features for pros who need more customization.',
                        'month_price' => '$125',
                        'year_price' => '$1500',
                        'link' => '/',
                        'checked' => 'Unlimited updates;Custom designs & features;Custom permissions;Optimize hashtags;Custom instructors',
                    ],
                    4 => [
                        'title' => 'Unlimited',
                        'subtitle' => 'Advanced features for pros who need more customization.',
                        'month_price' => '$199',
                        'year_price' => '$2388',
                        'link' => '/',
                        'checked' => 'Unlimited updates;Custom designs & features;Custom permissions;Optimize hashtags;Custom instructors',
                    ],
                ];

                $data = [
                    'title' => 'Choose The Best Plan That’s For You',
                    'subtitle' => '',
                ];

                break;

            default:
                $list = [
                    1 => [
                        'title' => 'Standard',
                        'subtitle' => 'All the basics for businesses that are just getting started.',
                        'month_price' => '$35',
                        'year_price' => '$420',
                        'link' => '/',
                        'checked' => 'Unlimited updates;Custom permissions',
                        'uncheck' => 'Custom designs & features;Custom hashtags',
                    ],
                    2 => [
                        'title' => 'Essentials',
                        'subtitle' => 'All the basics for businesses that are just getting started.',
                        'month_price' => '$89',
                        'year_price' => '$1068',
                        'link' => '/',
                        'checked' => 'Unlimited updates;Custom permissions;Custom instructors',
                        'uncheck' => 'Optimize hashtags',
                    ],
                    3 => [
                        'title' => 'Premium',
                        'subtitle' => 'Advanced features for pros who need more customization.',
                        'month_price' => '$125',
                        'year_price' => '$1500',
                        'link' => '/',
                        'checked' => 'Unlimited updates;Custom designs & features;Custom permissions;Optimize hashtags;Custom instructors',
                    ],
                ];

                $data = [
                    'title' => 'Choose The Best Plan That’s For You',
                    'subtitle' => '',
                    'background_image_1' => 'homepage1/bg-1.png',
                    'background_image_2' => 'homepage1/bg-2.png',
                ];

                break;
        }

        $data['style'] = 'style-' . $style;
        $data = array_merge($data, $extraData);

        return $this->getShortcode('quotation', $data, $list);
    }

    protected function statisticalShortcode(?string $style = '1', array $extraData = []): HtmlString
    {
        $data = [];

        switch ($style) {
            case '2':
                $list = [
                    1 => [
                        'title' => 'Our Office',
                        'subtitle' => 'We always provide people a complete solution upon focused of any business',
                        'count' => 38,
                        'extra' => 'k',
                    ],
                    2 => [
                        'title' => 'Completed Cases',
                        'subtitle' => 'We always provide people a complete solution upon focused of any business',
                        'count' => 12,
                        'extra' => 'k+',
                    ],
                    3 => [
                        'title' => 'Countries / Offices',
                        'subtitle' => 'We always provide people a complete solution upon focused of any business',
                        'count' => 17,
                        'extra' => 'k+',
                    ],
                    4 => [
                        'title' => 'Constant Clients',
                        'subtitle' => 'We always provide people a complete solution upon focused of any business',
                        'count' => 18,
                        'extra' => 'k+',
                    ],
                ];

                $data = [
                    'title' => 'Tell us about your business, we are ready to solve.',
                    'primary_url' => '/',
                    'primary_title' => 'Get A Quote',
                    'featured' => 'Subscribe Newsletter;Get The Latest News',
                ];

                break;
            case '3':
                $list = [
                    1 => [
                        'title' => 'Completed Cases',
                        'subtitle' => 'We always provide people a complete solution upon focused of any business',
                        'count' => 27,
                        'extra' => 'k+',
                    ],
                    2 => [
                        'title' => 'Our Office',
                        'subtitle' => 'We always provide people a complete solution upon focused of any business',
                        'count' => 12,
                        'extra' => 'k+',
                    ],
                    3 => [
                        'title' => 'Skilled People',
                        'subtitle' => 'We always provide people a complete solution upon focused of any business',
                        'count' => 21,
                        'extra' => 'k+',
                    ],
                    4 => [
                        'title' => 'Happy Clients',
                        'subtitle' => 'We always provide people a complete solution upon focused of any business',
                        'count' => 12,
                        'extra' => 'k+',
                    ],
                ];

                break;

            default:
                $list = [
                    1 => [
                        'title' => 'Years in Business',
                        'count' => 5,
                    ],
                    2 => [
                        'title' => 'Projects Done',
                        'count' => 6,
                        'extra' => 'k',
                    ],
                    3 => [
                        'title' => 'Countries / Offices',
                        'count' => 12,
                    ],
                    4 => [
                        'title' => 'Constant Clients',
                        'count' => 11,
                        'extra' => 'k',
                    ],
                ];

                break;
        }

        $data['style'] = 'style-' . $style;
        $data = array_merge($data, $extraData);

        return $this->getShortcode('statistical', $data, $list);
    }

    protected function ourTeamShortcode(): string
    {
        $list = [];
        for ($i = 1; $i <= 16; $i++) {
            $list[$i] = [
                'name' => 'Theresa Webb',
                'position' => 'Marketing CEO',
                'image' => 'general/team-' . (($i - 1) % 8 + 1) . '.png',
                'description' => 'Lorem ipsum dolor sit amet consectetur imp adipiscing elit justo',
                'facebook' => 'https://fb.com',
                'twitter' => 'https://twitter.com',
                'instagram' => 'https://instagram.com',
                'linkedin' => 'https://linkedin.com',
            ];
        }

        $data = [
            'title' => 'Our Team',
            'subtitle' => 'Decades of experience in design and development',
        ];

        return $this->getShortcode('our-team', $data, $list);
    }

    protected function ourLocationShortcode(): HtmlString
    {
        $list = [
            1 => [
                'title' => 'Office',
                'address' => '205 North Michigan Avenue, Suite 810 Chicago, 60601, USA',
                'phone' => '(123) 456-7890',
                'email' => 'contact@Evara.com',
                'image' => 'general/icon-acquis.png',
            ],
            2 => [
                'title' => 'Studio',
                'address' => '205 North Michigan Avenue, Suite 810 Chicago, 60601, USA',
                'phone' => '(123) 456-7890',
                'email' => 'contact@Evara.com',
                'image' => 'general/icon-active.png',
            ],
            3 => [
                'title' => 'Factory',
                'address' => '205 North Michigan Avenue, Suite 810 Chicago, 60601, USA',
                'phone' => '(123) 456-7890',
                'email' => 'contact@Evara.com',
                'image' => 'general/icon-retent.png',
            ],
        ];

        $data = [
            'title' => 'Our Location',
            'subtitle' => 'In a professional context it often happens that private or corporate clients order a publication to publish news.',
        ];

        return $this->getShortcode('our-location', $data, $list);
    }
}
