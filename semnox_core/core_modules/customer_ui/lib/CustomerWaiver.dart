import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerWaiver extends StatefulWidget{
  @override
  State<CustomerWaiver> createState() => _CustomerWaiverState();
}
class _CustomerWaiverState extends State<CustomerWaiver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Text('Waiver'),
      ),

    );
  }
}
