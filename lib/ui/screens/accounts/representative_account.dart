import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class RepresentativeAccount extends StatefulWidget {
  @override
  _RepresentativeAccountState createState() => _RepresentativeAccountState();
}

class _RepresentativeAccountState extends State<RepresentativeAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Representative account').tr(),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: 150,
          height: 55,
          child: FloatingActionButton.extended(
            onPressed: () {},
            highlightElevation: 0.0,
            foregroundColor: Colors.white,
            elevation: 0.0,
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Save',
                    style: TextStyle(fontSize: 16),
                  ).tr(),
                  SizedBox(width: 5),
                  Icon(
                    LineAwesomeIcons.save,
                    size: 26,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Container(
              height: 220.0,
              width: 220.0,
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      height: 200.0,
                      width: 200.0,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.black.withOpacity(0.07),
                              width: 2.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://images.unsplash.com/photo-1537511446984-935f663eb1f4?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 190.0,
                      width: 190.0,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            width: 45,
                            height: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              alignment: Alignment.center,
                              icon: Icon(LineAwesomeIcons.edit, size: 25),
                              color: Colors.black54,
                              onPressed: () {},
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'Full Name',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ).tr(),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: TextEditingController(text: 'John Doe'),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textDirection:
                    EasyLocalization.of(context).locale == Locale('en', 'US')
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                onFieldSubmitted: (v) {
                  FocusScope.of(context).nextFocus();
                },
                decoration: InputDecoration(
                    hintText: tr("Enter representative's name"),
                    border: InputBorder.none,
                    alignLabelWithHint: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'Phone number',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ).tr(),
            ),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: IntlPhoneField(
                    controller: TextEditingController(text: '771 123 4567'),
                    decoration: InputDecoration(
                        hintText: '07xx xxx xxxx',
                        border: InputBorder.none,
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                    initialCountryCode: 'IQ',
                    onSubmitted: (v) {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                )),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ).tr(),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: TextEditingController(
                    text: 'Market agent of unit X at position Y'),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                maxLines: 4,
                onFieldSubmitted: (v) {
                  FocusScope.of(context).nextFocus();
                },
                decoration: InputDecoration(
                    hintText: tr("Write full description"),
                    border: InputBorder.none,
                    alignLabelWithHint: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
