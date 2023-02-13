import 'package:flutter/material.dart';
import 'package:portfolio/Media/colors.dart';
import 'package:portfolio/Models/footer.dart';
import 'package:portfolio/Models/middle.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:portfolio/Models/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Coolors.primaryColor,
      child: VStack([
        const HeaderScreen(),
        if (context.isMobile) const IntroductionWidget().p16(),
        const MiddleScreen(),
        const FooterScreen(),
      ]).scrollVertical(),
    );
  }
}