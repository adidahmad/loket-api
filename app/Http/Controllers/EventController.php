<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Models\MsEvent;
use App\Models\TrEventTicket;

class EventController extends Controller
{
    public function getEventDetail($id)
    {
        $result = DB::table('ms_events')
                    ->where('id', json_decode($id))
                    ->select('*')
                    ->first();

        return Response()->json(['data' => $result, 'status' => 200]);
    }

    public function createEvent(Request $request)
    {
        $checkEventCode = $this->checkEventCode($request->eventCode);

        if ($checkEventCode != null) {

            return Response()->json(['message' => "event code $request->eventCode already exist!", 'status' => 400]);

        } else {

            $event = MsEvent::create($request->all());

            return Response()->json(['data' => $event, 'status' => 201]);
        }
    }

    public function createEventTicket(Request $request)
    {
        foreach ($request->data as $key) {

            $checkTicketType = DB::table('tr_event_tickets')
                    ->where('ticketTypeID', $key['ticketTypeID'])
                    ->where('eventID', $key['eventID'])
                    ->select('id')
                    ->first();

            if($checkTicketType == null)
            {
                TrEventTicket::create($key);
            }
        }

        return Response()->json(['data' => 'successfully.', 'status' => 201]);
    }

    private function checkEventCode($eventCode)
    {
        $result = DB::table('ms_events')
                    ->where('eventCode', $eventCode)
                    ->select('eventCode')
                    ->first();
        
        return $result;
    }
}
