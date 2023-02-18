import 'package:flutter/material.dart';
import 'package:portfolio/Media/colors.dart';
import 'package:portfolio/Models/footer.dart';
import 'package:portfolio/Models/middle.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:portfolio/Models/header.dart';


class HomeSreen extends StatefulWidget {
  const HomeSreen({super.key});

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  bool isSpanish = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Coolors.primaryColor,
      child: VStack([
        HeaderScreen(language: language(), isSpanish : isSpanish ),
        if (context.isMobile) IntroductionWidget(isSpanish : isSpanish ,).p16(),
        MiddleScreen(isSpanish : isSpanish ),
        FooterScreen(isSpanish :  isSpanish ),
      ]).scrollVertical(),
    );
  }
  Widget language(){
    return GestureDetector(
      onTap: (){
        setState(() {
          isSpanish = !isSpanish;
        });
      },
      child: isSpanish  ? 
      "ES"
      .text
      .color(Coolors.accentColor)
      .semiBold
      .make()
      .box
      .border(color: Coolors.accentColor)
      .p16
      .rounded
      .make()
      .shimmer(primaryColor: Coolors.accentColor) : 
      "EN"
      .text
      .color(Coolors.accentColor)
      .semiBold
      .make()
      .box
      .border(color: Coolors.accentColor)
      .p16
      .rounded
      .make()
      .shimmer(primaryColor: Coolors.accentColor),
    );      
  }
}