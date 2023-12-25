import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:to_do_app/pages/home_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      pageTransitionType: PageTransitionType.bottomToTop,
      splashTransition: SplashTransition.sizeTransition,
      backgroundColor: Colors.yellow[200]!,
      splash: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: CircleAvatar(
              radius: 25,
              child: Image.asset(
                'asstes/preview.png', // Corrected asset path
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            "TO DO",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .fadeOut(curve: Curves.easeInOut)
        ],
      ),
      nextScreen: HomePage(),
    );
  }
}
