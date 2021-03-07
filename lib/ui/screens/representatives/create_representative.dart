import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CreateRepresentative extends StatefulWidget {
  @override
  _CreateRepresentativeState createState() => _CreateRepresentativeState();
}

class _CreateRepresentativeState extends State<CreateRepresentative> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New representative').tr(),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Transform.scale(
          scale: 1.2,
          child: FloatingActionButton.extended(
            onPressed: () {},
            highlightElevation: 0.0,
            foregroundColor: Colors.white,
            elevation: 0.0,
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Save').tr(),
                  SizedBox(width: 5),
                  Icon(LineAwesomeIcons.save)
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
                              'https://image.flaticon.com/icons/png/512/149/149071.png',
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
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
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
            Directionality(
              textDirection: TextDirection.ltr,
              child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: IntlPhoneField(
                    decoration: InputDecoration(
                        hintText: '07xx xxx xxxx',
                        hintTextDirection: TextDirection.rtl,
                        border: InputBorder.none,
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
                    initialCountryCode: 'IQ',
                    onSubmitted: (v) {
                      FocusScope.of(context).nextFocus();
                    },
                  )),
            ),
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
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                maxLines: 7,
                onFieldSubmitted: (v) {
                  FocusScope.of(context).nextFocus();
                },
                decoration: InputDecoration(
                    hintText: tr('Write full description'),
                    border: InputBorder.none,
                    alignLabelWithHint: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
