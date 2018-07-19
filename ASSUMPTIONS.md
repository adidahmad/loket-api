# ASSUMPTIONS

## Bussiness Process
pertama, sebelum membuat sebuah event, kita harus membuat location dan category terlebih dahulu.
selanjutnya kita dapat membuat event.
sebelum kita menambahkan ticket type di tiap event, langkah yang harus dilakukan adalah menambahkan data ticket type.
setelah itu kita dapat menentukan ticket type apa saja untuk suatu event.
ketika event dan detail ticket type dibuat, maka customer dapat membeli beberapa ticket type dari satu event tertentu.
transaction code (transCode) akan tergenerate ketika customer membeli ticket.
dari transCode tersebut, customer dapat melihat detail transaction dari apa yg sudah mereka beli.

Aplikasi ini meliputi beberapa hal :

- category
- location
- ticket type
- event
- transaksi

## API Documentation

Dari 5 point diatas, saya hanya menyediakan api untuk :

- create location
- create event
- event detail
- create event ticket
- purchase ticket
- transaction detail

> untuk create category, create ticket type di insert secara manual.

Sebenarnya saya sudah menambahkan swagger di project ini, dapat di akses melalui '/api/documentation':
swagger yg tersedia hanya untuk 4 endpoint berikut :

- create location
- create event
- event detail
- transaction detail

> Ada kendala untuk menggunakan endpoint tersebut di swagger, yaitu tidak bisa digunakan untuk testing (execute).

###### create location
parameter
'''
{
	"venue":"string",
	"address:"string",
	"city":"string",
	"province":"string",
	"country":"string"
}
'''

###### create event
parameter
'''
{
	"eventName"	:"string",
	"eventCode"	:"string",
	"eventStartDate":"y-m-d h:i:s",
	"eventEndDate"	:"y-m-d h:i:s",
	"locationID"	:integer,
	"categoryID"	:integer
}
'''

###### event detail
parameter
'''
{
	"eventID" : integer
}
'''

###### create event ticket
parameter
'''{
	"data" :
	[
		{
			"price"		:double,
			"eventID"	:integer,
			"ticketTypeID"	:integer
		}
	]
}
'''

###### purchase ticket
parameter
'''
{
	"name" 	: "string",
	"email" : "string",
	"phone" : "string",
	"address" : "string",
	"tickets" :
	[
		{
			"eventTicketID"	:integer,
			"quantity"	:integer
		}
	]
}
'''

###### transaction detail
parameter
'''
{
	"transCode" : "string"
}
'''