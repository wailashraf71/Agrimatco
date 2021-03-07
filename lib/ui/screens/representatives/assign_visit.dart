import 'package:agrimatco/ui/components/widgets/representatives/representative_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AssignVisit extends StatefulWidget {
  @override
  _AssignVisitState createState() => _AssignVisitState();
}

class _AssignVisitState extends State<AssignVisit> {
  String selectedDelivery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Assign visit', style: TextStyle(fontWeight: FontWeight.w700))
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
                  Text('Assign').tr(),
                  SizedBox(width: 5),
                  Icon(LineAwesomeIcons.calendar_check)
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
                //Description
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Representative Info',
                    style: TextStyle(fontSize: 16),
                  ).tr(),
                ),
                SizedBox(height: 10),
                RepresentativeCard(
                  id: 1,
                  preview: true,
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
                              'From',
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
                                  hintText: tr('12:00 AM'),
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
                          //To
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Text(
                              'To',
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
                                  hintText: '12:00 PM',
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
                //Description
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    'Visit description',
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
                    maxLines: 10,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                        hintText: tr("Enter visit's full info"),
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
