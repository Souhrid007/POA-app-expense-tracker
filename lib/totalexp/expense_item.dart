import 'package:flutter/material.dart';
import 'package:sample/totalexp/exp_body.dart';

class TotalExpense extends StatelessWidget {
  const TotalExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TotalExpense'),
      ),
      body: Text('data'),
    );
  }
}