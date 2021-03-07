import 'package:agrimatco/ui/screens/sub/search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final bool preview;
  final Color color;
  final double height;

  const SearchBar(
      {Key key, this.searchController, this.preview, this.color, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: height ?? 50.0,
              decoration: BoxDecoration(
                color: color ?? Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    LineIcons.search,
                    color: Theme.of(context)
                        .textTheme
                        .headline1
                        .color
                        .withOpacity(0.78),
                    size: 23,
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      cursorColor: Theme.of(context).accentColor,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: tr('search_hint'),
                        hintStyle: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headline1
                                .color
                                .withOpacity(0.42),
                            fontSize: 15),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            bottom: height == null ? 0 : 10, left: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (preview)
              CupertinoButton(
                onPressed: () => Get.to(() => Search(),
                    transition: Transition.fadeIn, fullscreenDialog: true),
                child: Container(),
              ),
          ],
        ),
      ),
    );
  }
}
