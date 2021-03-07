import 'package:agrimatco/ui/screens/representatives/visit_summary.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VisitWidget extends StatelessWidget {
  final bool preview;

  const VisitWidget({Key key, this.preview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      pressedOpacity: preview ? 0.4 : 1,
      onPressed: () => showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return VisitSummary(previewWithAccept: preview ? false : true);
          }),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(color: Colors.grey[100]),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey[600],
                          )),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 70.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'New visit',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        .color
                                        .withOpacity(0.76)),
                              ).tr(),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text('Iraq, Baghdad',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color
                                      .withOpacity(0.35))),
                          SizedBox(height: 3),
                          Text('2:30 PM',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color
                                      .withOpacity(0.35))),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
