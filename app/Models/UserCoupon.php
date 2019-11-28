<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use App\Models\GoodsSon;
use App\Models\Users;
use Illuminate\Support\Facades\DB;
class UserCoupon extends Model
{
    protected $table = 'user_coupon';

    public function users(){
        return $this->hasOne(Users::class,'id','uid');
    }

    public function getinfo($id){   
        $data =  UserCoupon::leftjoin('coupon','coupon.id','=','user_coupon.cid')
                    ->where('user_coupon.status','=','1')
                    ->where('user_coupon.use_status','=','1')
                    ->where('user_coupon.id',$id)
                    ->select('user_coupon.id as id', 'coupon.price as text','coupon.aid as aid','coupon.gid as gid','coupon.level as type')
                    ->first();
        
        
        $arr = [];
            
            $str = '';
            if( $data->gid != '' ){
                $title = DB::table('goods')->where('id',$data->gid)->value('name');
                $str = $str.$title .'(商品名)-';
            }
            if( $data->aid != '' ){
                $name = DB::table('agent')->where('id',$data->aid)->value('name');
                $str = $str.$name .'(代理商名)-';
            }
            
            switch($data->type){
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
            $str = $str.$data->text.'(金额) 【作用范围：'.$type.'】';
            //$data[$key]->text = $str;
            $arr = ['id'=>$data->id,'text'=>$str];
        
        //$data->text = $data->name .'-'. $data->title .'-'. $data->text;
       
        return $arr;
    }


}
