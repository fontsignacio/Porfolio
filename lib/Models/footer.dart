import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/Models/header.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:portfolio/Media/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        VxDevice(
          mobile: VStack(
            [
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    "Got a project?\nLet's talk.",
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                    speed: const Duration(milliseconds: 100),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              10.heightBox,
              "fontsignacio@gmail.com"
                  .text
                  .color(Coolors.accentColor)
                  .semiBold
                  .make()
                  .box
                  .border(color: Coolors.accentColor)
                  .p16
                  .rounded
                  .make()
            ],
            crossAlignment: CrossAxisAlignment.center,
          ),
          web: HStack(
            [
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    "Got a project? Let's talk.",
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                    speed: const Duration(milliseconds: 100),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              10.widthBox,
              "fontsignacio@gmail.com"
                .text
                .color(Coolors.accentColor)
                .semiBold
                .make()
                .box
                .border(color: Coolors.accentColor)
                .p16
                .rounded
                .make().onTap(() {
                  launchUrlString("https://mail.google.com/mail/u/0/?fs=1&to=fontsignacio@gmail.com&su=SUBJECT&body=BODY&bcc=fontsignacio@gmail.com&tf=cm");
                }),    
            ],
            alignment: MainAxisAlignment.center,
          ).w(context.safePercentWidth * 70).scale150().p16(),
        ),
        50.heightBox,
        const CustomAppBar(),
        10.heightBox,
        "Thanks for scrolling, ".richText.semiBold.white.withTextSpanChildren(
            ["that's all folks.".textSpan.gray500.make()]).make(),
        10.heightBox,
        const SocialAccounts(),
  
      ],
      crossAlignment: CrossAxisAlignment.center,
    ).wFull(context).p16();
  }
}