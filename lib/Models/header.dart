import 'package:flutter/material.dart';
import 'package:portfolio/Media/colors.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameWidget = "Ignacio\nEsteban\nFonts"
        .text
        .white
        .xl6
        .lineHeight(1)
        .size(context.isMobile ? 11 : 17)
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
                small: const IntroductionWidget()
                    .pOnly(left: 380).scale75()
                    .h(context.percentHeight * 60),
                large: const Picture2().pOnly(left: 145),
                fallback: const Offstage(),          
              ),
              if (context.isMobile)const Picture2().pOnly(left: 145),
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
                    h: context.percentWidth * 5,
                    v: 32,
                  ),
                  Expanded(
                    child: VxResponsive(
                      medium: const Picture2().pOnly(left: 145),
                      large: const IntroductionWidget()
                          .pOnly(left: 75)
                          .h(context.percentHeight * 60),
                      fallback: const Offstage(),
                    ),
                  ),
                  if (context.isMobile) const Language().pOnly(right: 19, bottom: 200)
                  else const Language().pOnly(right: 19, bottom: 300)
                ],
              ).w(context.screenWidth)
            ],
          )
        ]
        )
      )
      .size(context.screenWidth, context.percentHeight * 60)
      .color(Coolors.primaryColor)
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
          "Flutter | Dart | Java | Python | C"
          .text.gray300.xl
          .make().w(context.isMobile  
              ? context.screenWidth
              : context.percentWidth * 40),
          if (context.isMobile) 30.heightBox
          else 5.heightBox,
        ].vStack(),
        AnimatedButton(
          animatedOn: AnimatedOn.onHover,
          height: 40,
          width: context.percentHeight * 20,
          text: 'View Resume',
          isReverse: true,
          selectedTextColor: Colors.black,
          backgroundColor: Vx.yellow400,
          transitionType: TransitionType.CENTER_LR_OUT,
          textStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
          onPress: () { 
          launchUrlString("https://drive.google.com/file/d/1CPXs7pcFXh4HLFd60Dk-kqL8QGqVgWaG/view");
          },
        )
      ],
      crossAlignment: CrossAxisAlignment.center,
      alignment: MainAxisAlignment.spaceEvenly,
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