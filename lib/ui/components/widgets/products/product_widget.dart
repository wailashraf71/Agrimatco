import 'package:agrimatco/ui/screens/products/edit_product.dart';
import 'package:agrimatco/ui/screens/products/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

class ProductWidget extends StatelessWidget {
  final int productId;
  final String title;
  final String image;
  final int price;
  final double priceUsd;

  final bool edit;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final String currency = '';

  ProductWidget(
      {Key key,
      this.productId,
      this.title,
      this.image,
      this.price,
      this.priceUsd,
      this.edit = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.transparent,
      body: Container(
        child: CupertinoButton(
          pressedOpacity: edit ? 1 : 0.4,
          padding: EdgeInsets.zero,
          color: Colors.white,
          onPressed: () => Get.to(Product(
            id: productId,
          )),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Center(
                          child: CachedNetworkImage(
                              imageUrl: image,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.center,
                              placeholder: (context, url) =>
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[50],
                                    highlightColor: Colors.grey[100],
                                    child: Container(
                                      color: Colors.white,
                                    ),
                                  )),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: <Widget>[
                                    if (title != null)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        child: Text(title,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                height: 1.1,
                                                fontSize: 12)),
                                      ),
                                    SizedBox(height: 2),
                                    Row(
                                      children: <Widget>[
                                        if (price != null)
                                          if (currency == 'usd')
                                            Text(
                                                '\$$priceUsd' +
                                                    ' ${tr(currency)}',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .accentColor
                                                        .withOpacity(.9))),
                                        if (currency == 'iqd')
                                          Text('$price' + ' ${tr(currency)}',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .accentColor
                                                      .withOpacity(.9))),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // CupertinoButton(
                              //   padding: EdgeInsets.zero,
                              //   onPressed: () => addToCart(Product(
                              //     title: widget.title,
                              //     image: widget.image,
                              //     id: widget.productId,
                              //     quantity: 1,
                              //     boxItems: widget.boxItems,
                              //     price: widget.price.toDouble(),
                              //     priceUsd: widget.priceUsd.toDouble()
                              //   )),
                              //   child: ClipRRect(
                              //     borderRadius: BorderRadius.circular(5),
                              //     child: Container(
                              //         color: Theme.of(context).accentColor,
                              //         padding: EdgeInsets.all(5),
                              //         child: Icon(FeatherIcons.plus,
                              //             color: Theme.of(context).primaryColor,
                              //             size: 20)),
                              //   ),
                              // )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              if (edit)
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 35,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey[100], shape: BoxShape.circle),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          icon: Icon(LineAwesomeIcons.edit, size: 20),
                          onPressed: () => Get.to(EditProduct(
                            image: image,
                            title: title,
                            price: price,
                          )),
                          color: Colors.black54,
                        )),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
