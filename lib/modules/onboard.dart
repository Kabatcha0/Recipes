import 'package:flutter/material.dart';
import 'package:recipes_app/components/components.dart';
import 'package:recipes_app/layout/layout.dart';
import 'package:recipes_app/shared/style/style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoard extends StatelessWidget {
  PageController pageController = PageController();
  bool? state;

  OnBoard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.background,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: Text("")),
            SizedBox(
              height: 320,
              width: 320,
              child: Image.asset(
                "assets/splash.png",
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      "Cooking\nExperience\nLike a Chef",
                      style: TextStyle(
                          fontSize: Style.fontSizeSplash,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: PageView(
                    controller: pageController,
                    onPageChanged: (v) {
                      if (v == 1) {
                        state = true;
                      }
                    },
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        child: const Text(
                          "Let's make a delicious food , with the best recipe for the family",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        child: const Text(
                          "La Chateau,Get a beautiful and delicious recipes around the world",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                          controller: pageController,
                          count: 2,
                          effect: const ExpandingDotsEffect(
                              dotColor: Colors.grey,
                              activeDotColor: Colors.white,
                              dotHeight: 12,
                              dotWidth: 12,
                              spacing: 10,
                              expansionFactor: 4)),
                      materialButton(
                          text: "Next",
                          font: 16,
                          function: () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.easeInOutBack);
                            if (state == true) {
                              navigatorPushReplacment(
                                  context: context, widget: const Layout());
                            }
                          },
                          colorOfContainer: Colors.white,
                          colorOfText: Style.background,
                          raduis: 15)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
