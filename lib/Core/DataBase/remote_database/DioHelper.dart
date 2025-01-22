
import 'package:dio/dio.dart';
import 'package:ls/Core/DataBase/Local_database/cach_helper.dart';
import 'package:ls/Core/DataBase/remote_database/EndPoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper{
  static late Dio dio;


  static init(){
    dio = Dio(
        BaseOptions(
            baseUrl: EndPoints.baseUrL,
        )
    );
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        filter: (options, args){
          // don't print requests with uris containing '/posts'
          if(options.path.contains('/posts')){
            return false;
          }

          return !args.isResponse || !args.hasUint8ListData;
        }
    ));
  }


  static Future<Response> PostData ({
    required String end_point,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,

  }) async
  {
    dio.options.headers= {
      "Content-Type":"application/json",
      "Accept":"application/json",
      'Authorization':'Bearer $token',
    };

    return await dio.post(
        end_point,
        data: data,
        queryParameters: query
    );

  }
  static Future<Response> postRegister({
    required String end_ponit,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-type': 'multipart/form-data',
    };

    return await dio.post(
      end_ponit,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> postForgetPassword({
    required String end_ponit,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async{
    dio.options.headers={
      'Accept': '*/*',
      'Connection': 'keep-alive',
    };
    return await dio.post(
      end_ponit,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> post({
    required String end_ponit,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    FormData ? formData,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.post(
      end_ponit,
      data: formData ??data,
      queryParameters: query,


    );
  }
  static Future<Response> put({
    required String end_ponit,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.put(
      end_ponit,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> get({
    required String end_ponit,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.get(
      end_ponit,
      data: data,
      queryParameters: query,
    );
  }


  static Future<Response> putChangePassword({
    required String end_ponit,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.put(
      end_ponit,
      data: data,
      queryParameters: query,
    );
  }
  static Future<Response> putEditProfile({
    required String end_ponit,
    Map<String, dynamic>? data,//
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.put(
      end_ponit,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> putImage({
    required String end_ponit,
    FormData? formData,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-type': 'multipart/form-data',
      'Accept': 'application/json',
      'Connection': 'keep-alive',
      'Authorization': 'Bearer $token',
    };
    return await dio.post(
      end_ponit,
      data: formData,
      queryParameters: query,
    );
  }}