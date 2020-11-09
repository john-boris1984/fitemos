import 'package:flutter/material.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:google_fonts/google_fonts.dart';

class LegalPrivacy extends StatefulWidget {
  final conTitle;
  LegalPrivacy({Key key, this.conTitle}) : super(key: key);

  @override
  _legalPrivacyState createState() => _legalPrivacyState();
}

class _legalPrivacyState extends State<LegalPrivacy> {
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
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'FITEMOS CORP.',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text:
                        ', cumpliendo con la normativa vigente en materia de protección de datos de carácter personal, informa que los datos personales que se recogen a través de los formularios del Sitio web: ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: 'www.fitemos.com',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff149dcc))),
                TextSpan(
                    text: ', en adelante, ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '“Sitio Web” ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text:
                        'se incluyen en los ficheros automatizados específicos de usuarios de los servicios de',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: ' FITEMOS.',
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
              text: 'FITEMOS CORP. y ',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: 'www.fitemos.com ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff149dcc))),
                TextSpan(
                    text:
                        'adoptan las medidas necesarias para garantizar la seguridad, integridad y confidencialidad de los datos, de manera exhaustiva, pero no limitativa, conforme a lo dispuesto en el Reglamento General de Protección de Datos (UE) 2016/679 en adelante, el ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '"RGPD"',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text:
                        ', relativo a la protección de las personas físicas en lo que respecta al tratamiento de datos personales y a la libre circulación de los mismos.',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text:
                  'Estas medidas son aplicables a cualquier acceso y uso de los sitios web, aplicaciones móviles, canales de redes sociales, en adelante, los ',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: '“Servicios”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text:
                        ' y, explican de forma detallada la manera en que recopilamos sus datos de carácter personal o corporativo, la necesidad de por qué los recopilamos, su objetivo y cómo los conservamos, siempre de acuerdo con los servicios ofrecidos por ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: 'FITEMOS CORP.',
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
              text:
                  'La recogida y tratamiento automatizado de los datos de carácter personal tiene como finalidad el mantenimiento de la relación comercial y el desempeño de tareas de información, formación, asesoramiento y otras actividades propias de FITEMOS (',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: 'www.fitemos.com',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff149dcc))),
                TextSpan(
                    text: ').',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'Las medidas en mención, en adelante, ',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: '“Política de Privacidad”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text:
                        ' se aplica a los datos personales/corporativos que nos facilita(n) los ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '"Usuarios"',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text: ' o el ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '"Usuario"',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text: ', tanto en nuestro sitio web ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: 'www.fitemos.com ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff149dcc))),
                TextSpan(
                    text:
                        ', como en nuestra aplicación para dispositivos móviles, en adelante, ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '"App"',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text: ' o ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '"Plataforma"',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text:
                        ', con el objetivo de poder facilitarle un mejor servicio.',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'Al acceder a nuestro ',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: '“Sitio Web”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text: ' y utilizar nuestros ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '“Servicios”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text: ', reconoce que ha leído y comprendido la presente ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '“Política de Privacidad”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text:
                        ', así como las prácticas de recopilación y tratamiento de la información que se describe en ella.',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'FITEMOS CORP.',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: ' (',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: 'www.fitemos.com',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff149dcc))),
                TextSpan(
                    text: ') se reserva el derecho de modificar las ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '“Política de Privacidad”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text:
                        ' en cualquier momento, y cualquier uso o acceso continuado de los ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '“Servicios”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text:
                        ' implica la aceptación de la versión más reciente de estas ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '“Políticas de Privacidad”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '.',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'El ',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: '“Usuario”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text:
                        ' podrá en cualquier momento ejercitar los derechos de acceso, oposición, rectificación y cancelación reconocidos en el',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: ' “RGPD”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text:
                        '. El ejercicio de estos derechos puede realizarlo el propio usuario a través de correo electrónico a: ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: 'soporte@fitemos.com',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff149dcc))),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'El ',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: '“Usuario”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text:
                        'manifiesta que todos los datos facilitados por el son precisos, ciertos y correctos, y se compromete a mantenerlos actualizados, asume el compromiso de actualizar dichos datos cuando resulte necesario.',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text('Información Recopilada',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text('1. Datos Personales',
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
                text:
                    'Mientras utiliza nuestro “Servicio” o “Sitio Web” podemos solicitarle nos provea de datos personales, que indicamos de manera enunciativa, pero no limitativa, tales como:',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('- Nombres y Apellidos',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('- Fecha de nacimiento',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('- Peso',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('- Estatura',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('- Genero',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('- Nivel de Actividad Física Semanal',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- Lugar de entrenamiento (gimnasio, en casa o al aire libre)',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('- Objetivo del usuario',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text('i. Quemar grasa',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text('ii. Ponerse en condiciones',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text('iii. Desarrollar musculatura',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('- Número de teléfono',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('- Dirección de correo electrónico',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('- Dirección postal',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('- Dirección IP',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- Datos de identificación del dispositivo de acceso a  www.fitemos.com.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- Historial de navegación dentro de la Plataforma  www.fitemos.com.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- Fechas, horas y la frecuencia con la que accede a nuestro “Sitio Web”',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
                '2. ¿Con qué finalidad trataremos tus datos personales?',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'Todos los datos son recopilados por ',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: 'FITEMOS CORP',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '. (',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: 'www.fitemos.com',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff149dcc))),
                TextSpan(
                    text:
                        ') única y exclusivamente a efectos de que pueda proveer los servicios y productos de interés del ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '“Usurario”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text:
                        ' que cumplan con los criterios necesarios y recomendaciones que más se ajusten a sus necesidades y preferencias, así como para poder disfrutar de todas las ventajas que le ofrece ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: 'FITEMOS CORP.',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '(www.XXXXXXXXXX.com).',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'En ',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: 'FITEMOS CORP',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '. (',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: 'www.fitemos.com',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff149dcc))),
                TextSpan(
                    text:
                        ') trataremos tus datos personales recabados a través del “Sitio Web” con las siguientes finalidades:',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '1. En caso de contratación de los bienes y servicios ofertados a través del “Sitio Web”, para mantener la relación contractual, así́ como la gestión, administración, información, prestación y mejora del servicio.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '2. Envío de información solicitada a través de los formularios dispuestos en el “Sitio Web”.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '3. Remitir boletines (newsletters), así́ como comunicaciones comerciales de promociones y/o publicidad del “Sitio Web”.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
                'Le recordamos que puede oponerse al envío de comunicaciones comerciales por cualquier vía y en cualquier momento, remitiendo un correo electrónico a la dirección indicada anteriormente.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
                'Los campos de dichos registros son de cumplimiento obligatorio, siendo imposible realizar las finalidades expresadas si no se aportan esos datos.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'Si ',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: 'FITEMOS CORP',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '. (',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: 'www.fitemos.com',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff149dcc))),
                TextSpan(
                    text: ') ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: 'detecta',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text:
                        ' que la información proporcionada por el “Usuario” es falsa o se encuentra incompleta, podrá cancelar, suspender o restringir el uso de los “Servicios” sin ninguna responsabilidad.',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: ' FITEMOS CORP',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '. (',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: 'www.fitemos.com',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff149dcc))),
                TextSpan(
                    text:
                        ') se resera el derecho de solicitar comprobantes y/o información adicional a efectos de corroborar la veracidad de la información entregada por un ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '“Usuario”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text:
                        ', así como suspender temporal o definitivamente aquellos ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '“Usuarios”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text: ' cuyos datos no hayan podido ser confirmados.',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'FITEMOS CORP',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: '. (',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: 'www.fitemos.com',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff149dcc))),
                TextSpan(
                    text:
                        ') se reserva el derecho de rechazar una solicitud de registro o de cancelar o suspender, temporal o definitivamente los “Servicios” para cualquier “Usuario”, en caso de detectar incongruencias o inconsistencias en la información provista por un “Usuario” o en caso de detectar actividades sospechosas, sin que tal decisión genere para el “Usuario” derechos de indemnización o resarcimiento.',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text('3. Información sobre los medios de pago utilizados',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'En aquellos casos en los que los ',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: '“Usuarios”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text:
                        ' procedan a realizar cualquier tipo de pago a través del “Sitio Web”, procederemos también a almacenar su número de cuenta, así como todos los datos relacionados con el pago de los ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '“Servicios”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text: ' contratados.',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'En el caso de no querer que desde ',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: 'www.fitemos.com',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff149dcc))),
                TextSpan(
                    text:
                        ' mantengamos los datos referentes al método de pago utilizado, podrá solicitar que la información sea eliminada a través de ',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: 'soporte@fitemos.com',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff149dcc))),
                TextSpan(
                    text:
                        ' , solicitando el ejercicio del derecho de cancelación, en relación exclusivamente a esta información.',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text('4. Datos de Cookies',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
                'Este “Sitio Web” utiliza cookies, tanto propias como de terceros, para recopilar información estadística sobre su navegación, mostrarle publicidad relacionada con sus preferencias y rastrear información de nuestro “Servicio”.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
                'Puede indicar a su navegador que rechace todas las cookies o que indique cuándo se envía una cookie. Sin embargo, si no acepta las cookies, es posible que no pueda usar algunas partes de nuestro “Sitio Web” o “Servicio”.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text('Uso de Información',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'FITEMOS CORP',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: '. (',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: 'www.fitemos.com',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff149dcc))),
                TextSpan(
                    text:
                        ') utiliza los datos recopilados por varios propósitos:',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('- Para proveer y mantener nuestro “Servicio”;',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- Para registrar y gestionar su cuenta, así como para permitirle acceder a nuestro “Sitio Web”;',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('- Para comunicarnos con usted;',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- Para proporcionarle información acerca FITEMOS CORP. (www.fitemos.com) sus servicios y propuestas;',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- Para publicar sus valoraciones, comentarios acerca de los Usuarios de la comunidad FITEMOS para que otros usuarios se puedan beneficiar de sus experiencias',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- Para responder todas sus preguntas, comentarios y sugerencias;',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('- Para medir su interés en nuestros servicios;',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- Para notificar las ofertas especiales e informar de los servicios disponibles que creamos que pueden ser de su interés;',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- Para personalizar y mejorar su experiencia con  www.fitemos.com',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- Para solicitar su opinión, así como información adicional que pueda resultarnos de interés y la realización de encuestas para valorar el servicio y mejorarlo;',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('- Para resolver conflictos o dificultades;',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('- Para evitar actividades prohibidas o ilegales;',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- Para realizar informes estadísticos anónimos respecto de los hábitos de acceso y la actividad desarrollada por los Usuarios;',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- Para dar cumplimiento a las obligaciones legales establecidas;',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- Para almacenar las conversaciones telefónicas cuando sea preciso con fines estadísticos y de calidad en el servicio y;',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- Para lo descrito en cualquier otro momento, en el momento de la recopilación de datos de carácter personal.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text('Comunicaciones por correo electrónico',
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
                  'Todos los comunicados que pueda recibir a través de comunicaciones electrónicas se basan en lo que creemos podría ser de su interés. En ocasiones, se podrán utilizar los datos personales cedidos por los ',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: '“Usuarios”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text:
                        ' para mostrar material publicitario del “Sitio Web” u otros contenidos de otros sitios web que puedan resultar de su interés. Si no desea que utilicemos sus datos con este fin, entre otros, puede desactivar las cookies.',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text:
                  'La recepción de cualquier tipo de comunicación por correo electrónico con fines de mercadeo estará basada en su consentimiento previo. De no desear continuar recibiendo comunicaciones, podrá darse de baja del servicio de comunicaciones enviando un correo a ',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: 'soporte@fitemos.com',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff149dcc))),
                TextSpan(
                    text: '.',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text('¿Con quién compartimos su información?',
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
                  'Cuando corresponda y de conformidad con la legislación y los requisitos locales, es posible que ',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: 'FITEMOS CORP',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text: '. (',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
                TextSpan(
                    text: 'www.fitemos.com',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff149dcc))),
                TextSpan(
                    text:
                        ') comparta su información con las siguientes entidades:',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- Terceros vendedores o aliados estratégicos que provean servicios o productos en nuestro nombre, incluidos el análisis comercial, el procesamiento de pagos, el servicio de atención al cliente, el marketing, las relaciones públicas, la distribución de encuestas o de programas de sorteos, y la prevención de fraudes. También es posible que autoricemos a terceros vendedores para recopilar información en nuestro nombre, incluida, por ejemplo, la necesaria para utilizar las características de nuestro sitio web o para facilitarle la entrega de publicidad en línea adaptada a sus intereses. Los terceros vendedores pueden recopilar y tener acceso únicamente a la información necesaria para realizar sus funciones, pero no tienen autorización alguna para compartir o utilizar la información con ningún otro propósito. En cualquier caso, si un tercero fuese a contactarle directamente, le notificaríamos para que nos autorice.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
                'También es posible que compartamos su información si consideramos, a nuestra total discreción, que dicha cesión es necesaria a efectos de:',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- Cumplir con las citaciones u órdenes judiciales legítimas y aplicables, o con otros procesos legales; para establecer o ejercer nuestros derechos legales; para defendernos de reclamaciones legales; o en otros casos en los que la ley lo exija. En tales casos, nos reservamos el derecho de presentar o retirar cualquier objeción o derecho legal del que dispongamos;',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- Para investigar, prevenir o tomar medidas con respecto a las actividades ilegales o presuntamente ilegales; para proteger y defender los derechos, la propiedad o la seguridad de FITEMOS CORP. (www.fitemos.com), de nuestros clientes o de terceros; y en relación con nuestras Condiciones de uso y otros acuerdos; o',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
                '- En conexión con una transacción corporativa, como una desinversión, fusión, consolidación o venta de activos.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
                'Si vendemos o transferimos parte o la totalidad de la compañía o nuestros activos a otra empresa (por ejemplo, en el transcurso de una transacción como una fusión, adquisición, bancarrota, disolución o liquidación), la información, como el nombre y la dirección de correo electrónico, el contenido de usuario y cualquier otra información recopilada a través de la plataforma, puede formar parte de la venta o transferencia. En ese caso, el contenido de “Usuario” seguirá siendo suyo. El comprador o destinatario de la transferencia tendrá que respetar los compromisos acordados en esta “Política de Privacidad” o recabar su consentimiento para cualquier cambio que desee realizar.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
                'En cualquier caso, si no está de acuerdo con que su información se comparta con un tercero, podrá ejercer su derecho de limitación del tratamiento, de conformidad con lo expuesto en el apartado relacionado con sus derechos.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text('¿Durante cuánto tiempo guardamos su Información?',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
                'Los datos personales se conservarán mientras se mantenga la relación comercial o no solicite la supresión y durante el plazo por el cuál pudieran derivarse responsabilidades legales por los servicios prestados. En ningún caso mantendremos los datos de manera indeterminada o por un plazo que prevalezca sobre los intereses o los derechos y libertades fundamentales del “Usuario”.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
                '¿Cuáles son sus derechos y opciones con respecto a la recopilación y el uso de su información?',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
                'El “RGPD” confiere diversos derechos asociados a sus datos, incluso después de haber dado su consentimiento explícito para el tratamiento de dichos datos.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
                'De conformidad con la normativa en materia de protección de datos vigente, usted tiene derecho a:',
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: '- Derecho de acceso',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text: ': Todos los ',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: '“Usuarios”',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: 'tienen derecho a solicitar a ',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: 'FITEMOS CORP',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: '. (',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: 'www.fitemos.com',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff149dcc))),
                  TextSpan(
                      text:
                          ') en cualquier momento que comuniquemos qué información disponemos de ellos y así proceder a modificarlo, actualizarla o suprimirla.',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: '- Derecho de rectificación',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text: ': Los ',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: '“Usuarios”',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text:
                          ' tienen derecho a solicitar la rectificación de los datos personales si los mismos son inexactos o se encuentran incompletos. En el caso de que se hayan compartido sus datos con terceros, se procederá, en base a la petición del “Usuario” a comunicar la rectificación de los datos que se han cedido a dicho tercero, salvo en aquellos supuestos en que suponga un esfuerzo desproporcionado.',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: '- Derecho de cancelación o supresión',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text: ': Los ',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: '“Usuarios”',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text:
                          ' tienen derecho a solicitar que se supriman sus datos personales.',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: '- Derecho de oposición',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text:
                          ': Este derecho le permite oponerse al tratamiento de sus datos personales cuando lo hagamos por uno de los cuatro motivos que se enumeran a continuación: i) nuestros intereses legítimos; ii) autorizarnos a realizar una tarea que redunde en interés público o ejercer una autoridad oficial; iii) enviarle material de marketing directo; y iv) con fines científicos, históricos, de investigación o estadísticos.',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: '- Derecho a limitar el consentimiento',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text: ': En determinadas circunstancias, el ',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: '“Usuario”',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text:
                          ' tiene derecho a solicitar que limitemos el tratamiento de sus datos personales, lo que quiere decir que solamente podremos seguir almacenándolos y que no podremos realizar ninguna otra actividad de tratamiento hasta que otorgue su consentimiento.',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: '- Derecho de portabilidad',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text: ': El ',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: '“Usuario”',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text:
                          ' tendrá derecho a solicitar la portabilidad de sus datos a otro responsable del tratamiento, en cuyo caso se le facilitará un dosier digital de todos los datos disponibles a efecto que los pueda transferir al nuevo responsable.',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'Si desea ejercitar cualquiera de los derechos mencionados anteriormente, puede contactarnos a ',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text: 'soporte@fitemos.com',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff149dcc))),
                  TextSpan(
                      text:
                          ' incluyendo siempre una copia de su documento de identidad personal, así como el derecho que desea ejercer.',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'El ',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text: '“Usuario”',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text:
                          ' ha de tener en cuenta que el ejercicio de cualquier de estos derechos puede influir en el correcto desarrollo de los servicios ofrecidos por el “Sitio Web”, viéndose perjudicada su experiencia con nosotros.',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text('¿Cómo protegemos su información?',
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
                text:
                    'Toda la información que nos provee es de carácter confidencial, por tanto, hemos tomado todas las medidas, tanto técnicas como organizativas necesarias para evitar que sus datos sean utilizados con fines distintos a los descritos en la presente ',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text: '“Política de Privacidad”',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text:
                          ', o que se puedan alterar, modificar, eliminar, perder o que un tercero no autorizado pueda',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'tener acceso a los mismos, pero recuerde que ningún método a través de Internet es 100% seguro. Mientras, continuamos implementado medidas físicas, administrativas, técnicas y organizativas apropiadas para proteger la información personal que nos proporciona frente al acceso no autorizado o ilegal, el uso de la divulgación, y contra pérdidas, daños, alteraciones o destrucciones accidentales.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text('Privacidad Infantil',
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
                text:
                    'Nuestro “Servicio” no está dirigido a menores de 18 años. ',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text: 'FITEMOS CORP',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: '. (',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: 'www.fitemos.com',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff149dcc))),
                  TextSpan(
                      text:
                          ') no recopila intencionalmente datos personales o información de menores de 18 años. Si usted es padre o tutor de un menor de 18 años y tiene conocimiento que el mismo ha proporcionado datos personales, por favor contáctenos a ',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: 'soporte@fitemos.com',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff149dcc))),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'Si tenemos conocimiento que hemos recopilado datos personales sin verificación o el consentimiento de sus padres o tutor, tomamos medidas para eliminar o destruir dicha información, tan pronto como sea razonablemente posible, de nuestros servidores.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text('Enlaces Externos.',
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
                text: 'Es posible que nuestro ',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text: '“Sitio Web”',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text:
                          ', incluya enlaces a sitios web de terceros. Si accede a otros sitios web desde los enlaces que se proporcionan en nuestro “Sitio Web”, es posible que los operadores de dichos sitios web recopilen información sobre usted y que la utilicen de acuerdo con su política de privacidad, que puede diferir de nuestra ',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: '“Política de Privacidad”',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: '.',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'Le recomendamos que examine las declaraciones de privacidad publicadas en esos otros sitios web para conocer sus procedimientos a la hora de recopilar, utilizar y divulgar la información personal.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text('Transferencia de Datos',
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
                text:
                    'Es posible que su información o datos personales puedan transferirse a computadoras fuera de su País, Estado, Provincia u otra jurisdicción gubernamental donde las leyes de protección de datos de algunos de estos territorios difieran o no dispongan de las leyes de protección de datos tan estrictas como las de EE. UU. y Europa.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'Si visita nuestro sitio web tenga en cuenta que es posible que su información se transfiera, almacene y procese en donde se ubiquen nuestros servidores y se gestiona nuestra base de datos central.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'Mediante su consentimiento a esta ',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text: '“Política de Privacidad”',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text:
                          ' y el uso de nuestros “Servicios”, usted acepta que su información pueda ser transferida a nuestras bases de datos central y a las de aquellos terceros con los que la compartimos.',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text('Legitimidad',
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
                text: 'FITEMOS CORP',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text: '. (',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: 'www.fitemos.com',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff149dcc))),
                  TextSpan(
                      text:
                          '), puede procesar sus datos personales por las siguientes razones:',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: '1. La contratación de los servicios de ',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text: 'FITEMOS CORP',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: '. (',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: 'www.fitemos.com',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff149dcc))),
                  TextSpan(
                      text:
                          '), cuyos términos y condiciones se encuentra a su disposición en el “Sitio Web”.',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    '2. El “Usuario” concedió el consentimiento para el tratamiento de sus datos personales para uno o varios fines específicos. Nos ha concedido su permiso para proveerle nuestros “Servicios”.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    '3. El tratamiento es necesario para la satisfacción de intereses legítimos de ',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text: 'FITEMOS CORP',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: '. (',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: 'www.fitemos.com',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff149dcc))),
                  TextSpan(
                      text:
                          '), siempre que sobre dichos intereses no prevalezcan los intereses o los derechos y libertades fundamentales del “Usuario” que requieran la protección de datos personales, en particular cuando lo sea un niño o menor de 18 años.',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    '4. Para fines de procesamiento de pago de nuestros “Servicios”.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: '5. Para cumplir con la ley.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    '6. En caso de que no nos facilites tus datos o lo hagas de forma errónea o incompleta, no podremos atender tu solicitud, resultando del todo imposible proporcionarte la información solicitada o llevar a cabo la contratación de los servicios.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'En caso de no facilitarnos sus datos personales o lo haga de forma errónea o incompleta, no podremos atender su solicitud, resultando del todo imposible aprovechar todos los servicios, ventajas y experiencias que ofrece www.XXXXXXXXXX.com, al registrarse en nuestra “Sitio Web”.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'Consentimiento',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: '',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text: 'FITEMOS CORP',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: '. (',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: 'www.fitemos.com',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff149dcc))),
                  TextSpan(
                      text:
                          ') únicamente procederá a tratar los datos de carácter personal de los ',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: '“Usuarios”',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text:
                          ' siempre y cuando usted otorgue su consentimiento de forma expresa al tratamiento de estos, y únicamente se trataran los datos para las finalidades indicadas en esta ',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: '“Política de Privacidad”',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: ', no pudiendo ',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: 'FITEMOS CORP',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: '. (',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: 'www.fitemos.com',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff149dcc))),
                  TextSpan(
                      text: ')utilizar los datos de carácter personal de los ',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: '“Usuarios”',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text:
                          ' para cualquier otro fin, salvo que se hubiera obtenido el consentimiento expreso adicional para el tratamiento de los datos para un fin no descrito aquí.',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'Asimismo, el consentimiento otorgado por los ',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text: '“Usuarios”',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text:
                          ' cumple con los requisitos del artículo 4 del RGPD, por lo que el consentimiento dado es "toda manifestación de voluntad libre, específica, informada e inequívoca por la que el interesado acepta, y a seda mediante una declaración o una clara acción afirmativa, el tratamiento de datos personales que le conciernen".',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'Divulgación de Datos',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: '',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
                children: <TextSpan>[
                  TextSpan(
                      text: 'FITEMOS CORP',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: '. (',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                  TextSpan(
                      text: 'www.fitemos.com',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff149dcc))),
                  TextSpan(
                      text:
                          ') puede divulgar sus datos personales, siempre y cuando considere, que dicha acción es necesaria para:',
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff333333))),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: '1. Para cumplir con una obligación legal.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    '2. Para proteger los derechos de Propiedad Intelectual de FITEMOS CORP.(www.fitemos.com).',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    '3. Para prevenir o investigar posibles irregularidades en relación con el “Servicio”.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    '4. Para proteger la seguridad personal de los “Usuarios” del “Servicio”.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: '5. Para protegerse contra la responsabilidad legal.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'Cambios de la “Política de Privacidad”',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'Nos reservamos el derecho de cambiar estas “Políticas de Privacidad” para mejorar el “Servicio”. Le notificaremos de cualquier cambio publicando las nuevas Políticas de Privacidad.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'Informaremos por correo electrónico y/o un aviso destacado en el “Sitio Web”, antes que el cambio entre en vigencia.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'Se recomienda que revise esta “Política de Privacidad” periódicamente para detectar cualquier cambio. Los cambios solo serán efectivos cuando se publican en el “Sitio Web”.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'REDES SOCIALES',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'Nos reservamos el derecho de “PUBLICAR” y/o “REPUBLICAR” (RE-POST) en todas nuestras redes sociales (Facebook, Instagram, etc.…) cualquier contenido audiovisual capturado durante la prestación del Servicio en función de promover los Servicios de FITEMOS en sus redes sociales.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'Con la contratación del “Servicio”, el “Usuario” acepta y autoriza que FITEMOS CORP. haga uso de sus publicaciones (imagen, fotografía, video, video en formato “historia (story)” o combinación de estos) en formato de “PUBLICACION” y/o “REPUBLICACIÓN” (RE-POST) en todas las cuentas de redes sociales suscritas por FITEMOS.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'No obstante, lo anterior, todo “Usuario” tendrá derecho a solicitar la remoción de dichas publicaciones de las redes sociales de FITEMOS.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'Contáctenos',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text:
                  'Si tiene alguna pregunta o consulta relacionada con esta “Política de Privacidad”, escríbanos a: ',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: 'soporte@fitemos.com',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
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
