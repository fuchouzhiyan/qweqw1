import 'package:flutter/material.dart';

//接单详情
class ServiceCharge extends StatefulWidget {
  @override
  _ServiceChargeState createState() => _ServiceChargeState();
}

class _ServiceChargeState extends State<ServiceCharge> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text('手续费查询'),
        ),
    );
  }
}