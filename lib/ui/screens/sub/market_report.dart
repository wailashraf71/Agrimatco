import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MarketReport extends StatefulWidget {
  @override
  _MarketReportState createState() => _MarketReportState();
}

class _MarketReportState extends State<MarketReport> {
  String selectedDelivery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market Report').tr(),
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
                  Text('Send Report').tr(),
                  SizedBox(width: 5),
                  Icon(LineAwesomeIcons.paper_plane)
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
                //Title
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
                //Notes
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Notes',
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
                        hintText: tr('Do you have any notes?'),
                        border: InputBorder.none,
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                  ),
                ),
                SizedBox(height: 20),
              ]),
        ),
      ),
    );
  }
}
