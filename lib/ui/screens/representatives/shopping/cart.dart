import 'package:agrimatco/ui/components/dummy_data.dart';
import 'package:agrimatco/ui/components/widgets/cart/cart_widget.dart';
import 'package:agrimatco/ui/screens/representatives/shopping/checkout.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(fontWeight: FontWeight.w700)).tr(),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 55,
          child: FloatingActionButton.extended(
            onPressed: () => Get.to(Checkout()),
            foregroundColor: Colors.white,
            highlightElevation: 0.0,
            elevation: 0.0,
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Review order').tr(),
                  SizedBox(width: 5),
                  Icon(LineAwesomeIcons.clipboard_list)
                ],
              ),
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: ListView.separated(
                itemCount: products.length,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                itemBuilder: (context, index) {
                  return CartWidget(
                    title: products[index]['title'],
                    image: products[index]['image'],
                    quantity: index,
                    price: double.parse("${products[index]['price']}"),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
              )),
            ]),
      ),
    );
  }
}
