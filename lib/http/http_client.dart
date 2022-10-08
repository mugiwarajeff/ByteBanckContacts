import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:my_app/http/logging_interceptor.dart';
import 'package:my_app/src/features/transaction_feed/models/transaction_model.dart';

import '../src/features/transferencies/models/transferency_model.dart';

final Uri endpoint = Uri.http("192.168.0.104:8080", "/transactions");

Future<List<Transaction>?> getAll() async {
  final Client client =
      InterceptedClient.build(interceptors: [LogingInterceptor()]);

  try {
    final http.Response response =
        await client.get(endpoint).timeout(const Duration(seconds: 5));
    if (response.statusCode != 404 && response.statusCode != 504) {
      List<dynamic> transactions = jsonDecode(response.body);
      List<Transaction> transactionsReturn = [];

      for (Map<String, dynamic> transaction in transactions) {
        Transaction actualTransaction = Transaction(
          id: transaction["id"],
          value: transaction["value"],
          transferency: Transferency(
              id: 0,
              name: transaction["contact"]["name"],
              number: transaction["contact"]["accountNumber"]),
        );

        transactionsReturn.add(actualTransaction);
      }
      return transactionsReturn;
    }
  } on TimeoutException {
    return null;
  }

  return null;
}

Future<Transaction> postTransaction(Transaction transaction) async {
  final Client client =
      InterceptedClient.build(interceptors: [LogingInterceptor()]);

  Map<String, dynamic> transferencyBody = {};
  Map<String, dynamic> transactionBody = {};
  transferencyBody["name"] = transaction.transferency.name;
  transferencyBody["accountNumber"] = transaction.transferency.number;

  transactionBody["value"] = transaction.value;
  transactionBody["contact"] = transferencyBody;

  final String bodyToPost = jsonEncode(transactionBody);

  Response response = await client.post(endpoint,
      headers: {"Content-type": "application/json", "password": "1000"},
      body: bodyToPost);

  Map<String, dynamic> responseObject = jsonDecode(response.body);
  return Transaction.toTransaction(responseObject);
}
