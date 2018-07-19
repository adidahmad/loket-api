<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Models\MsLocation;

class LocationController extends Controller
{
    public function createLocation(Request $request)
    {
        $location = MsLocation::create($request->all());

        return Response()->json(['data' => $location, 'status' => 201]);
    }
}
