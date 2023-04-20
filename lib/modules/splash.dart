import 'dart:async';
import 'package:flutter/material.dart';
import 'package:recipes_app/components/components.dart';
import 'package:recipes_app/modules/onboard.dart';
import 'package:recipes_app/shared/style/style.dart';

class Spalsh extends StatefulWidget {
  const Spalsh({super.key});

  @override
  State<Spalsh> createState() => _SpalshState();
}

class _SpalshState extends State<Spalsh> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      navigatorPushReplacment(context: context, widget: OnBoard());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Style.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/splash.png",
              height: 320,
              width: 320,
            )
          ],
        ),
      ),
    );
  }
}
