import 'package:agrimatco/ui/components/widgets/orders/order_widget.dart';
import 'package:agrimatco/ui/screens/orders/orders_history.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders').tr(),
        actions: [
          IconButton(
              icon: Icon(Icons.history_outlined),
              onPressed: () => Get.to(() => OrdersHistory()))
        ],
      ),
      body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemBuilder: (BuildContext context, int index) {
            return OrderWidget(preview: false);
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10);
          },
          itemCount: 3),
    );
  }
}
