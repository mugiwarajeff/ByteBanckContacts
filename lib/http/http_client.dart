import 'dart:async';
import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:my_app/http/logging_interceptor.dart';
import 'package:my_app/src/features/transaction_feed/models/transaction_model.dart';

class TransactionWebClient {
  final Uri endpoint = Uri.http("192.168.0.104:8080", "/transactions");
  final Client client =
      InterceptedClient.build(interceptors: [LogingInterceptor()]);

  Future<List<Transaction>?> getAll() async {
    try {
      final http.Response response =
          await client.get(endpoint).timeout(const Duration(seconds: 5));
      if (response.statusCode != 404 && response.statusCode != 504) {
        List<dynamic> transactions = jsonDecode(response.body);
        List<Transaction> transactionsReturn = transactions
            .map((transaction) => Transaction.fromJson(transaction))
            .toList();

        return transactionsReturn;
      }
    } on TimeoutException {
      return null;
    }

    return null;
  }

  Future<Transaction> postTransaction(Transaction transaction) async {
    final String bodyToPost = jsonEncode(transaction.toJson());

    Response response = await client.post(endpoint,
        headers: {"Content-type": "application/json", "password": "1000"},
        body: bodyToPost);

    Map<String, dynamic> responseObject = jsonDecode(response.body);
    return Transaction.toTransaction(responseObject);
  }
}
