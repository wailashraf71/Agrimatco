import 'package:after_layout/after_layout.dart';
import 'package:agrimatco/Repo/homeRepo.dart';
import 'package:agrimatco/ui/components/widgets/app_drawer.dart';
import 'package:agrimatco/ui/screens/home.dart';
import 'package:agrimatco/ui/screens/representatives/shopping/cart.dart';
import 'package:agrimatco/ui/screens/sub/notifications.dart';
import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  _App createState() => new _App();
}

class _App extends State<App> with AfterLayoutMixin {
  ScrollController _scrollController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _scrollController = new ScrollController();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: AppDrawer(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: 65,
            height: 65,
            child: FloatingActionButton(
              onPressed: () => Get.to(() => Cart()),
              foregroundColor: Colors.white,
              highlightElevation: 0.0,
              elevation: 0.0,
              child: Icon(LineAwesomeIcons.shopping_cart, size: 32),
            ),
          ),
        ),
        appBar: CustomAppBar(
          onTap: () => scrollUp(_scrollController),
          appBar: AppBar(
            title: Text(
              'Agrimatco',
              style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.headline1.color,
                  fontWeight: FontWeight.w700,
                  fontFamily:
                      Theme.of(context).primaryTextTheme.headline1.fontFamily),
            ).tr(),
            centerTitle: true,
            brightness: Brightness.light,
            elevation: 0,
            leading: IconButton(
              icon: Icon(LineIcons.bars),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            actions: [
              IconButton(
                icon: Badge(
                    elevation: 0,
                    badgeColor: Colors.white,
                    padding: EdgeInsets.all(2),
                    position: BadgePosition(top: -10, start: 12),
                    badgeContent: Container(
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.redAccent, shape: BoxShape.circle),
                      child: Text(
                        '2',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    child: Icon(LineAwesomeIcons.bell)),
                onPressed: () => Get.to(Notifications()),
              )
            ],
          ),
        ),
        body: Home(
          scrollController: _scrollController,
        ),
      ),
    );
  }

  void scrollUp(ScrollController scrollController) {
    scrollController.animateTo(
      0.0,
      curve: Curves.easeInOutCubic,
      duration: const Duration(milliseconds: 320),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
    Provider.of<HomeRepo>(context, listen: false).getunitlists(context);
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTap;
  final AppBar appBar;

  const CustomAppBar({Key key, this.onTap, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: appBar);
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
