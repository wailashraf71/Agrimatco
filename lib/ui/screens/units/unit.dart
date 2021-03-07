import 'package:agrimatco/ui/components/widgets/products/products_grid.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Unit extends StatefulWidget {
  final int id;

  Unit({Key key, this.id = 1}) : super(key: key);

  @override
  UnitState createState() => UnitState();
}

class UnitState extends State<Unit> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text('Unit Name', style: TextStyle(fontWeight: FontWeight.w700))
                  .tr(),
        ),
        body: RefreshIndicator(
            onRefresh: () {
              return Future.value(0);
            },
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                ProductsGrid(),
              ],
            )));
  }
}
