import 'package:flutter/material.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:http_interceptor/models/request_data.dart';

class LogingInterceptor extends InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print("headers: ${data.headers}");
    print("body: ${data.body}");
    print("Url: ${data.baseUrl}");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print("headers: ${data.headers}");
    print("body: ${data.body}");
    return data;
  }
}
