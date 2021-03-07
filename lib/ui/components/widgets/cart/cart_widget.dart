import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CartWidget extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  final double price;
  final int quantity;

  const CartWidget(
      {Key key, this.id, this.image, this.title, this.price, this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 160,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7)),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: new Row(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: Container(
                  child: Center(
                    child: CachedNetworkImage(
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                        imageUrl: image,
                        placeholder: (context, url) =>
                            Container(color: Colors.grey[100])),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 9,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Text(title ?? '',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 13)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Icon(
                                        LineAwesomeIcons.times,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  onTap: () {})
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text('\$$price ' + tr('usd'),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                  color: Colors.grey[700],
                                  fontSize: 15)),
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.grey[300]),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      LineAwesomeIcons.minus,
                                      size: 18,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller:
                                      TextEditingController(text: '$quantity'),
                                  cursorColor: Theme.of(context).accentColor,
                                  keyboardType: TextInputType.number,
                                  autofocus: false,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: '0',
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
                                  ),
                                ),
                              ),
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.grey[300]),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      LineAwesomeIcons.plus,
                                      size: 18,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ]));
  }
}
