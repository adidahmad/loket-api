<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Models\TrPurchasingTicket;
use App\Models\MsCustomer;
use \App\Models\MsTicketType;
use \App\Models\MsEvent;

class TransactionController extends Controller
{
    public function getTransactionDetail($transCode)
    {
        $result = DB::table('tr_purchasing_tickets')
                    ->where('transCode', $transCode)
                    ->select('*')
                    ->get();

        return Response()->json(['data' => $result, 'status' => 200]);
    }

    public function purchaseTicket(Request $request)
    {
        $custID = $this->checkCustomer($request);
        $eventID = 0;

        foreach ($request->tickets as $data) {

            $getCode = $this->getCode($data['eventTicketID']);

            if($getCode == null)
            {
                return Response()->json(['message' => 'event ticket not found!', 'status' => 400]);
            }

            if($getCode->eventID != $eventID)
            {
                $transCode = $getCode->eventCode . "." . $custID->id . "." . date("Ymd");
                
                DB::table('tr_purchasing_tickets')->insert([
                    'transCode' => $transCode,
                    'eventTicketID' => $data['eventTicketID'],
                    'custID' => $custID->id,
                    'quantity' => $data['quantity']
                    ]);
            }
        }

        return Response()->json(['message' => 'succesfully.', 'status' => 201]);
    }

    private function checkCustomer(Request $request)
    {
        $result = DB::table('ms_customers')
                    ->where('email', $request->email)
                    ->select('id')
                    ->first();

        if ($result == null)
        {
            $result = DB::table('ms_customers')->insertGetId([
                'name' => $request->name,
                'email' => $request->email,
                'phone' => $request->phone,
                'address' => $request->address
                ]);

            return $result;
        } else {
            return $result;
        }
    }

    private function getCode($eventTicketID)
    {
        $result = DB::table('tr_event_tickets')
                    ->join('ms_events', 'tr_event_tickets.eventID', '=', 'ms_events.id')
                    ->join('ms_ticket_Types', 'tr_event_tickets.ticketTypeID', '=', 'ms_ticket_Types.id')
                    ->where('tr_event_tickets.id', $eventTicketID)
                    ->select('ms_events.eventCode','tr_event_tickets.eventID')
                    ->first();

        return $result;
    }
}