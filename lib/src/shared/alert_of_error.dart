import 'package:flutter/cupertino.dart';

class AlertError extends StatelessWidget {
  final IconData? icon;
  final String message;

  AlertError({super.key, required this.message, this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Visibility(
            visible: (icon != null),
            child: Icon(
              icon,
              size: 48,
            )),
        const SizedBox(
          height: 30,
        ),
        Text(
          message,
          style: const TextStyle(fontSize: 24),
        ),
      ]),
    );
  }
}
