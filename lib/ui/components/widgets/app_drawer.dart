import 'package:agrimatco/ui/components/dialogs/calculator_dialog.dart';
import 'package:agrimatco/ui/screens/accounts/representative_account.dart';
import 'package:agrimatco/ui/screens/accounts/unit_manager_account.dart';
import 'package:agrimatco/ui/screens/auth/login.dart';
import 'package:agrimatco/ui/screens/sub/blog.dart';
import 'package:agrimatco/ui/screens/sub/market_report.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.white),
      child: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(bottom: 15, top: 10),
                    child: Text(
                      'Agrimatco',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'NotoNaskhArabic',
                          height: 1.8,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold),
                    ).tr()),
                Text(
                  '0.0.1',
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context)
                          .textTheme
                          .headline1
                          .color
                          .withOpacity(0.4)),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              LineAwesomeIcons.user_cog,
              color: Colors.black,
            ),
            title: Text('Unit manager account',
                    style: TextStyle(fontWeight: FontWeight.w400))
                .tr(),
            onTap: () => Get.to(UnitManagerAccount()),
          ),
          ListTile(
            leading: Icon(
              LineAwesomeIcons.user,
              color: Colors.black,
            ),
            title: Text('Representative account',
                    style: TextStyle(fontWeight: FontWeight.w400))
                .tr(),
            onTap: () => Get.to(RepresentativeAccount()),
          ),
          ListTile(
            leading: Icon(
              LineAwesomeIcons.newspaper,
              color: Colors.black,
            ),
            title: Text('Blog', style: TextStyle(fontWeight: FontWeight.w400))
                .tr(),
            onTap: () => Get.to(Blog()),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              LineAwesomeIcons.pie_chart,
              color: Colors.black,
            ),
            title: Text('Market Report',
                    style: TextStyle(fontWeight: FontWeight.w400))
                .tr(),
            onTap: () => Get.to(MarketReport()),
          ),
          ListTile(
            leading: Icon(
              LineAwesomeIcons.hanging_weight,
              color: Colors.black,
            ),
            title: Text('Ton to Kg converter',
                    style: TextStyle(fontWeight: FontWeight.w400))
                .tr(),
            onTap: () => converterDialog(),
          ),
          ListTile(
            leading: Icon(
              LineAwesomeIcons.calculator,
              color: Colors.black,
            ),
            title: Text('Calculator',
                    style: TextStyle(fontWeight: FontWeight.w400))
                .tr(),
            onTap: () => calculatorDialog(context: context),
          ),
          ListTile(
            leading: Icon(
              LineAwesomeIcons.cog,
              color: Colors.black,
            ),
            title: Text('Translate to arabic',
                    style: TextStyle(fontWeight: FontWeight.w400))
                .tr(),
            onTap: () => changeLanguage(),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              LineAwesomeIcons.unlock,
              color: Colors.black,
            ),
            title:
                Text('Sign In', style: TextStyle(fontWeight: FontWeight.w400))
                    .tr(),
            onTap: () => Get.to(Login()),
          ),
          ListTile(
            leading: Icon(
              LineAwesomeIcons.share,
              color: Colors.black,
            ),
            title:
                Text('Share app', style: TextStyle(fontWeight: FontWeight.w400))
                    .tr(),
            onTap: () =>
                Share.share('check out my website https://example.com'),
          ),
          ListTile(
            leading: Icon(
              LineAwesomeIcons.phone,
              color: Colors.black,
            ),
            title: Text('Contact us',
                    style: TextStyle(fontWeight: FontWeight.w400))
                .tr(),
            onTap: () => launch("tel://+9647712345678"),
          ),
          ListTile(
            leading: Icon(
              LineAwesomeIcons.comment,
              color: Colors.black,
            ),
            title: Text('Terms & conditions',
                    style: TextStyle(fontWeight: FontWeight.w400))
                .tr(),
            onTap: () => launch("https://flutter.dev"),
          ),
          ListTile(
            leading: Icon(
              LineAwesomeIcons.exclamation_circle,
              color: Colors.black,
            ),
            title:
                Text('About us', style: TextStyle(fontWeight: FontWeight.w400))
                    .tr(),
            onTap: () => launch("https://flutter.dev"),
          ),
        ],
      )),
    );
  }

  void changeLanguage() async {
    if (EasyLocalization.of(context).locale == Locale('ar', 'IQ')) {
      EasyLocalization.of(context).locale = Locale('en', 'US');
      await FlutterSecureStorage().write(key: 'language', value: 'en');
    } else {
      EasyLocalization.of(context).locale = Locale('ar', 'IQ');
      await FlutterSecureStorage().write(key: 'language', value: 'ar');
    }
  }

  ///Dialogs
  Future converterDialog() {
    TextEditingController _tonController = TextEditingController();
    TextEditingController _kiloController = TextEditingController();
    Get.back();
    return showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                  elevation: 0.0,
                  insetPadding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  scrollable: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ton to Kg converter',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ).tr(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          LineIcons.times,
                          size: 20,
                          color: Colors.black54,
                        ),
                        onPressed: () => Get.back(),
                      )
                    ],
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Divider(),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          'Ton',
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
                          controller: _tonController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          onChanged: (v) {
                            if (v == '')
                              setState(() {
                                _kiloController.text = '0';
                              });
                            setState(() {
                              _kiloController.text =
                                  '${(int.parse(v) * 907.185)}';
                            });
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
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          'Kg',
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
                          controller: _kiloController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          onChanged: (v) {
                            if (v == '')
                              setState(() {
                                _tonController.text = '0';
                              });
                            setState(() {
                              _tonController.text =
                                  '${(int.parse(v) / 907.185)}';
                            });
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
                  ));
            },
          );
        });
  }
}
