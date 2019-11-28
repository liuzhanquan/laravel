<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('admin.home');
    $router->resource('Goods', 'GoodsController');
    $router->resource('GoodsSpec', GoodsSpecController::class);
    $router->resource('Users', UsersController::class);
    $router->resource('Order', OrderController::class);
    $router->resource('Coupon', CouponController::class);
    $router->resource('Agent', AgentController::class);
    $router->resource('UserCoupon', UserCouponController::class);
    $router->resource('Pay', PayController::class);
    
    $router->any('GoodsSon/{id?}', 'GoodsSonController@index');



    //用户搜索
    $router->any('api/userfind','api\UsersController@userfind');
    $router->any('api/goodsfind','api\GoodsController@goodsfind');
    $router->any('api/goodssonfind','api\GoodsSonController@goodssonfind');
    $router->any('api/agentfind','api\AgentController@agentfind');
    $router->any('api/couponfind','api\CouponController@couponfind');
    $router->any('api/couponSel','api\CouponController@couponSel');
    $router->any('api/usercouponSel','api\UserCouponController@usercouponSel');
    $router->any('api/UserCouponfind','api\UserCouponController@UserCouponfind');
    $router->any('api/payAll','api\PayController@payAll');
});
