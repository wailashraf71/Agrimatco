import 'package:agrimatco/ui/components/dummy_data.dart';
import 'package:agrimatco/ui/components/widgets/products/product_widget.dart';
import 'package:flutter/material.dart';

class ProductsGrid extends StatelessWidget {
  final EdgeInsets padding;
  final bool edit;

  const ProductsGrid({Key key, this.padding, this.edit = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // padding: padding ?? EdgeInsets.symmetric(horizontal: 15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 500 ? 3 : 2,
            childAspectRatio: 9 / 12,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductWidget(
            edit: edit,
            productId: products[index]['id'],
            image: products[index]['image'],
            title: products[index]['title'],
            price: products[index]['price'],
          );
        });
  }
}
