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
        .size(context.isMobile ? 11 : 20)
        .bold
        .make()
        .shimmer();
    return SafeArea(
      child: VxBox(
        child: VStack([
          ZStack(
            [
              VxResponsive(
                large: const PictureWidget().pOnly(right: 700, top: 45),
                fallback: const Offstage(),          
              ),
              VxResponsive(
                xsmall: const Picture2().pOnly(left: 145),
                small: const Picture2().pOnly(left: 145),
                medium: const Picture2().pOnly(left: 145),
                large: const Picture2().pOnly(left: 145),
                fallback: const Offstage(),          
              ),
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
                          .pOnly(left: 50)
                          .h(context.percentHeight * 60),
                      large: const IntroductionWidget()
                          .pOnly(left: 75)
                          .h(context.percentHeight * 60),
                      fallback: const Offstage(),
                    ),
                  ),
                  if (context.isMobile) const Language().pOnly(right: 19, bottom: 235)
                  else const Language().pOnly(right: 19, bottom: 360)
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
          "About me".text.gray500.widest.xl4.make(),
          10.heightBox,
          "Engineering Student and Software Developer, currently living in Argentina. My interests range from technology to design and System Information. Loves open-sourcing cool projects on Github and Lerning about Development Multi-plataform Apps. Currently Flutter and Dart enthusiast."
          .text
          .white
          .xl3
          .maxLines(10)
          .make()
          .w(context.isMobile
              ? context.screenWidth
              : context.percentWidth * 40),
          10.heightBox,
          "Technologies I have worked with:"
          .text.yellow400.xl
          .make().w(context.isMobile
              ? context.screenWidth
              : context.percentWidth * 40),
          const Tech()
          .w(context.isMobile
              ? context.screenWidth
              : context.percentWidth * 40),
          5.heightBox,
        ].vStack(),
        if (context.isMobile)
        ElevatedButton(
          onPressed: () {
            launchUrlString("https://drive.google.com/file/d/1CPXs7pcFXh4HLFd60Dk-kqL8QGqVgWaG/view");
          },       
          child: "View Resume".text.make()
        ).h(50).pOnly(left: 100)
        else         
        ElevatedButton(
          onPressed: () {
            launchUrlString("https://drive.google.com/file/d/1CPXs7pcFXh4HLFd60Dk-kqL8QGqVgWaG/view");
          },       
          child: "View Resume".text.make()
        ).h(50),
      ],
      //crossAlignment: CrossAxisAlignment.center,
      alignment: MainAxisAlignment.spaceEvenly,
    );
  }
}

class Tech extends StatelessWidget {
  const Tech({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.arrow_right,
          size: 30,
          color: Vx.yellow400
        ),
        "Fluter".text.white.bold.make(),
        const Icon(
          Icons.arrow_right,
          size: 30,
          color: Vx.yellow400
        ),
        "Dart".text.white.bold.make(),
        const Icon(
          Icons.arrow_right,
          size: 30,
          color: Vx.yellow400
        ),
        "Java".text.white.bold.make(),
        const Icon(
          Icons.arrow_right,
          size: 30,
          color: Vx.yellow400
        ),
        "Python".text.white.bold.make(),
        const Icon(
          Icons.arrow_right,
          size: 30,
          color: Vx.yellow400
        ),
        "C".text.white.bold.make(),

      ],
    );
  }
}

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return  "EN"
      .text
      .color(Coolors.accentColor)
      .semiBold
      .make()
      .box
      .border(color: Coolors.accentColor)
      .p16
      .rounded
      .make()
      .shimmer(primaryColor: Coolors.accentColor)
      .onTap(() {});
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      FontAwesomeIcons.codeBranch,
      color: Coolors.accentColor,
      size: 50,
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
        height: context.percentHeight * 55,
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