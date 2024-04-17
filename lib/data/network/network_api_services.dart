import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../AppExceptions.dart';
import 'base_api_services.dart';

 class   NetworkApiServices extends  BaseApiServices
{


  @override
  Future getApi(String url) async {
    dynamic responseJson;

    try
    {

      print( "eehdehdeh:");


      var response= await http.get(Uri.parse(url),
         // headers: {"Content-Type": "application/json"}

      ).timeout(const Duration( seconds: 30));

        print("tttttststs"+response.body);

        responseJson=returnResponse(response);




       }
       on SocketException{

      print("qqqqq");


      throw  InternetException("") ;

      }
      on TimeoutException
      {

       throw  RequestTimeOut("Connection time out");


      }

      return responseJson;


      }









  @override
  Future postApi(Map<String, dynamic> map,url) async {

    dynamic responseJson;
    try
    {

      var response= await http.post(Uri.parse(url),

      //  headers: {"Content-Type": "application/json"},
          body: map,

       //   headers: {"Content-Type": "application/json"}




      ).timeout(const Duration( seconds: 40));




      print("tttttststs"+response.body);



      responseJson=returnResponse(response);



    }
    on

    SocketException{

      print("qqqqq");


      throw  InternetException("") ;

    }
    on TimeoutException
    {

      throw  RequestTimeOut("Connection time out");


    }

    return responseJson;


  }


  dynamic returnResponse(http.Response response)
  {
    switch(response.statusCode)

    {

          case 200:

          dynamic responsejson=jsonDecode(response.body);
          print(response.statusCode);


        return responsejson;

        case 400:
        throw InvalidUrl;

        default:

          throw FetchDataException("Error accord while communication with server");




    }


  }



  @override
  Future postApiJsonEncode(Map<String, dynamic> map,url) async {
    dynamic responseJson;
    try
    {



      var response= await http.post(Uri.parse(url),headers: {"Content-Type": "application/json"}, body:  jsonEncode(map)).timeout(const Duration( seconds: 30));
      print("tttttststs"+response.body);
      responseJson=returnResponse(response);





    }
    on


    SocketException{
      print("qqqqq");

      throw  InternetException("") ;

    }
    on TimeoutException
    {

      throw  RequestTimeOut("Connection time out");


    }

    return responseJson;


  }



}