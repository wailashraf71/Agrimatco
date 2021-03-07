import 'package:agrimatco/ui/screens/representatives/assign_visit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RepresentativeCard extends StatefulWidget {
  final int id;
  final double rating;
  final bool preview;

  const RepresentativeCard(
      {Key key, this.id, this.rating, this.preview = false})
      : super(key: key);

  @override
  _RepresentativeCardState createState() => _RepresentativeCardState();
}

class _RepresentativeCardState extends State<RepresentativeCard> {
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: widget.id,
      duration: const Duration(milliseconds: 275),
      child: SlideAnimation(
        horizontalOffset: 50,
        child: FadeInAnimation(
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              if (!widget.preview) buildRepresentativeInfo(context);
            },
            child: AnimatedContainer(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              duration: Duration(milliseconds: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 45.0,
                    width: 45.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.black.withOpacity(0.07), width: 2.0)),
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'John Doe',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              .color
                                              .withOpacity(0.7),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: Text(
                                        '0770 123 4567',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              .color
                                              .withOpacity(0.3),
                                          fontSize: 11,
                                        ),
                                      ).tr(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          if (widget.rating != 0 && widget.rating != 0)
                            Column(
                              children: [
                                SmoothStarRating(
                                    allowHalfRating: true,
                                    isReadOnly: true,
                                    starCount: 5,
                                    rating: 4.5,
                                    size: 15.0,
                                    color: Color(0xffFFC312).withOpacity(0.9),
                                    borderColor:
                                        Color(0xffFFC312).withOpacity(0.8),
                                    spacing: 0.0),
                                SizedBox(height: 3),
                                Text(
                                  '(4.5/5)',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black26),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future buildRepresentativeInfo(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          bool rated = false;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlimyCard(
                color: Colors.white,
                width: 300,
                topCardHeight: 400,
                bottomCardHeight: 200,
                borderRadius: 15,
                topCardWidget: buildTopCard(context),
                bottomCardWidget: buildBottomCard(rated),
                slimeEnabled: true,
              ),
            ],
          );
        });
  }
}

Widget buildTopCard(BuildContext context) {
  return Material(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            padding: EdgeInsets.zero,
            splashRadius: 20,
            icon: Icon(
              LineAwesomeIcons.times,
              size: 20,
              color: Colors.black54,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        Container(
          height: 90.0,
          width: 90.0,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                  color: Colors.black.withOpacity(0.07), width: 2.0)),
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
        SizedBox(height: 15),
        Text(
          'John Doe',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Theme.of(context).textTheme.headline1.color.withOpacity(0.7),
          ),
        ).tr(),
        SizedBox(height: 2),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            '0770 123 4567',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: Theme.of(context).textTheme.headline1.color.withOpacity(0.3),
              fontSize: 13,
            ),
          ).tr(),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, pulvinar facilisis justo mollis, auctor consequat urna. Morbi a bibendum metus.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color:
                  Theme.of(context).textTheme.headline1.color.withOpacity(0.3),
              fontSize: 13,
            ),
          ).tr(),
        ),
      ],
    ),
  );
}

Material buildBottomCard(bool rated) {
  return Material(
    color: Colors.white,
    child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: StatefulBuilder(builder: (BuildContext context, setState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Change rating').tr(),
              SizedBox(height: 10),
              SmoothStarRating(
                allowHalfRating: true,
                starCount: 5,
                rating: 0.0,
                size: 30.0,
                color: Color(0xffFFC312).withOpacity(0.9),
                borderColor: Color(0xffFFC312).withOpacity(0.8),
                spacing: 0.0,
                onRated: (_) {
                  setState(() {
                    rated = true;
                  });
                },
              ),
              Divider(),
              SizedBox(height: 10),
              CupertinoButton(
                  color: Theme.of(context).accentColor,
                  child: Text('Assign visit').tr(),
                  onPressed: () => Get.off(() => AssignVisit()))
            ],
          );
        })),
  );
}
