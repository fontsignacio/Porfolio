import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:portfolio/Media/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class MiddleScreen extends StatelessWidget {
  const MiddleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Coolors.thirdcolor,
      child: Flex(
          direction: context.isMobile || context.isMobileTypeTablet ? Axis.vertical : Axis.horizontal,
          children: [
            "All Creative works,\n"
                .richText
                .withTextSpanChildren(
                    ["Selected projects.".textSpan.yellow400.make()])
                .xl4
                .white
                .make(),
            20.widthBox,
            Expanded(
              child: VxSwiper(
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                items: [
                  const ProjectWidget(title: "WhatsApp Clone").onTap(() {
                    launchUrlString("https://github.com/fontsignacio/WhatsApp-Clone");
                  }),
                  const ProjectWidget(title: "Billboard Movies").onTap(() {
                    launchUrlString("https://github.com/fontsignacio/Billboard-Movies");
                  }),
                  const ProjectWidget(title: "QuizFlow").onTap(() {
                    launchUrlString("https://github.com/fontsignacio/QuizFlow");
                  }),
                ],
                height: 300,
                viewportFraction: context.isMobile ? 0.75 : 0.4,
                autoPlay: true,
                autoPlayAnimationDuration: 1.seconds,
              )
            )
          ]).p64().h(context.isMobile ? 600 : 400),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return title.text.bold.white.xl.wide.center
    .make()
    .box
    .p8
    .roundedLg
    .neumorphic(color: Vx.purple700, elevation: 5, curve: VxCurve.flat)
    .alignCenter
    .square(300)
    .make()
    .p8();
  }
}