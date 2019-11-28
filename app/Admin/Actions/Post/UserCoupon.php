<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\RowAction;

class UserCoupon extends RowAction
{
    public $name = '优惠券';

    /**
     * @return string
     */
    public function href()
    {
        
        return "/admin/UserCoupon?uid=".$this->getkey();
    }
}