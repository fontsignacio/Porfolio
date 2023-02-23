import 'package:flutter/material.dart';
import 'package:portfolio/Models/header.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:portfolio/Media/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({super.key, required this.isSpanish });
  final bool isSpanish ;

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        VxDevice(
          mobile: VStack(
            [
              AnimatedTextKit(
                animatedTexts: [
                  if(isSpanish )
                  TypewriterAnimatedText(
                    "¿Tienes un proyecto?\nHablemos.",
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                    speed: const Duration(milliseconds: 100),
                    textAlign: TextAlign.center,
                  )
                  else TypewriterAnimatedText(
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
                  .shimmer(primaryColor: Coolors.accentColor)
                  .onTap(() {
                  launchUrlString("https://mail.google.com/mail/u/0/?fs=1&to=fontsignacio@gmail.com&su=SUBJECT&body=BODY&bcc=fontsignacio@gmail.com&tf=cm");
                }),    
            ],
            crossAlignment: CrossAxisAlignment.center,
          ),
          web: HStack(
            [
              AnimatedTextKit(
                animatedTexts: [
                  if(isSpanish )
                  TypewriterAnimatedText(
                    "¿Tienes un proyecto?\nHablemos.",
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    ),
                    speed: const Duration(milliseconds: 100),
                    textAlign: TextAlign.center,
                  )
                  else TypewriterAnimatedText(
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
                .make()
                .shimmer(primaryColor: Coolors.accentColor)
                .onTap(() {
                  launchUrlString("https://mail.google.com/mail/u/0/?fs=1&to=fontsignacio@gmail.com&su=SUBJECT&body=BODY&bcc=fontsignacio@gmail.com&tf=cm");
                }),    
            ],
            alignment: MainAxisAlignment.center,
          ).w(context.safePercentWidth * 70).scale150().p16(),
        ),
        100.heightBox,
        const CustomAppBar().shimmer(primaryColor: Coolors.accentColor),
        10.heightBox,
        if(isSpanish )
        "Gracias por ver, ".richText.semiBold.white.withTextSpanChildren(
            ["contácteme".textSpan.gray500.make()]).make()
        else "Thanks for scrolling, ".richText.semiBold.white.withTextSpanChildren(
            ["contact me".textSpan.gray500.make()]).make(),
        10.heightBox,
        const SocialAccounts(),
  
      ],
      crossAlignment: CrossAxisAlignment.center,
    ).wFull(context).p16();
  }
}