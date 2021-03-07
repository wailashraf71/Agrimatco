import 'package:agrimatco/ui/components/widgets/representatives/representative_card.dart';
import 'package:agrimatco/ui/screens/representatives/create_representative.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Representatives extends StatefulWidget {
  @override
  _RepresentativesState createState() => _RepresentativesState();
}

class _RepresentativesState extends State<Representatives> {
  String location;
  String visitTime;

  int serviceCount = 1;
  int providerId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(LineAwesomeIcons.user_plus),
              onPressed: () => Get.to(() => CreateRepresentative()))
        ],
        title: Text('Representatives',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    height: 1.8,
                    fontWeight: FontWeight.w700))
            .tr(),
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      LineAwesomeIcons.sort_amount_down,
                      color: Theme.of(context).accentColor,
                    ),
                    SizedBox(width: 5),
                    Text('Sort By: ').tr(),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Text('Visits').tr(),
                    ),
                    Text(','),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Text('Sales').tr(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              AnimationLimiter(
                child: Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children: [1, 2, 3, 4, 5, 6, 7, 8]
                      .map((item) => RepresentativeCard(
                            id: item,
                            preview: false,
                          ))
                      .toList()
                      .cast<Widget>(),
                ),
              ),
              SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
