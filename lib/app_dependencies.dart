import 'package:flutter/cupertino.dart';
import 'package:my_app/http/http_client.dart';

import 'database/dao/contacts_dao.dart';

class AppDependencies extends InheritedWidget {
  final ContactDAO contactDAO;
  final TransactionWebClient transactionWebClient;
  final Widget child;

  AppDependencies(
      {required this.contactDAO,
      required this.transactionWebClient,
      required this.child})
      : super(child: child);

  static AppDependencies of(BuildContext context) {
    final AppDependencies? result =
        context.dependOnInheritedWidgetOfExactType<AppDependencies>();
    assert(result != null, "No AppDependencies found in context");
    return result!;
  }

  @override
  bool updateShouldNotify(AppDependencies oldWidget) {
    return contactDAO != oldWidget.contactDAO ||
        transactionWebClient != oldWidget.transactionWebClient;
  }
}
