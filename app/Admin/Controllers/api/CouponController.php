<?php

namespace App\Admin\Controllers\api;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Coupon;

class CouponController extends Controller
{
    
    public function couponfind(Request $request,$pid = 0)
    {   
        // $q = $request->get('q');

        // $data =  GoodsSon::where('id', $pid)
        //             ->orwhere('type','like','%'.$q.'%')
        //             ->paginate(null, ['id', 'type as text']);
        
        // return $data;
        $Id = $request->get('q');

        return Coupon::where('uid', $Id)->get(['id', DB::raw('price as text')]);
    }


    public function couponSel(Request $request)
    {   
        $q = $request->get('q');

        $data =  Coupon::leftjoin('goods','goods.id','=','coupon.gid')
                    ->leftjoin('agent','agent.id','=','coupon.aid')
                    ->where('coupon.status','=','1')
                    ->where(function ( $query ) use ($q) {
                        $query->orwhere('coupon.level','=','0')
                        ->orwhere('goods.title', 'like', "%$q%") 
                        ->orwhere('agent.name', 'like', "%$q%");
                    })
                    ->paginate(null, ['coupon.id', 'coupon.price as text','agent.name as name','goods.title as title','coupon.level as type']);
        
        foreach( $data as $key=>$item ){
            //$data[$key]->text = $item->name .'-'. $item->title .'-'. $item->text;
            $str = '';
            if( $item->title != '' ){
                $str = $str.$item->title .'(商品名)-';
            }
            if( $item->name != '' ){
                $str = $str.$item->name .'(代理商名)-';
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
            $data[$key]->text = $str;
        }
        //$data->text = $data->name .'-'. $data->title .'-'. $data->text;
        return $data;
    }

}
