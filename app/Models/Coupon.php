<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use App\Models\GoodsSon;
use App\Models\Agent;
use App\Models\Goods;
use Illuminate\Support\Facades\DB;

class Coupon extends Model
{
    protected $table = 'coupon';

    public function getinfo($id){
        
        $coupon = $this->leftjoin('agent','agent.id','=','coupon.aid')
        ->leftjoin('goods','goods.id','=','coupon.gid')
        ->where('coupon.id',$id)
        ->select('goods.title','agent.name','coupon.id','coupon.level','coupon.price')
        ->first();
        
        $str = '';
        if( $coupon->title != '' ){
            $str = $str.$coupon->title .'(商品名)-';
        }
        if( $coupon->name != '' ){
            $str = $str.$coupon->name .'(代理商名)-';
        }

        switch($coupon->type){
            case 0:
                $type = '全部订单';
                break;
            case 1:
                $type = '代理商商品';
                break;
            default:
                $type = '当前商品';
                break;
        }
        $str = $str.$coupon->price.'(金额) 【作用范围：'.$type.'】';
        $data['id']=$coupon->id;
        $data['str'] = $str;
        return $data;

    }

    //关联代理商表
    public function agent(){
        return $this->hasOne(Agent::class,'id','aid');
    }

    //关联商品表
    public function goods(){
        return $this->hasOne(Goods::class,'id','gid');
    }

}
