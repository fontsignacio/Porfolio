import 'package:flutter/material.dart';
import 'package:portfolio/Media/colors.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameWidget = "Ignacio\nEsteban\nFonts"
        .text
        .white
        .xl6
        .lineHeight(1)
        .size(context.isMobile ? 15 : 20)
        .bold
        .make()
        .shimmer();
    return SafeArea(
      child: VxBox(
        child: VStack([
          ZStack(
            [
              if (context.isMobile) const PictureWidget().pOnly(left: 135)   
              else const PictureWidget().pOnly(right: 480, top: 95),
              if (!context.isMobile) const Picture2(),
              Row(
                children: [
                  VStack([
                    if (context.isMobile) 50.heightBox else 10.heightBox,
                    const CustomAppBar().shimmer(primaryColor: Coolors.accentColor),
                    30.heightBox,
                    nameWidget,
                    20.heightBox,
                    VxBox()
                    .color(Coolors.accentColor)
                    .size(60, 10)
                    .make()
                    .px4()
                    .shimmer(primaryColor: Coolors.accentColor),
                    30.heightBox,
                    const SocialAccounts(),
                  ]).pSymmetric(
                    h: context.percentWidth * 10,
                    v: 32,
                  ),
                  Expanded(
                    child: VxResponsive(
                      medium: const IntroductionWidget()
                          .pOnly(left: 120)
                          .h(context.percentHeight * 60),
                      large: const IntroductionWidget()
                          .pOnly(right: 150, top: 50)
                          .h(context.percentHeight * 60),
                      fallback: const Offstage(),
                    ),
                  )
                ],
              ).w(context.screenWidth)
            ],
          )
        ]
        )
      )
      .size(context.screenWidth, context.percentHeight * 60)
      .color(Coolors.secondaryColor)
      .make(),
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        [
          "About me".text.gray500.widest.xl3.make(),
          10.heightBox,
          "Argentinian with more than three years of experience building multiplatform apps with Flutter and other technologies. Working in groups,using agile methodologies like SCRUM or XP, and learning more everyday."
              .text
              .white
              .xl3
              .maxLines(10)
              .make()
              .w(context.isMobile
                  ? context.screenWidth
                  : context.percentWidth * 40),
          30.heightBox,
        ].vStack(),
        ElevatedButton(
          onPressed: () {
            launchUrlString("https://drive.google.com/file/d/1CPXs7pcFXh4HLFd60Dk-kqL8QGqVgWaG/view");
          }, 
          
          child: "Resume".text.make(),
        ).h(50)
      ],
      crossAlignment: CrossAxisAlignment.center,
      alignment: MainAxisAlignment.spaceEvenly,
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      FontAwesomeIcons.codeBranch,
      size: 50,
      color: Coolors.accentColor,
    );
  }
}

class PictureWidget extends StatelessWidget {
  const PictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        "assets/images/me.png",
        fit: BoxFit.cover,
        height: context.percentHeight * 50,
      ),
    );
  }
}

class Picture2 extends StatelessWidget {
  const Picture2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Image.asset(
        "assets/images/pic.png",
        fit: BoxFit.cover,
        height: context.percentHeight * 60,
      ),
    );
  }
}

class SocialAccounts extends StatelessWidget {
  const SocialAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return [
      const Icon(
        FontAwesomeIcons.instagram,
        color: Colors.white,
      ).mdClick(() {
        launchUrlString("https://www.instagram.com/ignacio_fonts/?hl=es");
      }).make(),
      20.widthBox,
      const Icon(
        FontAwesomeIcons.linkedin,
        color: Colors.white,
      ).mdClick(() {
        launchUrlString("https://www.linkedin.com/in/ignacio-esteban-fonts-731588165/");
      }).make(),
      20.widthBox,
      const Icon(
        FontAwesomeIcons.github,
        color: Colors.white,
      ).mdClick(() {
        launchUrlString("https://github.com/fontsignacio");
      }).make()
    ].hStack();
  }
}