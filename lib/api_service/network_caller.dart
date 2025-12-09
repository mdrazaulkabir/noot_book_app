import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkResponse{
  final bool isSuccess;
  final int statusCode;
  final Map<String,dynamic>? body;
  final String? errorMessage;

  NetworkResponse({required this.isSuccess, required this.statusCode, this.body, this.errorMessage});
}
class NetworkCaller {
  static final  String _defaultErrorMessage="Api can't fetch the server and data";

  static Future<NetworkResponse>getData(String url)async{
    Uri uri=Uri.parse(url);
    _logRequest(url, null);
    Response response=await get(uri);
    _logResponse(url, response);
    try{
      if(response.statusCode==200){
        final decodedData=jsonDecode(response.body);
        return NetworkResponse(isSuccess: true, statusCode: response.statusCode,body: decodedData);
      }
      else{
        final decodedData=jsonDecode(response.body);
        return NetworkResponse(isSuccess: false, statusCode: response.statusCode,body:decodedData,errorMessage: decodedData['data']??_defaultErrorMessage);
      }
    }
    catch(e){
      return NetworkResponse(isSuccess: false, statusCode: -1,errorMessage: e.toString());
    }
  }

  static Future<NetworkResponse> postData(String url,Map<String,dynamic>body)async{
    final uri=Uri.parse(url);
    _logRequest(url, body);
    final response= await post(
        uri,
        body: jsonEncode(body),
        headers: {
      "content_type": 'application/json'});
    _logResponse(url, response);

    try{
      if(response.statusCode==200){
        final decodedData=jsonDecode(response.body);
        return NetworkResponse(isSuccess: true, statusCode: response.statusCode,body: decodedData);
      }
      else{
        final decodedData=jsonDecode(response.body);
        return NetworkResponse(isSuccess: false, statusCode: response.statusCode,body: decodedData,errorMessage:decodedData['data']?? _defaultErrorMessage);
      }
    }
    catch(e){
      return NetworkResponse(isSuccess: false, statusCode: -1,errorMessage: e.toString());
    }
  }

 static void _logRequest(String uri,Map<String,dynamic>?body){
    debugPrint("''''''''''''''''''''Request''''''''''''''''''''''''''\n"
        "uri is: ''''''''''''''''''$uri\n "
        "body is : ''''''''''''''''$body\n"
        "'''''''''''''''''''''''''''''''''''''''''''''''''''''"
    );
  }

  static void _logResponse(String uri,Response response){
    debugPrint("''''''''''''''''''Request''''''''''''''''''''''''''\n"
        "uri is :'''''''''''''''''$uri\n"
        "response is:'''''''''''''$response\n"
        "'''''''''''''''''''''''''''''''''''''''''''''''''''''''");
  }

}