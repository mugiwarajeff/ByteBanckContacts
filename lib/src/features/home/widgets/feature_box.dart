import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FeatureBox extends StatelessWidget {
  late String title;
  late IconData icon;
  final Function callBack;
  FeatureBox(
      {super.key,
      required this.title,
      required this.icon,
      required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32.0),
      child: InkWell(
        onTap: (() => callBack()),
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          height: 80,
          width: 130,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
