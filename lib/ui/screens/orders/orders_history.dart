import 'package:agrimatco/ui/components/widgets/orders/order_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OrdersHistory extends StatefulWidget {
  @override
  _OrdersHistoryState createState() => _OrdersHistoryState();
}

class _OrdersHistoryState extends State<OrdersHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders History').tr(),
      ),
      body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemBuilder: (BuildContext context, int index) {
            return OrderWidget(preview: true);
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10);
          },
          itemCount: 3),
    );
  }
}
