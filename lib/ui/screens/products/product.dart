import 'package:agrimatco/ui/components/dummy_data.dart';
import 'package:agrimatco/ui/components/widgets/products/product_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shimmer/shimmer.dart';

class Product extends StatefulWidget {
  final int id;

  Product({Key key, this.id = 2}) : super(key: key);

  @override
  ProductState createState() => ProductState();
}

class ProductState extends State<Product> with TickerProviderStateMixin {
  PageController imagesPageController = PageController();

  int selectedVariantNumber = 0;

  String size = '41';
  String color = 'white';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: buildBottomBar(context),
          body: RefreshIndicator(
            onRefresh: () {
              return Future.value(0);
            },
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  brightness: Brightness.light,
                  flexibleSpace: AnnotatedRegion<SystemUiOverlayStyle>(
                    value: SystemUiOverlayStyle(
                      systemNavigationBarColor: Colors.white,
                      statusBarColor: Colors.transparent,
                    ),
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: imageView(),
                    ),
                  ),
                  leading: IconButton(
                      icon: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      onPressed: () => Get.back()),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  pinned: true,
                  expandedHeight: MediaQuery.of(context).size.height * 0.53,
                ),
                SliverToBoxAdapter(
                  child: productInfo(),
                ),
                SliverToBoxAdapter(
                  child: buildRelatedHeader(context),
                ),
                SliverToBoxAdapter(
                  child: buildRelated(),
                ),
                SliverPadding(padding: EdgeInsets.all(10))
              ],
            ),
          )),
    );
  }

  Widget buildRelated() {
    return Container(
      height: 200,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 15),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 150,
              child: ProductWidget(
                title: products[index]['title'],
                productId: products[index]['id'],
                price: 12,
                image: products[index]['image'],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 15,
            );
          },
          itemCount: products.length),
    );
  }

  Widget buildRelatedHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('More from this unit',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.headline1.color,
                        fontWeight: FontWeight.w700))
                .tr(),
          ],
        ),
      ),
    );
  }

  Widget buildBottomBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(children: <Widget>[
            Container(
              width: 50,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(
                      LineIcons.minus,
                      size: 18,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text('1',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold))),
            Container(
              width: 50,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(
                      LineIcons.plus,
                      size: 18,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ),
            ),
          ]),
          Container(
              width: MediaQuery.of(context).size.width * .56,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CupertinoButton(
                    color: Theme.of(context).accentColor,
                    padding: EdgeInsets.all(15),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(LineIcons.addToShoppingCart),
                        SizedBox(width: 7),
                        Text("Add to cart",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800))
                            .tr(),
                      ],
                    )),
              ))
        ],
      ),
    );
  }

  ///Widgets
  Widget imageView() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.64,
      child: Stack(
        children: <Widget>[
          PageView.builder(
              physics: PageScrollPhysics(),
              controller: imagesPageController,
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return CachedNetworkImage(
                    imageUrl: products[widget.id]['image'],
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    placeholder: (context, url) => Stack(children: <Widget>[
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.grey[100],
                            direction: ShimmerDirection.ltr,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                          Center(
                            child: Icon(
                              Icons.image,
                              size: 70,
                              color: Colors.grey.withOpacity(.3),
                            ),
                          )
                        ]));
              }),
        ],
      ),
    );
  }

  Widget productInfo() {
    return Container(
      color: Colors.grey[50],
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ///Title
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(products[widget.id]['title'],
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      height: 1.2,
                      color: Colors.black)),
            ),

            ///Price
            Container(
              child: Text("\$60.0",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ),

            SizedBox(height: 10),

            ///Description
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description',
                          style: TextStyle(
                              fontSize: 16,
                              color:
                                  Theme.of(context).textTheme.headline1.color,
                              fontWeight: FontWeight.w700))
                      .tr(),
                  SizedBox(height: 10),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .textTheme
                            .headline1
                            .color
                            .withOpacity(0.4)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productDescription(Product product) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Description",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Container(
                    child: Text('Or do you need more?',
                        style: TextStyle(color: Colors.grey, fontSize: 13)),
                  ))
            ]));
  }
}
