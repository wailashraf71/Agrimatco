import 'package:agrimatco/ui/app.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  TextEditingController _fullName = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _notes = TextEditingController();
  String city;
  String longitude;
  String latitude;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Review order', style: TextStyle(fontWeight: FontWeight.w700))
                .tr(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                //Name
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: _fullName,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).nextFocus();
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return tr('This field is required');
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: tr('Your name'),
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                  ),
                ),
                SizedBox(height: 20),
                //Location
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: _address,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).nextFocus();
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return tr('This field is required');
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: tr('Address or street'),
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                  ),
                ),
                SizedBox(width: 15),
                SizedBox(height: 20),
                //Location
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton<String>(
                    items: [
                      'واسط',
                      'السليمانية',
                      'صلاح الدين',
                      'القادسية',
                      'نينوى',
                      'النجف',
                      'المثنى',
                      'ميسان',
                      'كركوك',
                      'كربلاء',
                      'اربيل',
                      'دهوك',
                      'ديالى',
                      'ذي قار',
                      'البصرة',
                      'بغداد',
                      'بابل',
                      'الانبار'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: city ?? value,
                        child: Text(
                          '$value',
                          style: TextStyle(
                              fontSize: 14,
                              color:
                                  Theme.of(context).textTheme.headline1.color),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {},
                    hint: Text(
                      city ?? 'Province',
                      style: TextStyle(fontSize: 15),
                    ).tr(),
                    isExpanded: true,
                    underline: Container(),
                    elevation: 5,
                    style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.headline1.fontFamily,
                        fontSize: 20),
                    dropdownColor: Theme.of(context).primaryColor,
                    icon: Icon(Icons.keyboard_arrow_down),
                  ),
                ),
                SizedBox(height: 20),
                //Phone
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: _phone,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).nextFocus();
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return tr('This field is required');
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: tr('Phone number'),
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: _notes,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    maxLines: 6,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).nextFocus();
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return tr('This field is required');
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: tr('Comments or notes'),
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                  ),
                ),
                if (MediaQuery.of(context).size.width > 600)
                  buildBottomBar(context),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width < 600
          ? buildBottomBar(context)
          : null,
    );
  }

  Widget buildBottomBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border(top: BorderSide(color: Colors.grey[200]))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Items count', style: TextStyle(fontSize: 12)).tr(),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          children: [
                            Icon(
                              LineAwesomeIcons.box,
                              color: Colors.grey[700],
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            Text("5",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Total Price', style: TextStyle(fontSize: 17)).tr(),
                    Text("2500" + ' ' + tr('iqd'),
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w700))
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "By placing this order, you're totally agreeing to our terms of service.",
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context)
                          .textTheme
                          .headline1
                          .color
                          .withOpacity(0.3)),
                ).tr(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: CupertinoButton(
                        color: Theme.of(context).accentColor,
                        padding: EdgeInsets.all(15),
                        onPressed: () => Get.offAll(App()),
                        child: new Text("Send Order!",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800))
                            .tr()),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
