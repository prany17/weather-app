import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SizedboxComponent extends StatelessWidget {
  String title;
  var valueof;

  SizedboxComponent({
    super.key,
    required this.title,
    required this.valueof,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  valueof,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Divider(
              color: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
