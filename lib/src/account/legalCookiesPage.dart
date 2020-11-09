import 'package:flutter/material.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:google_fonts/google_fonts.dart';

class LegalCookie extends StatefulWidget {
  final conTitle;
  LegalCookie({Key key, this.conTitle}) : super(key: key);

  @override
  _legalCookieState createState() => _legalCookieState();
}

class _legalCookieState extends State<LegalCookie> {
  get conTitle => widget.conTitle;
  Widget _backButton() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      height: 90,
      child: Row(
        children: <Widget>[
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(left: 12, top: 11, bottom: 10),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              )),
          Container(
            padding: EdgeInsets.only(left: 6, top: 11, bottom: 10),
            child: Text(conTitle,
                style: GoogleFonts.rubik(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
        ],
      ),
    );
  }

  Widget _detailBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text('AVISO DE COOKIES',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text:
                  'Utilizamos cookies propias y de terceros para obtener datos estadísticos de la navegación de nuestros “Usuarios” y mejorar nuestros servicios. Si acepta o continúa navegando, consideramos que acepta su uso. Puede cambiar la configuración u obtener más información aquí (enlace a página de cookies).',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text('¿QUÉ SON LAS COOKIES?',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text:
                  'Una cookie es un fichero que se descarga en su ordenador al acceder a determinadas páginas web. Las cookies permiten a una página web, entre otras cosas, almacenar y recuperar información sobre los hábitos de navegación de un usuario o de su equipo y, dependiendo de la información que contengan y de la forma en que utilice su equipo, pueden utilizarse para reconocer al usuario.',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text('¿QUÉ TIPOS DE COOKIES UTILIZA ESTA PÁGINA WEB?',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'Esta página web utiliza los siguientes tipos de cookies:',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
            ),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'Cookies de análisis',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text:
                        ': Son aquéllas que bien tratadas por nosotros o por terceros, nos permiten cuantificar el número de usuarios y así realizar la medición y análisis estadístico de la utilización que hacen los usuarios del servicio ofertado. Para ello se analiza su navegación en nuestra página web con el fin de mejorar la oferta de productos o servicios que le ofrecemos.',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'Cookies técnicas',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text:
                        ': Son aquellas que permiten al usuario la navegación a través del área restringida y la utilización de sus diferentes funciones, como, por ejemplo, llevar a cambio el proceso de compra de un artículo.',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'Cookies de personalización',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text:
                        ': Son aquellas que permiten al usuario acceder al servicio con algunas características de carácter general predefinidas en función de una serie de criterios en el terminal del usuario como por ejemplo serian el idioma o el tipo de navegador a través del cual se conecta al servicio.',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'Cookies publicitarias',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text:
                        ': Son aquéllas que, bien tratadas por esta web o por terceros, permiten gestionar de la forma más eficaz posible la oferta de los espacios publicitarios que hay en la página web, adecuando el contenido del anuncio al contenido del servicio solicitado o al uso que realice de nuestra página web. Para ello podemos analizar sus hábitos de navegación en Internet y podemos mostrarle publicidad relacionada con su perfil de navegación.',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'Cookies de publicidad comportamental',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text:
                        ': Son aquellas que permiten la gestión, de la forma más eficaz posible, de los espacios publicitarios que, en su caso, el editor haya incluido en una página web, aplicación o plataforma desde la que presta el servicio solicitado. Este tipo de cookies almacenan información del comportamiento de los visitantes obtenida a través de la observación continuada de sus hábitos de navegación, lo que permite desarrollar un perfil específico para mostrar avisos publicitarios en función del mismo.',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text('DESACTIVAR LAS COOKIES.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'Puede usted ',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text: 'permitir, bloquear o eliminar las cookies',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text:
                          ' instaladas en su equipo mediante la configuración de las opciones del navegador instalado en su ordenador.',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text:
                  'En la mayoría de los navegadores web se ofrece la posibilidad de permitir, bloquear o eliminar las cookies instaladas en su equipo.',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text('COOKIES DE TERCEROS.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text:
                  'Este “Sitio Web” utiliza servicios de terceros para recopilar información con fines estadísticos y de uso de la web.',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text('ADVERTENCIA SOBRE ELIMINAR COOKIES.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text:
                  'Usted puede eliminar y bloquear todas las cookies de este “Sitio Web”, pero parte del sitio no funcionará o la calidad de la página web puede verse afectada.',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
            ),
          ),
          SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text:
                  'Si tiene cualquier duda acerca de nuestra política de cookies, puede contactarnos a: ',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: 'soporte@fitemos.com',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff149dcc))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      decoration: BoxDecoration(color: Color(0xffFFFFFF)),
      child: Stack(
        children: <Widget>[
          Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100),
                  _detailBody(),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
          Positioned(top: 0, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
