import 'package:agrimatco/ui/screens/orders/orders.dart';
import 'package:agrimatco/ui/screens/products/create_product.dart';
import 'package:agrimatco/ui/screens/products/products.dart';
import 'package:agrimatco/ui/screens/representatives/assign_visit.dart';
import 'package:agrimatco/ui/screens/representatives/create_representative.dart';
import 'package:agrimatco/ui/screens/representatives/representatives.dart';
import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:pie_chart/pie_chart.dart' as pe;
import 'package:start_chart/start_chart.dart';

class UnitManagerAccount extends StatefulWidget {
  @override
  _UnitManagerAccountState createState() => _UnitManagerAccountState();
}

class _UnitManagerAccountState extends State<UnitManagerAccount> {
  List<double> points = [50, 90, 1003, 500, 150, 120, 200];
  List<String> labels = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  Map<String, double> dataMap = {
    "Vists": 500,
    "Orders": 300,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit manager account').tr(),
        actions: [
          Badge(
            elevation: 0.0,
            badgeColor: Colors.white,
            padding: EdgeInsets.all(1),
            position: BadgePosition(top: 5, end: 5),
            badgeContent: Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.redAccent, shape: BoxShape.circle),
              child: Text(
                '3',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold),
              ),
            ),
            child: IconButton(
                icon: Icon(LineAwesomeIcons.clipboard_list),
                onPressed: () => Get.to(Orders())),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[100]),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Representatives',
                              style: TextStyle(color: Colors.grey[700]),
                            ).tr(),
                            SizedBox(width: 5),
                            Icon(LineAwesomeIcons.users,
                                color: Colors.grey[700]),
                          ],
                        ),
                      ),
                      onPressed: () => Get.to(() => Representatives())),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[100]),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Products',
                              style: TextStyle(color: Colors.grey[700]),
                            ).tr(),
                            SizedBox(width: 5),
                            Icon(LineAwesomeIcons.box, color: Colors.grey[700]),
                          ],
                        ),
                      ),
                      onPressed: () => Get.to(() => Products())),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: floatingMenu(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    statisticCard(context, "Total Visits", "150", "Manage Vists"),
                    statisticCard(
                        context, "Total Orders", "120", "Manage Orders"),
                    statisticCard(context, "Representatives", "50",
                        "Manage Representatives"),
                    statisticCard(
                        context, "Total Products", "2,150", "Manage Products"),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Orders by week",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black54),
                ).tr(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: BarChart(
                      data: points,
                      labels: labels,
                      color: Theme.of(context).accentColor,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Orders by month",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black54),
                ).tr(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: pe.PieChart(
                        dataMap: dataMap,
                        animationDuration: Duration(milliseconds: 800),
                        chartLegendSpacing: 32,
                        chartRadius: MediaQuery.of(context).size.width / 3.2,
                        colorList: [Colors.blue, Theme.of(context).accentColor],
                        initialAngleInDegree: 0,
                        chartType: pe.ChartType.ring,
                        ringStrokeWidth: 32,
                        centerText: "Visits , Orders",
                        legendOptions: pe.LegendOptions(
                          showLegendsInRow: false,
                          legendPosition: pe.LegendPosition.right,
                          showLegends: true,
                          legendShape: BoxShape.circle,
                          legendTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        chartValuesOptions: pe.ChartValuesOptions(
                          showChartValueBackground: true,
                          showChartValues: true,
                          showChartValuesInPercentage: false,
                          showChartValuesOutside: false,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget floatingMenu(BuildContext context) {
    return BoomMenu(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 26.0, color: Colors.white),
      overlayColor: Colors.grey[900],
      overlayOpacity: 0.8,
      animationSpeed: 200,
      marginLeft: -5,
      marginRight: 10,
      fabAlignment: EasyLocalization.of(context).locale == Locale('en', 'US')
          ? Alignment.centerRight
          : Alignment.centerLeft,
      elevation: 0.0,
      children: [
        MenuItem(
          child: Icon(FontAwesomeIcons.boxes,
              color: Theme.of(context).accentColor),
          title: tr("Create new product"),
          titleColor: Theme.of(context).accentColor,
          subtitle: tr("Add new product to this unit."),
          subTitleColor: Colors.black54,
          backgroundColor: Colors.white,
          elevation: 0.0,
          onTap: () => Get.to(() => CreateProduct()),
        ),
        MenuItem(
          child: Icon(FontAwesomeIcons.userPlus,
              color: Theme.of(context).accentColor),
          title: tr('Add representatives'),
          titleColor: Theme.of(context).accentColor,
          subtitle: tr('Create an account for new representative.'),
          subTitleColor: Colors.black54,
          elevation: 0.0,
          backgroundColor: Colors.white,
          onTap: () => Get.to(() => CreateRepresentative()),
        ),
        MenuItem(
          child: Icon(FontAwesomeIcons.peopleArrows,
              color: Theme.of(context).accentColor),
          title: tr("Assign visit to representative"),
          titleColor: Theme.of(context).accentColor,
          subtitle: tr('Send a visit order to chosen representative'),
          subTitleColor: Colors.black54,
          backgroundColor: Colors.white,
          elevation: 0.0,
          onTap: () => Get.to(() => AssignVisit()),
        )
      ],
    );
  }

  Widget statisticCard(BuildContext context, title, number, link) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 100,
      width: (MediaQuery.of(context).size.width / 2) - 25,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              child: Text(
                "${tr(title)}",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ).tr(),
            ),
            SizedBox(height: 3),
            Text(
              "$number",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3),
            Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "$link",
                  style: TextStyle(fontSize: 10, color: Colors.blue),
                ))
          ],
        ),
      ),
    );
  }
}
