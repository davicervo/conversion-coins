<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\CryptoCompare;
use App\Http\Requests\ApiRequest;
use Illuminate\Support\Facades\Cache;

class ConverterCoinController extends Controller
{
    protected $lifeTimeCache = 60;
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(ApiRequest $request)
    {
        $api = new CryptoCompare();

        if (!Cache::has('request')) {
            Cache::put('request', $api->params([
                'fsym' => $request->get('from'),
                'tsyms' => $request->get('to')
            ])->amount($request->get('amount'))
                ->request('price')
                ->response(), $this->lifeTimeCache);
        }
        
        $get = Cache::get('request');

        return $get;
    }
}
