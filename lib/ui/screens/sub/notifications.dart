import 'package:agrimatco/ui/components/widgets/visits/visit_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Notifications', style: TextStyle(fontWeight: FontWeight.w700))
                .tr(),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black12,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          itemBuilder: (BuildContext context, int index) {
            return VisitWidget(preview: false);
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10);
          },
          itemCount: 2),
    );
  }
}
