<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Traits\AdminBuilder;
use Encore\Admin\Traits\ModelTree;

class Pay extends Model
{
    use ModelTree, AdminBuilder;
    protected $table = 'pay';
    //


}
