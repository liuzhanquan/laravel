<?php

namespace App\Admin\Controllers\api;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Goods;

class GoodsController extends Controller
{
    
    public function goodsfind(Request $request)
    {   
        $q = $request->get('q');

        $data =  Goods::where('title', 'like', "%$q%")
                    ->orwhere('title_list','like','%'.$q.'%')
                    ->paginate(null, ['id', 'title as text']);
        
        return $data;
    }

}
