<?php

namespace App\Admin\Controllers\api;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\GoodsSon;

class GoodsSonController extends Controller
{
    
    public function goodssonfind(Request $request,$pid = 0)
    {   
        // $q = $request->get('q');

        // $data =  GoodsSon::where('id', $pid)
        //             ->orwhere('type','like','%'.$q.'%')
        //             ->paginate(null, ['id', 'type as text']);
        
        // return $data;
        $Id = $request->get('q');

        return GoodsSon::where('pid', $Id)->get(['id', DB::raw('type as text')]);
    }

}
