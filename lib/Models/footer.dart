import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/Models/header.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:portfolio/Media/colors.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        VxDevice(
          mobile: VStack(
            [
              "Got a project?\nLet's talk.".text.center.white.xl2.make(),
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
              "Got a project? Let's talk.".text.center.white.xl2.make(),
              10.widthBox,
              GestureDetector(
                onTap: () {
                  launchUrlString("https://mail.google.com/mail/u/0/?fs=1&to=fontsignacio@gmail.com&su=SUBJECT&body=BODY&bcc=fontsignacio@gmail.com&tf=cm");
                },
                child: "fontsignacio@gmail.com"
                  .text
                  .color(Coolors.accentColor)
                  .semiBold
                  .make()
                  .box
                  .border(color: Coolors.accentColor)
                  .p16
                  .rounded
                  .make(),
              )
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
        30.heightBox,
        [
          "Made in Argentina with".text.red500.make(),
          10.widthBox,
          const Icon(
            FontAwesomeIcons.heart,
            color: Vx.red500,
            size: 14,
          )
        ].hStack(crossAlignment: CrossAxisAlignment.center)
      ],
      crossAlignment: CrossAxisAlignment.center,
    ).wFull(context).p16();
  }
}