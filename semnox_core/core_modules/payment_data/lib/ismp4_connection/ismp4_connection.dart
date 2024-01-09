import 'dart:convert';

import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logs_data/logger.dart';

class Ismp4Connection{

   static Future<http.Response?> establishConnection(String auth, String merchantId, String hsn) async {
     String endPoint =  "https://bolt-uat.cardpointe.com:6443/api/v2/connect";
     try{
       Log.printMethodStart('establishConnection()', 'ISMP4 Screen','init');
       http.Response response = await http.post(
         Uri.parse(endPoint),
         headers: {
           'Content-Type': 'application/json',
           'Authorization': auth
         },
         body: json.encode(
             {
               "merchantId" : merchantId,
               "hsn" : hsn,
               "force": true
             }
         ),
       ).timeout(const Duration(seconds: 10));
       Log.printMethodEnd('establishConnection()', 'ISMP4 Screen','init');
       if(response.statusCode == 200){
         Log.printMethodReturn('establishConnection() - done', 'ISMP4 Screen','init');
         final result = response.headers;
         Log.v('***********');
         Log.i(" $result");
         Log.v('***********');
         var sessionKey = result['x-cardconnect-sessionkey'];
         sessionKey = sessionKey?.substring(0, sessionKey.indexOf(';'));
         return response;
         //return result.map<FacilityModel>(((e) => FacilityModel.fromJson(e))).toList();
       }else{
         print("response code ${response.statusCode }");
         Log.v("!!!!!ERROR!!!!!");
         throw Exception(response.reasonPhrase);
       }
     }catch(err){
       debugPrint(err.toString());
     }
     return null;
  }

   static void disconnect(String sessionKey,String auth, String merchantId, String hsn) async {
     String endPoint =  "https://bolt-uat.cardpointe.com:6443/api/v2/disconnect";
     try{
       Log.printMethodStart('disconnect()', 'ISMP4 Screen','init');
       http.Response response = await http.post(
         Uri.parse(endPoint),
         headers: {
           'Content-Type': 'application/json',
           'X-CardConnect-SessionKey' : sessionKey,
           'Authorization': auth
         },
         body: json.encode(
             {
               "merchantId" : merchantId,
               "hsn" : hsn,
             }
         ),
       ).timeout(Duration(seconds: 10));
       Log.printMethodEnd('disconnect()', 'ISMP4 Screen','init');
       if(response.statusCode == 200){
         Log.printMethodReturn('disconnect() - done', 'ISMP4 Screen','init');
         Log.i("disconnected");
         //return result.map<FacilityModel>(((e) => FacilityModel.fromJson(e))).toList();
       }else{
         print("response code ${response.statusCode }");
         Log.v("!!!!!ERROR!!!!!");
         throw Exception(response.reasonPhrase);
       }
     }catch(err){
       debugPrint(err.toString());
     }
   }

   static void cancelCommand(String sessionKey,String auth, String merchantId, String hsn) async {
     String endPoint =  "https://bolt-uat.cardpointe.com:6443/api/v2/cancel";
     try{
       Log.printMethodStart('cancelCommand()', 'ISMP4 Screen','cancel');
       http.Response response = await http.post(
         Uri.parse(endPoint),
         headers: {
           'Content-Type': 'application/json',
           'Authorization': auth,
           'X-CardConnect-SessionKey' : sessionKey,
         },
         body: json.encode(
             {
               "merchantId" : merchantId,
               "hsn" : hsn,
             }
         ),
       ).timeout(Duration(seconds: 10));
       Log.printMethodEnd('cancelCommand()', 'ISMP4 Screen','cancel');
       if(response.statusCode == 200){
         Log.printMethodReturn('cancelCommand() - done', 'ISMP4 Screen','cancel');
         Log.i("cancelled");
       }else{
         print("response code ${response.statusCode }");
         Log.v("!!!!!Cancel ERROR!!!!!");
         throw Exception(response.reasonPhrase);
       }
     }catch(err){
       debugPrint(err.toString());
     }
   }

   static Future<http.Response?> displayAmount(String sessionKey,String auth,String amount, String message) async {
     String endPoint =  "https://bolt-uat.cardpointe.com:6443/api/v2/display";
     try {
       Log.printMethodStart('displayAmount()', 'ISMP4 Screen','apply');
       http.Response response = await http.post(
         Uri.parse(endPoint),
         headers: {
           'Content-Type': 'application/json',
           //'Authorization': 'ZCb8pPkXcZDVO0CIngLSFrBJgA/BYyUZIHT8zaj3MPg=',
           'Authorization': auth,
           'X-CardConnect-SessionKey': sessionKey
         },
         body: json.encode(
             {
               "merchantId": "800000000139",
               "hsn": "20199PP25312638",
               "text" : message
             }
         ),
       );
       Log.printMethodEnd('displayAmount()', 'ISMP4 Screen','apply');
       if (response.statusCode == 200) {
         Log.printMethodReturn('displayAmount() - done!', 'ISMP4 Screen','apply');
         //readCard(sessionKey,amount);
         return response;
       } else {
         Log.v("!!!!!ERROR!!!!!");
         throw Exception(response.reasonPhrase);
       }
     }catch(err){
       debugPrint(err.toString());
     }
   }

   static Future<dynamic> clearDisplay(String sessionKey) async {
     String endPoint =  "https://bolt-uat.cardpointe.com/api/v3/clearDisplay";
     try {
       Log.printMethodStart('clearDisplay()', 'ISMP4 Screen','init');
       http.Response response = await http.post(
         Uri.parse(endPoint),
         headers: {
           'Content-Type': 'application/json',
           'Authorization': 'ZCb8pPkXcZDVO0CIngLSFrBJgA/BYyUZIHT8zaj3MPg=',
           'X-CardConnect-SessionKey': sessionKey
         },
         body: json.encode(
             {
               "merchantId": "800000000139",
               "hsn": "20199PP25312638",
             }
         ),
       );
       Log.printMethodEnd('clearDisplay()', 'ISMP4 Screen','init');
       if (response.statusCode == 200) {
         Log.printMethodReturn('clearDisplay()', 'ISMP4 Screen','init');
         //return result.map<FacilityModel>(((e) => FacilityModel.fromJson(e))).toList();
       } else {
         Log.v("!!!!!DISPLAY ERROR!!!!!");
         throw Exception(response.reasonPhrase);
       }
     }catch(err){
       debugPrint(err.toString());
     }
   }

   static Future<http.Response?> readCard(String auth, String merchantId, String hsn,String sessionKey,String amount) async {
     amount = (double.parse(amount) * 100).toInt().toString();
     String endPoint =  "https://bolt-uat.cardpointe.com:6443/api/v2/readCard";
     try {
       Log.printMethodStart('readCard()', 'ISMP4 Screen','apply');
       http.Response response = await http.post(
         Uri.parse(endPoint),
         headers: {
           'Content-Type': 'application/json',
           'Authorization': auth,
           'X-CardConnect-SessionKey': sessionKey
         },
         body: json.encode(
             {
               "merchantId": merchantId,
               "hsn": hsn,
               "amount": amount,
               "includeSignature": "false",
               "gzipSignature": "false",
               "signatureFormat": "png",
               "signatureImageT ype": "rgb",
               "signatureDimensions": "320,450",
               "includeAmountDisplay": "true",
               "confirmAmount": "true",
               "beep": "true",
               "aid": "credit"
             }
         ),
       );
       Log.printMethodEnd('readCard()', 'ISMP4 Screen','apply');
       if (response.statusCode == 200) {
         Log.printMethodReturn('readCard() - done!', 'ISMP4 Screen','apply');
         final result = response.body;
         Log.v('***********');
         Log.i(result);
         Log.v('***********');
         return response;
       } else {
         Log.v("!!!!!CARD READ ERROR!!!!!");
        // throw Exception(response.reasonPhrase);
         return response;
       }
     }catch(err){
       debugPrint(err.toString());
     }
   }

   static Future<http.Response?> leaveTip(String auth, String merchantId, String hsn,String sessionKey,String amount) async {
     amount = (double.parse(amount) * 100).toInt().toString();
     String endPoint =  "https://bolt-uat.cardpointe.com/api/v3/tip";
     try {
       Log.printMethodStart('leaveTip()', 'ISMP4 Screen','init');
       http.Response response = await http.post(
         Uri.parse(endPoint),
         headers: {
           'Content-Type': 'application/json',
           'Authorization': auth,
           'X-CardConnect-SessionKey': sessionKey
         },
         body: json.encode(
             {
               "merchantId": merchantId,
               "hsn": hsn,
               "prompt" : "Would you like to leave a tip?",
               "amount" : amount
             }
         ),
       );
       Log.printMethodEnd('leaveTip()', 'ISMP4 Screen','init');
       if (response.statusCode == 200) {
         Log.printMethodReturn('leaveTip()', 'ISMP4 Screen','init');
         final result = response.body;
         Log.v('***********');
         Log.i(result);
         Log.v('***********');
         return response;
         //return result.map<FacilityModel>(((e) => FacilityModel.fromJson(e))).toList();
       } else {
         Log.v("!!!!!TIP ERROR!!!!!");
         throw Exception(response.reasonPhrase);
       }
     }catch(err){
       debugPrint(err.toString());
     }
   }

   static Future<http.Response?> autherize(String baseAuth,String merchantId,String amount,String token,String expiry,String currency,String? capture,
       {String? tipAdjust}) async {
     amount =  (double.parse(amount) * 100).toInt().toString();
     tipAdjust = (double.parse(tipAdjust ?? '0') * 100).toInt().toString();
     print("authCodes $baseAuth $token $tipAdjust");
     String endPoint =  "https://boltgw-uat.cardconnect.com/cardconnect/rest/auth";
     try {
       Log.printMethodStart('autherize()', 'ISMP4 Screen','authorization');
       http.Response response = await http.post(
         Uri.parse(endPoint),
         headers: {
           'Content-Type': 'application/json',
           'Authorization': baseAuth,
         },
         body: json.encode(
             {
               "merchid": merchantId,
               "account": token,
               "expiry": expiry,
              // "cvv2": "123",
               "currency":currency,
               "amount": amount,
               "tipAdjust" : tipAdjust,
               "capture": capture ?? "",
               "name":""
             }
         ),
       );
       Log.printMethodEnd('autherize()', 'ISMP4 Screen','authorization');
       Log.i("response code ${response.statusCode}");
       if (response.statusCode == 200) {
         Log.printMethodReturn('autherize() - done!', 'ISMP4 Screen','authorization');
         final result = response.body;
         Log.v('***********');
         Log.i(result);
         Log.v('***********');
         return response;
         //return result.map<FacilityModel>(((e) => FacilityModel.fromJson(e))).toList();
       } else {
         Log.v("!!!!!AUTH ERROR!!!!!");
         throw Exception(response.reasonPhrase);
       }
     }catch(err){
       debugPrint(err.toString());
     }
   }

   static Future<http.Response?> inquiry(String authCode,String merchantId,String retref) async {

     String endPoint =  "https://boltgw-uat.cardconnect.com/cardconnect/rest/inquire/$retref/$merchantId";
     try {
       Log.printMethodStart('inquiry()', 'ISMP4 Screen','yes');
       http.Response response = await http.get(
         Uri.parse(endPoint),
         headers: {
           'Authorization': authCode,
         },
       );
       Log.v("response code ${response.statusCode}");
       Log.printMethodEnd('inquiry()', 'ISMP4 Screen','yes');
       if (response.statusCode == 200) {
         Log.printMethodReturn('inquiry() - done!', 'ISMP4 Screen','yes');
         final result = response.body;
         Log.v('***********');
         Log.i(result);
         Log.v('***********');
         return response;
         //return result.map<FacilityModel>(((e) => FacilityModel.fromJson(e))).toList();
       } else {
         Log.v("!!!!!Inquiry ERROR!!!!!");
         throw Exception(response.reasonPhrase);
       }
     }catch(err){
       debugPrint(err.toString());
     }
   }

   static Future<http.Response?> capture(String authCode,String merchantId,String retref) async {
     String endPoint =  "https://boltgw-uat.cardconnect.com/cardconnect/rest/capture";
     try {
       Log.printMethodStart('capture()', 'ISMP4 Screen','yes');
       http.Response response = await http.post(
         Uri.parse(endPoint),
         headers: {
           'Content-Type': 'application/json',
           'Authorization': authCode,
         },
         body: json.encode(
             {
               "retref":retref,
               "merchid":merchantId,
              /* "invoiceid": "10ed5e77-6303-490f-b4a1-705ea4241d92",
               "authcode": "PPS221",
               "currenc": "USD",
               "amount": "644",
               "capture": "Y",
               "userfields": {
                 "customFields": [],
                 "totalDetails": {
                   "currency": "USD",
                   "total": "$ 6.44",
                   "subTotal": null,
                   "tax": "0.00",
                   "tipAdjust": "$ 0.00"
                 },
                 "tip_adjust": "$ 0.00"
               }*/
             }
         ),
       );
       Log.printMethodEnd('capture()', 'ISMP4 Screen','yes');
       Log.v("response code ${response.statusCode}");
       if (response.statusCode == 200) {
         Log.printMethodReturn('capture() - done!', 'ISMP4 Screen','yes');
         final result = response.body;
         Log.v('****CaptureR*******');
         Log.i(result);
         Log.v('***********');
         return response;
         //return result.map<FacilityModel>(((e) => FacilityModel.fromJson(e))).toList();
       } else {
         Log.v("!!!!!Capture ERROR!!!!!");
         throw Exception(response.reasonPhrase);
       }
     }catch(err){
       debugPrint(err.toString());
     }
   }

   static Future<http.Response?> cancelPayment(String authCode, String merchantId,String amount,String retref,String expiry) async {
     amount = (double.parse(amount) * 100).toInt().toString();
     print("authCode $authCode $retref");
     String endPoint =  "https://boltgw-uat.cardconnect.com/cardconnect/rest/void";
     try {
       Log.printMethodStart('cancelPayment()', 'Payment Screen','cancel');
       http.Response response = await http.post(
         Uri.parse(endPoint),
         headers: {
           'Content-Type': 'application/json',
           'Authorization': authCode,
         },
         body: json.encode(
             {
            //"retref": "288013185633",
             "retref": retref,
             "merchid": merchantId,
             "amount": amount
             }
         ),
       );
       Log.printMethodEnd('cancelPayment()', 'Payment Screen','cancel');
       Log.v("response code ${response.statusCode}");
       if (response.statusCode == 200) {
         Log.printMethodReturn('cancelPayment() - done!', 'Payment Screen','cancel');
         final result = response.body;
         Log.v('***********');
         Log.i(result);
         Log.v('***********');
         return response;
       } else {
         Log.v("!!!!!REFUND ERROR!!!!!");
         throw Exception(response.reasonPhrase);
       }
     }catch(err){
       debugPrint(err.toString());
     }
   }

   static Future<http.Response?> refundPayment(String authCode, String merchantId,String amount,String retref,String expiry) async {
     amount = (double.parse(amount) * 100).toInt().toString();
     print("authCode $authCode $retref");
     String endPoint =  "https://boltgw-uat.cardconnect.com/cardconnect/rest/refund";
     try {
       Log.printMethodStart('refundPayment()', 'Payment Screen','apply');
       http.Response response = await http.post(
         Uri.parse(endPoint),
         headers: {
           'Content-Type': 'application/json',
           'Authorization': authCode,
         },
         body: json.encode(
             {
               "retref": retref,
               "merchid": merchantId,
               "amount": amount
             }
         ),
       );
       Log.printMethodEnd('refundPayment()', 'Payment Screen','apply');
       Log.v("response code ${response.statusCode}");
       if (response.statusCode == 200) {
         Log.printMethodReturn('refundPayment() - done!', 'Payment Screen','apply');
         final result = response.body;
         Log.v('***********');
         Log.i(result);
         Log.v('***********');
         return response;
       } else {
         Log.v("!!!!!REFUND ERROR!!!!!");
         throw Exception(response.reasonPhrase);
       }
     }catch(err){
       debugPrint(err.toString());
     }
   }

}