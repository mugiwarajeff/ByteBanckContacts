import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:my_app/http/http_exception.dart';
import 'package:my_app/http/logging_interceptor.dart';
import 'package:my_app/src/features/transaction_feed/models/transaction_model.dart';

class TransactionWebClient {
  final Uri endpoint = Uri.http("192.168.0.105:8080", "/transactions");
  final Client client = InterceptedClient.build(
      interceptors: [LogingInterceptor()],
      requestTimeout: const Duration(seconds: 5));

  Future<List<Transaction>> getAll() async {
    final http.Response response = await client.get(endpoint);

    List<dynamic> transactions = jsonDecode(response.body);
    List<Transaction> transactionsReturn = transactions
        .map((transaction) => Transaction.fromJson(transaction))
        .toList();

    if (response.statusCode == 504) throw Exception("Gateway Timeout");
    if (response.statusCode == 404) throw Exception("EndPoint Not Found");

    return transactionsReturn;
  }

  Future<Transaction?> postTransaction(
      Transaction transaction, String password) async {
    final String bodyToPost = jsonEncode(transaction.toJson());

    Response response = await client.post(endpoint,
        headers: {"Content-type": "application/json", "password": password},
        body: bodyToPost);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseObject = jsonDecode(response.body);
      return Transaction.toTransaction(responseObject);
    }
    throw HTTPException(mapCodeMessage[response.statusCode].toString());
  }

  Map<int, String> mapCodeMessage = {
    400: "There was an error submitin transaction",
    401: "Authentication failed",
  };
}
