<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Traits\AdminBuilder;
use Encore\Admin\Traits\ModelTree;

class GoodsSpecs extends Model
{
    use ModelTree, AdminBuilder;
    protected $table = 'goods_specs';
    protected $fillable = ['id','name','sort','updated_at','created_at','status','title','parent_id'];
    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->setParentColumn('parent_id');
        $this->setTitleColumn('name');
        $this->setOrderColumn('sort');
        
    }
    //
    public function getall(){
        return $this->hasOne($this,'id','parent');
    }


}
