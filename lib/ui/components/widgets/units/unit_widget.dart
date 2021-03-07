import 'package:agrimatco/ui/screens/units/unit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class UnitWidget extends StatelessWidget {
  final String title;
  final String image;
  final String subtitle;

  UnitWidget({
    Key key,
    this.title = "",
    this.image = "",
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => Get.to(Unit()),
      padding: EdgeInsets.zero,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(9),
                    topLeft: Radius.circular(9)),
                child: CachedNetworkImage(
                    imageUrl: image ?? '',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: Colors.white24,
                          child: Container(
                            color: Colors.white,
                          ),
                        ))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontWeight: FontWeight.w700,
                        height: 2,
                        fontSize: 14)),
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .color
                                .withOpacity(.45),
                            fontSize: 10)),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
