import 'package:agrimatco/ui/components/widgets/products/products_grid.dart';
import 'package:agrimatco/ui/screens/products/create_product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Products extends StatefulWidget {
  @override
  ProductsState createState() => ProductsState();
}

class ProductsState extends State<Products> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products').tr(),
          actions: [
            IconButton(
              icon: Icon(LineAwesomeIcons.plus_circle),
              onPressed: () => Get.to(() => CreateProduct()),
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return Future.value(0);
          },
          child: ListView(
            padding: EdgeInsets.all(15),
            children: [
              ProductsGrid(
                edit: true,
              ),
            ],
          ),
        ));
  }
}
