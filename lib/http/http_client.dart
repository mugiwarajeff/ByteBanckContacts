import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:my_app/http/logging_interceptor.dart';

void getAll() async {
  Uri endpoint = Uri.http("192.168.0.104:8080", "/transactions");
  final Client client =
      InterceptedClient.build(interceptors: [LogingInterceptor()]);

  final http.Response response = await client.get(endpoint);
}
