import 'package:agrimatco/ui/screens/orders/order_summary.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  final bool preview;

  const OrderWidget({Key key, this.preview = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      pressedOpacity: preview ? 0.4 : 1,
      onPressed: () => showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return OrderSummary(previewWithAccept: preview ? false : true);
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
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 90.0,
                        width: 90.0,
                        decoration: BoxDecoration(color: Colors.white),
                        child: CachedNetworkImage(
                          imageUrl: '',
                          // imageUrl: 'https://www.lolichheatandair.com/wp-content/uploads/2020/02/AdobeStock_290366802-1024x683.jpeg',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 85.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '#1316',
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
