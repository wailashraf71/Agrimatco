import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class VisitSummary extends StatefulWidget {
  final bool previewWithAccept;

  const VisitSummary({Key key, this.previewWithAccept = false})
      : super(key: key);

  @override
  _VisitSummaryState createState() => _VisitSummaryState();
}

class _VisitSummaryState extends State<VisitSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Visit Summary').tr(),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        buildData(
                            context: context,
                            key: 'Full Name',
                            value: 'John Doe'),
                        buildData(
                            context: context,
                            key: 'Phone number',
                            value: '07701234567'),
                        Divider(),
                        buildData(
                            context: context,
                            key: 'Province',
                            value: 'Baghdad'),
                        buildData(
                            context: context,
                            key: 'Address',
                            value: 'Mohammed el Qasim'),
                        Divider(),
                        buildData(
                            context: context, key: 'Time', value: '2:30 PM'),
                        buildData(
                            context: context,
                            key: 'Total Price',
                            value: '12000' + ' ' + tr('iqd')),
                        buildData(
                            context: context,
                            key: 'Notes',
                            value: 'Extra Service'),
                        SizedBox(height: 30),
                        if (widget.previewWithAccept)
                          Column(
                            children: [
                              CupertinoButton(
                                  color: Theme.of(context).accentColor,
                                  padding: EdgeInsets.all(18),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Accept visit",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w800))
                                          .tr(),
                                      SizedBox(width: 5),
                                      Icon(LineAwesomeIcons.check_square,
                                          size: 24)
                                    ],
                                  )),
                              SizedBox(height: 15),
                              Container(
                                  width: double.infinity,
                                  child: CupertinoButton(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          .color
                                          .withOpacity(0.03),
                                      padding: EdgeInsets.all(20),
                                      onPressed: () => cancelDialog(),
                                      child: Text("Cancel",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w800))
                                          .tr())),
                            ],
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget buildData({BuildContext context, String key, String value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                key,
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context)
                        .textTheme
                        .headline1
                        .color
                        .withOpacity(0.6)),
              ).tr(),
              Text(' :',
                  style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context)
                          .textTheme
                          .headline1
                          .color
                          .withOpacity(0.6))),
            ],
          ),
          SizedBox(width: 5),
          Text(
            value,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  ///Dialogs
  Future cancelDialog() {
    return showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
              elevation: 0.0,
              backgroundColor: Colors.white,
              insetPadding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cancel Visit',
                          style: TextStyle(fontSize: 16),
                        ).tr(),
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            LineAwesomeIcons.times,
                            size: 20,
                            color: Colors.black54,
                          ),
                          onPressed: () => Get.back(),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.grey[100],
                        child: TextField(
                          controller: TextEditingController(),
                          cursorColor: Theme.of(context).accentColor,
                          autofocus: false,
                          maxLines: 5,
                          decoration: InputDecoration(
                              hintText: tr('Why are you canceling this visit?'),
                              hintStyle: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color
                                      .withOpacity(0.42),
                                  fontSize: 15),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                        width: double.infinity,
                        child: CupertinoButton(
                            color: Theme.of(context)
                                .textTheme
                                .headline1
                                .color
                                .withOpacity(0.6),
                            padding: EdgeInsets.all(20),
                            onPressed: () {},
                            child: Text("Cancel",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800))
                                .tr())),
                  ],
                ),
              ));
        });
  }
}
