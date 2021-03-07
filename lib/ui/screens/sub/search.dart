import 'package:agrimatco/ui/components/dummy_data.dart';
import 'package:agrimatco/ui/components/widgets/search/search_bar.dart';
import 'package:agrimatco/ui/components/widgets/search/search_result.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Hero(
            tag: 'searchBar',
            child: SearchBar(
              searchController: TextEditingController(),
              color: Colors.grey[100],
              height: 40,
              preview: false,
            ),
          ),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: ListView.separated(
                itemCount: products.length,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                itemBuilder: (context, index) {
                  return SearchResult(
                    title: products[index]['title'],
                    image: products[index]['image'],
                    quantity: index,
                    price: double.parse("${products[index]['price']}"),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
              )),
            ]));
  }
}
