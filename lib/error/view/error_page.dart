import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String title;
  final String message;

  const ErrorPage({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
