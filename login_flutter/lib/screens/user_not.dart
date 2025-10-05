import 'package:flutter/material.dart';

Widget errorSheet(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      color: Colors.redAccent,
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(Icons.error_outline, color: Colors.white, size: 40),
        SizedBox(height: 10),
        Text(
          "User Not Found",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
