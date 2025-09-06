import 'package:flutter/material.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom View'),
      ),
      body: Center(
        child: Text('This is a custom view'),
      ),
    );
  }
}
