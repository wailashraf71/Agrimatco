import 'package:agrimatco/Repo/UserRepo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String hintTextEmail = tr("hintEmail");
    String hintTextPassword = tr("hintPassword");
    var userrepo = Provider.of<UserRepo>(context, listen: true);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Login',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))
                .tr(),
            centerTitle: true,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Agrimatco',
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontFamily: Theme.of(context)
                                    .primaryTextTheme
                                    .headline1
                                    .fontFamily,
                                fontWeight: FontWeight.w700,
                                fontSize: 35),
                          ).tr(),
                          SizedBox(height: 10),
                          Container(
                            width: 300,
                            child: Text(
                              'Agrimatco Ltd is a unique international agricultural distribution company',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color
                                      .withOpacity(0.6),
                                  fontSize: 13),
                            ).tr(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 70),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        'Email Address',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 15),
                      ).tr(),
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).nextFocus();
                        },
                        decoration: InputDecoration(
                            hintText: tr(hintTextEmail),
                            border: InputBorder.none,
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        'Password',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 15),
                      ).tr(),
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).nextFocus();
                        },
                        decoration: InputDecoration(
                            hintText: tr(hintTextPassword),
                            border: InputBorder.none,
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold),
                        ).tr(),
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                        width: double.infinity,
                        child: userrepo.lodinglogin
                            ? LoadingBouncingGrid.square(
                                size: 50,
                                backgroundColor: Theme.of(context).accentColor,
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CupertinoButton(
                                    color: Theme.of(context).accentColor,
                                    padding: EdgeInsets.all(18),
                                    onPressed: () {
                                      userrepo.login(
                                          context: context,
                                          email: _emailController.text,
                                          password: _passwordController.text);
                                    },
                                    child: Text("Login",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800))
                                        .tr()),
                              )),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
