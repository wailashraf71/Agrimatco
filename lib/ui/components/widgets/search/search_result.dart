import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  final double price;
  final int quantity;

  const SearchResult(
      {Key key, this.id, this.image, this.title, this.price, this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 160,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7)),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                        Expanded(
                          child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, pulvinar facilisis justo mollis, auctor urna.',
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 10)),
                        ),
                        Row(
                          children: [
                            Text('\$$price ' + tr('usd'),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                    color: Colors.grey[700],
                                    fontSize: 15)),
                          ],
                        )
                      ],
                    )),
              ),
            ]));
  }
}
