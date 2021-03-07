import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

class CreateProduct extends StatefulWidget {
  @override
  _CreateProductState createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  String selectedDelivery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Add Product', style: TextStyle(fontWeight: FontWeight.w700))
                .tr(),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Transform.scale(
          scale: 1.2,
          child: FloatingActionButton.extended(
            onPressed: () {},
            foregroundColor: Colors.white,
            highlightElevation: 0.0,
            elevation: 0.0,
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Save product').tr(),
                  SizedBox(width: 5),
                  Icon(LineAwesomeIcons.save)
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //Images
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Product Image',
                    style: TextStyle(fontSize: 16),
                  ).tr(),
                ),
                SizedBox(height: 10),
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Icon(
                        Icons.library_add_outlined,
                        color: Theme.of(context).accentColor,
                        size: 60,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //Name
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Product title',
                    style: TextStyle(fontSize: 16),
                  ).tr(),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: 15),
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                        hintText: tr('Enter product title'),
                        border: InputBorder.none,
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                  ),
                ),
                SizedBox(height: 20),
                //Description
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Description',
                    style: TextStyle(fontSize: 16),
                  ).tr(),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: 15),
                    maxLines: 7,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                        hintText: tr('Enter product details'),
                        border: InputBorder.none,
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Price
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Text(
                              'Price',
                              style: TextStyle(fontSize: 16),
                            ).tr(),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(fontSize: 15),
                              onFieldSubmitted: (v) {
                                FocusScope.of(context).nextFocus();
                              },
                              decoration: InputDecoration(
                                  hintText: tr('Enter price'),
                                  border: InputBorder.none,
                                  alignLabelWithHint: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12)),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Quantity
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Text(
                              'Quantity',
                              style: TextStyle(fontSize: 16),
                            ).tr(),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(fontSize: 15),
                              onFieldSubmitted: (v) {
                                FocusScope.of(context).nextFocus();
                              },
                              decoration: InputDecoration(
                                  hintText: '0',
                                  border: InputBorder.none,
                                  alignLabelWithHint: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12)),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
                //Attributes
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Add attributes',
                    style: TextStyle(fontSize: 16),
                  ).tr(),
                ),
                SizedBox(height: 10),
                CupertinoButton(
                  onPressed: () => attributesDialog(context),
                  padding: EdgeInsets.zero,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Icon(LineIcons.plusCircle,
                          color: Theme.of(context).accentColor),
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ]),
        ),
      ),
    );
  }

  Future attributesDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 0.0,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add attributes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ).tr(),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          LineIcons.times,
                          size: 20,
                          color: Colors.black54,
                        ),
                        onPressed: () => Get.back(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Attribute name',
                    style: TextStyle(fontSize: 14),
                  ).tr(),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: 15),
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                        hintText: tr('Like: Size'),
                        border: InputBorder.none,
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Attribute values',
                    style: TextStyle(fontSize: 14),
                  ).tr(),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: 15),
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                        hintText: tr('Enter attribute values'),
                        border: InputBorder.none,
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Container(
                            width: MediaQuery.of(context).size.width * .9,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CupertinoButton(
                                  color: Theme.of(context).accentColor,
                                  padding: EdgeInsets.all(15),
                                  onPressed: () {},
                                  child: Text("Add",
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800))
                                      .tr()),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
