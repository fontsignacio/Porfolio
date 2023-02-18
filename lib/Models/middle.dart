import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:portfolio/Media/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class MiddleScreen extends StatelessWidget {
  const MiddleScreen({super.key, required this.isSpanish });
  final bool isSpanish ;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Coolors.secondaryColor,
      child: Flex(
          direction: Axis.vertical,
          children: [
            if(isSpanish ) if (!context.isMobile) "Todos los trabajos creativos, "
                .richText
                .withTextSpanChildren(
                    ["Selecciona un proyecto.".textSpan.yellow400.make()])
                .xl5
                .white.center
                .make()
            else "Todos los trabajos creativos,\n"
                .richText
                .withTextSpanChildren(
                    ["Selecciona un proyecto.".textSpan.yellow400.make()])
                .xl5
                .white.center
                .make()
            else if (!context.isMobile) "All Creative works, "
                .richText
                .withTextSpanChildren(
                    ["Select a project.".textSpan.yellow400.make()])
                .xl5
                .white.center
                .make()
            else "All Creative works,\n"
                .richText
                .withTextSpanChildren(
                    ["Select a project.".textSpan.yellow400.make()])
                .xl5
                .white.center
                .make(),
            40.widthBox,
            if (!isSpanish )
            Expanded(
              child: VxSwiper(
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                items:  [
                  ProjectWidget(title: "WhatsApp Clone",
                   isSpanish : isSpanish ,
                   pic: "assets/images/wp.png",
                   desc: "An app built on Flutter, imitates the basic functions of the WhatsApp like swipe up in your chat list, open the chat, send a message, view status list, use contact button, view call list and open camera.",
                   url: "https://github.com/fontsignacio/WhatsApp-Clone"
                  ),
                  ProjectWidget(title: "Billboard Movies",
                  isSpanish : isSpanish ,
                   pic: "assets/images/movie.png",
                   desc: "A movie app that shows the details of a movie list. You can search your movie, save to favorites, search by categories and watch the trailer.",
                   url: "https://github.com/fontsignacio/Billboard-Movies"
                  ),
                  ProjectWidget(title: "QuizFlow",
                   isSpanish : isSpanish ,
                   pic: "assets/images/quiz.png",
                   desc: "A Quiz App that allows you to log in or register, select your favorite category, select your difficulty, collect points, view profile and log out.",
                   url: "https://github.com/fontsignacio/QuizFlow"
                  )
                ],
                height: 500,
                viewportFraction: context.isMobile ? 1 : 0.39,
                autoPlay: true,
                autoPlayCurve: Curves.easeInOutBack,  
                autoPlayAnimationDuration: 1.seconds,
              )
            )
            else Expanded(
              child: VxSwiper(
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                items:  [
                  ProjectWidget(title: "WhatsApp Clone",
                   isSpanish : isSpanish ,
                   pic: "assets/images/wp.png",
                   desc: "Una aplicación construida en Flutter, imita las funciones básicas de WhatsApp como deslizar hacia arriba en su lista de chat, abrir el chat, enviar un mensaje, ver la lista de estados, utilizar el botón de contacto, ver la lista de llamadas y abrir la cámara.",
                   url: "https://github.com/fontsignacio/WhatsApp-Clone"
                  ),
                  ProjectWidget(title: "Billboard Movies",
                  isSpanish : isSpanish ,
                   pic: "assets/images/movie.png",
                   desc: "Una aplicación de películas que muestra los detalles de una lista. Puede buscar su favorita, guardar, buscar por categorías y ver el trailer.",
                   url: "https://github.com/fontsignacio/Billboard-Movies"
                  ),
                  ProjectWidget(title: "QuizFlow",
                   isSpanish : isSpanish ,
                   pic: "assets/images/quiz.png",
                   desc: "Una aplicación de examen que le permite iniciar sesión o registrarse, seleccionar su categoría favorita, seleccionar su dificultad, acumular puntos, ver el perfil y cerrar sesión.",
                   url: "https://github.com/fontsignacio/QuizFlow"
                  )
                ],
                height: 500,
                viewportFraction: context.isMobile ? 1 : 0.39,
                autoPlay: true,
                autoPlayCurve: Curves.easeInOutBack,  
                autoPlayAnimationDuration: 1.seconds,
              )
            )
          ]).p32().h(context.isMobile ? 800 : 600),
    );
  }
}

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({
    super.key, 
    required this.title, 
    required this.pic,
    required this.desc,
    required this.url,
    required this.isSpanish 
  });
  final String title;
  final String pic;
  final String url;
  final String desc;
  final bool isSpanish ;


  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: context.percentHeight * 40,
      height: context.percentHeight * 60,
      color: Coolors.secondaryColor,
      child: InkWell(
        onTap: () {
          setState(() {
            isPressed = !isPressed;
          });
        },
        child: ZStack([
          isPressed ?
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Card(
              color: Coolors.description,
              child: Container(
                alignment: Alignment.topCenter,
                height: context.percentHeight * 30, 
                child: context.isMobile ? widget.desc.text.white.xl2.make().centered().p12() : 
                      widget.desc.text.white.xl.make().centered().p12().scale90()
              ),
            )
          ).pOnly(top: 50) : 
          Image.asset(widget.pic).scale75().centered().pOnly(bottom: 50).innerShadow(color: Coolors.accentColor, blur: 20),            
          AnimatedButton(
            animatedOn: AnimatedOn.onHover,
            height: context.percentHeight * 8,
            width: context.percentHeight * 40,
            text: widget.title,
            selectedText: widget.isSpanish  ? "Visitar Repositorio" : "Visit Repository",
            isReverse: true,
            borderWidth: 4,
            borderRadius: 15,
            borderColor: Coolors.accentColor,
            selectedBackgroundColor: Vx.neutral700,
            selectedTextColor: Colors.white,
            backgroundColor: Coolors.primaryColor,
            transitionType: TransitionType.CENTER_ROUNDER,
            animationDuration: const Duration(seconds: 1),
            textStyle: TextStyle(
              fontSize: context.isMobile? 20 : 23,
              color: Colors.white,
            ),
            onPress: () { 
              launchUrlString(widget.url);
            },
          ).objectBottomCenter()
        ]),
      ),
    );
  }
}
