<?php

namespace App\Admin\Controllers\api;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\UserCoupon;

class UserCouponController extends Controller
{
    
    public function UserCouponfind(Request $request,$pid = 0)
    {   
        // $q = $request->get('q');

        // $data =  GoodsSon::where('id', $pid)
        //             ->orwhere('type','like','%'.$q.'%')
        //             ->paginate(null, ['id', 'type as text']);
        
        // return $data;
        $Id = $request->get('q');

        return UserCoupon::where('uid', $Id)->get(['id', DB::raw('cid as text')]);
    }


    public function usercouponSel(Request $request)
    {   
        $q = $request->get('q');

        $data =  UserCoupon::leftjoin('coupon','coupon.id','=','user_coupon.cid')
                    ->where('user_coupon.status','=','1')
                    ->where('user_coupon.use_status','=','1')
                    ->where('user_coupon.uid',$q)
                    ->paginate(null, ['user_coupon.id as id', 'coupon.price as text','coupon.aid as aid','coupon.gid as gid','coupon.level as type']);
        
                    // ->orwhere('coupon.level','=','0')
                    // ->orwhere('goods.title', 'like', "%$q%") 
                    // ->orwhere('agent.name', 'like', "%$q%") 
        
        $arr = [];
        foreach( $data as $key=>$item ){
            
            //$data[$key]->text = $item->name .'-'. $item->title .'-'. $item->text;
            $str = '';
            if( $item->gid != '' ){
                $title = DB::table('goods')->where('id',$item->gid)->value('name');
                $str = $str.$title .'(商品名)-';
            }
            if( $item->aid != '' ){
                $name = DB::table('agent')->where('id',$item->aid)->value('name');
                $str = $str.$name .'(代理商名)-';
            }
            
            switch($item->type){
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
            $str = $str.$item->text.'(金额) 【作用范围：'.$type.'】';
            //$data[$key]->text = $str;
            $arr[$key] = ['id'=>$item->id,'text'=>$str];
        }
        //$data->text = $data->name .'-'. $data->title .'-'. $data->text;
        
        return $arr;
    }

}
