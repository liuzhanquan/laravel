<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use App\Models\GoodsSon;
use Illuminate\Support\Facades\DB;
class Order extends Model
{
    protected $table = 'order';

    public function getall(){
        return 11;
    }

    public function goodsson($id){
        return DB::table('goods_son')->where(['pid'=>$id,'status'=>1])->select('pro_num','type','price','num','created_at')->get();
        
    }


}
