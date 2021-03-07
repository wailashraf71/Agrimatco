import 'package:agrimatco/Model/UnitModel.dart';
import 'package:agrimatco/ui/components/widgets/products/products_grid.dart';
import 'package:agrimatco/ui/components/widgets/search/search_bar.dart';
import 'package:agrimatco/ui/components/widgets/units/units_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:weather_widget/WeatherWidget.dart';

class Home extends StatefulWidget {
  final ScrollController scrollController;

  const Home({Key key, this.scrollController}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: widget.scrollController,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Hero(
                    tag: 'searchBar',
                    child: SearchBar(
                      preview: true,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 180,
                      child: Stack(
                        children: [
                          Container(
                            child: WeatherWidget(
                                size: Size.fromHeight(100),
                                weather: 'Rainy',
                                rainConfig: RainConfig(rainNum: 10)),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(.22),
                                      offset: Offset(0, 40),
                                      spreadRadius: 30,
                                      blurRadius: 40)
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: 110,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '28°',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 30),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Mosul',
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 12)),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        width: 65,
                                        child: Row(
                                          children: [
                                            Icon(
                                              LineAwesomeIcons
                                                  .cloud_with_moon_and_rain,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              '10%',
                                              style: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
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
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Units',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54),
                      ).tr(),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 165,
                      width: double.infinity,
                      child: UnitsList(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        listofunits: [
                          UnitModel(
                              id: 1,
                              image:
                                  'https://images.pexels.com/photos/175389/pexels-photo-175389.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                              name: 'Unit name',
                              notes: 'lorem ipsum dolor sit amet'),
                          UnitModel(
                              id: 1,
                              image:
                                  'https://images.pexels.com/photos/2284170/pexels-photo-2284170.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                              name: 'Unit name',
                              notes: 'lorem ipsum dolor sit amet'),
                          UnitModel(
                              id: 1,
                              image:
                                  'https://images.pexels.com/photos/2131784/pexels-photo-2131784.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                              name: 'Unit name',
                              notes: 'lorem ipsum dolor sit amet'),
                          UnitModel(
                              id: 1,
                              image:
                                  'https://images.pexels.com/photos/2132250/pexels-photo-2132250.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                              name: 'Unit name',
                              notes: 'lorem ipsum dolor sit amet'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Products',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54),
                      ).tr(),
                      SizedBox(height: 10),
                      ProductsGrid(),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
