<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\RowAction;

class Specs extends RowAction
{
    public $name = '规格属性';

    /**
     * @return string
     */
    public function href()
    {
        
        return "/admin/GoodsSon/".$this->getkey();
    }
}