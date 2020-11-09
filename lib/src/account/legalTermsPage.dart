import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LegalTerms extends StatefulWidget {
  final conTitle;
  LegalTerms({Key key, this.conTitle}) : super(key: key);

  @override
  _legalTermsState createState() => _legalTermsState();
}

class _legalTermsState extends State<LegalTerms> {
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
              text: 'Estos Términos y Condiciones, en adelante, ',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333)),
              children: <TextSpan>[
                TextSpan(
                    text: '“Términos”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333))),
                TextSpan(
                    text:
                        ', son aplicables a cualquier acceso y uso del sitio web ',
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
                    text: ', en adelante, el ',
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
                        'operado y propiedad de FITEMOS CORP. Cualquier acceso o uso continuo del “Servicio” implican la aceptación de estos “Términos” como contrato legalmente vinculante con FITEMOS CORP., en adelante, la “Empresa”',
                    style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff333333))),
              ],
            ),
          ),
          SizedBox(height: 15),
          Text('REGULACIÓN DE LAS CONDICIONES DE USO',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333))),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text:
                  'Los siguientes “Términos” regulan el acceso y la utilización del Sitio Web incluyendo los contenidos y los servicios puestos a disposición de los “Usuarios” en y/o a través del sitio web. No obstante, el acceso y la utilización de ciertos contenidos y/o servicios pueden encontrarse sometidos a determinadas condiciones específicas.',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333)),
            ),
          ),
          SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text:
                  'En lo sucesivo se entenderá como USUARIO / USUARIOS toda persona que, voluntariamente, haga uso de los servicios ofrecidos en el Sitio Web.',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333)),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text('1. Objeto del Servicio y Partes suscriptoras.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('a. Sobre FITEMOS',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'FITEMOS es un Sitio Web dedicado a distribuir programaciones de entrenamiento físico y nutrición deportiva, personalizado a la medida de sus usuarios (en adelante “FITEMOS”). Dichos programas de entrenamiento físico y nutrición son adecuados para realizar en el domicilio del usuario o en un gimnasio con equipo básico.',
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
            child: Text('b. Capacidad Legal del Usuario',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'Al hacer uso de FITEMOS, usted acepta los TERMINOS expresados en este contrato sobre el uso, gratuito u oneroso, de los servicios de entrenamiento y nutrición (en adelante “SERVICIOS”) ofrecidos por FITEMOS.',
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
                    'Al utilizar FITEMOS, el USUARIO declara ser mayor de dieciocho (18) años de edad y poseer el derecho y capacidad legal para utilizar cualquier tarjeta de crédito u otro método de pago proporcionado, en relación con cualquier compra dentro de FITEMOS.',
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
            child: Text('c. Información proporcionada por el usuario',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'El USUARIO declara que toda la información provista al sitio FITEMOS es verdadera, correcta y completa.',
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
                    'Si el USUARIO desea suscribirse a los SERVICIOS de FITEMOS, se le solicitará que proporcione cierta información relevante para su compra, que incluye, entre otros, el número de su tarjeta de crédito, la fecha de vencimiento de su tarjeta de crédito, su dirección de facturación y su información de envío.',
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
                    'Al enviar dicha información, nos otorga el derecho de proporcionar la información a terceros con el fin de facilitar la realización de compras.',
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
                    'Nos reservamos el derecho de rechazar o cancelar su pedido o solicitud, en cualquier momento, por motivos, que incluyen, mas no de manera limitativa, entre otros: disponibilidad del producto o servicio, errores en la descripción o precio del producto o servicio, error en su pedido u otros motivos.',
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
                    'Nos reservamos el derecho de rechazar o cancelar su pedido si se sospecha fraude o una transacción no autorizada o ilícita',
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
            child: Text('d. Contratación y cuenta del usuario',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'La forma en que se materializa la contratación dependerá del modo que el USUARIO elija para formalizar su primer registro en FITEMOS y de que utilice o no el PERIODO DE PRUEBA.',
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
                text: 'i. Registro de cuenta del usuario:',
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
                    'Los TERMINOS descritos en el presente documento tendrán validez una vez que el USUARIO cree su cuenta de FITEMOS, independientemente que lo haga mediante el Sitio Web o cualquier aplicación que desarrolle FITEMOS para teléfonos inteligentes, tabletas u otros dispositivos móviles.',
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
                    'Los TERMINOS descritos en el presente documento serán validos dentro del PERIODO DE PRUEBA tanto como en la suscripción pagada a los SERVICIOS de FITEMOS.',
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
            child: Text('e. Usos del Sitio Web',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'El USUARIO declara que utiliza el servicio provisto por FITEMOS en calidad de CONSUMIDOR.',
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
                    'Para los efectos de los presentes términos, se entenderá el concepto de CONSUMIDOR como toda persona física que efectué una transacción legitima con fines absolutamente ajenos a su actividad comercial o profesional autónoma.',
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
                    'FITEMOS declara que prohíbe de manera absoluta el uso de su sitio web para fines profesionales o comerciales. El uso de FITEMOS para finalidades de reventa, comercio o explotación profesional será considerado como un mal uso de la plataforma.',
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
                    'FITEMOS se reserva el derecho a cancelar el servicio a todo USUARIO que considere que haga malos usos de su plataforma, sin limitarse a exigir o perseguir las acciones legales pertinentes.',
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
                    'FITEMOS se reserva el derecho a establecer condiciones complementarias para determinadas prestaciones de sus SERVICIOS. En cuyo caso, se le notificara al USUARIO con antelación antes de su uso para que pueda expresar su consentimiento previo a continuar el uso de los SERVICIOS bajo condiciones adicionales o complementarias.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text('2. Servicios ofrecidos',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('a. Entrenamientos y guías nutricionales',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'FITEMOS toma datos personales de los USUARIOS, tales como: edad, genero, peso, estatura, porcentaje de grasa corporal, condiciones físicas, nivel de actividad física semanal, equipo deportivo o gimnasio disponible y los objetivos de cada USUARIO mediante un formulario en línea en el Sitio Web o aplicación para teléfono inteligente o tableta.',
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
                    'Con los datos obtenidos de los USUARIOS, FITEMOS genera una guía de entrenamientos totalmente personalizada que se remitirá de manera diaria al correo electrónico provisto por el USUARIO o por mensajería instantánea de texto mediante la aplicación “WhatsApp” al número de teléfono celular provisto por el USUARIO.',
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
                    'Cada rutina será complementada por videos tutoriales para cada movimiento. Realizados y explicados por entrenadores profesionales.',
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
                    'El USUARIO también recibirá de FITEMOS información semanal relevante a su nutrición, recomendaciones sobre hábitos de ejercicio físico, entre otros temas relevantes para el desarrollo del programa provisto por FITEMOS.',
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
                    'FITEMOS declara que sus SERVICIOS no incluyen herramientas o equipos para el ejercicio físico (tales como mancuernas, barras, máquinas de polea, máquinas de gimnasia, soportes para calistenia, etc. …), estos deben ser adquiridos por cuenta de los USUARIOS y a su propio coste.',
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
                    'FITEMOS declara que sus SERVICIOS no incluyen los alimentos sugeridos como parte de las recomendaciones de nutrición deportiva, estos deben ser adquiridos por cuenta de los USUARIOS y a su propio coste.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('b. Prueba gratuita',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'FITEMOS ofrece un periodo de prueba gratuito a sus USUARIOS (en adelante “PERIODO DE PRUEBA”).',
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
                    'La utilización del PERIODO DE PRUEBA limita la disponibilidad a una serie de funcionalidades e informaciones básicas de los respectivos SERVICIOS ofrecidos por FITEMOS. La cantidad de funciones podrá ampliarse contratando la habilitación de los contenidos deseados por separado (así como la rutina de entrenamiento) mediante un único pago o dentro del marco de una suscripción para a los SERVICIOS de FITEMOS.',
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
                    'El PERIODO DE PRUEBA tendrá una duración de una (1) semana, contada sobre siete (7) días calendarios a partir de la creación de la cuenta de FITEMOS en su Sitio Web.',
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
                    'Para que el USUARIO se suscriba al PERIODO DE PRUEBA, deberá crear una cuenta en el Sitio Web FITEMOS.',
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
                    'Una vez finalice el término del PERIODO DE PRUEBA, el usuario deberá registrar su tarjeta de crédito como método de pago y seleccionar un plan de suscripción para poder mantener el uso de la aplicación FITEMOS.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('c. Suscripciones',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'FITEMOS ofrece a sus usuarios los siguientes planes de afiliación:',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'i. Plan mensual',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'ii. Plan trimestral',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'iii. Plan semestral',
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
                    'Las modalidades de precio y suscripción actuales y las prestaciones asociadas estarán descritas en el sitio web ',
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
                          '. Los precios indicados incluyen el IVA (ITBMS) según el tipo legal vigente en cada momento.',
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
                    'Las suscripciones a FITEMOS se ofrecen con diferentes periodos mínimos de validez y se renuevan automáticamente por el periodo de duración mínima elegido.',
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
                    'Con el fin de evitar cualquier malentendido, por favor, tenga en cuenta que el plazo de suscripción viene determinado por el calendario y es independiente de su uso efectivo o de la extensión del uso del respectivo los SERVICIOS.',
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
            child: Text('d. Medio de Pago',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'Las suscripciones podrán ser realizadas exclusivamente mediante descuento directo por tarjeta de crédito.',
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
                    'El USUARIO declara que al registrar su tarjeta de crédito AUTORIZA expresamente a FITEMOS para que realice cargos a su cuenta en la frecuencia que seleccione según su plan de suscripción.',
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
                    'FITEMOS cobrará a la tarjeta de crédito del USUARIO cada plan suscrito. Al adquirirse una suscripción, los pagos se cobrarán por adelantado en el momento de la perfección del contrato por el periodo de duración mínima elegido. Si la suscripción se renueva automáticamente, los pagos se cobrarán por adelantado en el momento del comienzo del periodo de renovación.',
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
                    'El USUARIO podrá solicitar la cancelación de su suscripción en cualquier momento y se suspenderá la suscripción al final de cada ciclo pagado por adelantado.',
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
                    'En el caso de la compra de prestaciones adicionales por un pago de un importe único los pagos se cobrarán en el momento de la perfección del contrato.',
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
                    'FITEMOS se reserva el derecho a formular reclamaciones adicionales por demora en el pago.',
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
            child: Text('e. Política de Devoluciones',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'FITEMOS no admite devoluciones a sus USUARIOS sobre planes de suscripción pagados.',
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
                    'Cualquier cancelación sobre una suscripción pagada por el USUARIO se hará efectiva al final del ciclo pagado.',
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
                    'FITEMOS recomienda a sus USUARIOS hacer uso de su PERIODO DE PRUEBA y considerar tomar el servicio antes de registrar su tarjeta de crédito al sistema de facturación.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text('3. Advertencia de salud del usuario',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'El USUARIO declara que utilizará los SERVICIOS de FITEMOS bajo su propio riesgo y que bajo ninguna circunstancia FITEMOS será tomado como responsable por lesiones o perjuicios sobre la integridad física o la salud del USUARIO.',
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
                    'FITEMOS declara e informa a sus USUARIOS que un buen estado de salud general es requisito imprescindible para el uso de sus SERVICIOS.',
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
                    'FITEMOS recomienda a sus USUARIOS que, de tener conocimiento de alguna enfermedad preexistente, consulte a su medico antes de iniciar el uso de los SERVICIOS de FITEMOS, o, en general, cualquier tipo de régimen de nutrición y/o entrenamiento físico. En especial si se tratase de alguna de las siguientes condiciones patológicas:',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'i. Enfermedades Cardiovasculares',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'ii. Enfermedades pulmonares (incluyendo ASMA)',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'iii. Dolencias en la columna vertebral y/o articulaciones',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'iv. Enfermedades neuromusculares',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'v. Intervenciones quirúrgicas',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: 'vi. Otras limitaciones por motivos de salud',
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
                    'El USUARIO acepta que es su responsabilidad verificar que los alimentos y nutrientes recomendados por los SERVICIOS de FITEMOS no contengan ingredientes a los que el USUARIO sea alérgico o pueda causarle intolerancia.',
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
                    'FITEMOS declara que no se hace responsable por reacciones adversas o brotes alérgicos causados por la inobservancia, negligencia o desconocimiento del USUARIO sobre este tipo de condiciones fisiológicas preexistentes al uso de sus SERVICIOS.',
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
                    'FITEMOS declara que sus SERVICIOS no deben ser utilizados por mujeres embarazadas o mujeres en periodo de lactancia.',
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
                    'FITEMOS advierte a sus USUARIOS que observen las señales de su cuerpo al momento de hacer uso de los SERVICIOS. Si antes de iniciar o durante el uso de los SERVICIOS de FITEMOS llegara a dudar de su estado de salud (ya sea porque el USUARIO experimente fuertes dolores, un malestar general, falta de aliento, náuseas o mareos), consulte a su médico antes de comenzar o continuar con FITEMOS.',
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
            child: Text('b. Descargos',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'Las prestaciones e informaciones ofrecidas a través de FITEMOS y los SERVICIOS no son consejos médicos. En ningún caso podrán sustituir un reconocimiento o tratamiento médico.',
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
                    'El asesoramiento en cuestiones de ejercicio físico y/o nutrición se actualiza constantemente en función del desarrollo de los conocimientos científicos sobre salud, nutrición y deporte. Si bien diseñamos nuestros entrenamientos y consejos de alimentación de acuerdo con estudios y conocimientos actuales, no garantizamos que correspondan en cada momento al estado de la investigación o a los conocimientos más recientes.',
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
                    'FITEMOS declara que no será responsable por cualquier lesión o perjuicio de salud que sufra el USUARIO por el uso de sus SERVICIOS, toda vez que el USUARIO acepta expresamente que utiliza los SERVICIOS, gratuitos o suscritos, bajo su propio riesgo.',
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
                    'FITEMOS no garantiza ninguno resultado a los USUARIOS de sus servicios, toda vez que los resultados pueden variar de acuerdo al uso, fisiología y constancia del USUARIO.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text('4. DISPONIBILIDAD y/o ERRORES',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'Constantemente actualizamos nuestras ofertas de SERVICIOS y productos en FITEMOS. Los productos o servicios disponibles en nuestro FITEMOS pueden tener un precio incorrecto, describirse incorrectamente o no estar disponibles, así como también podríamos experimentar retrasos en la actualización de la información sobre FITEMOS” y en nuestra publicidad en otros sitios web.',
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
                    'No podemos garantizar la exactitud o integridad de cualquier información, tales como, precios, imágenes de productos o servicios, especificaciones, disponibilidad y servicios. Nos reservamos el derecho de cambiar o actualizar la información y de corregir errores u omisiones en cualquier momento sin previo aviso.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text('5. PROPIEDAD INTELECTUAL',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'FITEMOS, su contenido, características y funcionalidad originales son y seguirán siendo propiedad exclusiva de FITEMOS CORP. y sus licenciantes. FITEMOS está protegido por derechos de autor, marcas registradas y otras leyes, tanto de Panamá como de otros países. (confirmar)',
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
                    'Nuestras marcas y nuestra imagen comercial no pueden utilizarse en relación con ningún producto o servicio sin el consentimiento previo por escrito de FITEMOS CORP.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text('6. ENLACES A OTROS SITIOS WEB',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'FITEMOS puede contener enlaces a sitios web o servicios de terceros que no son propiedad ni son operados o controlados por FITEMOS CORP.',
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
                    'FITEMOS CORP. no tiene control ni asume ninguna responsabilidad por el contenido, las políticas de privacidad o las prácticas de los sitios web o servicios de terceros. Además, reconoce y acepta que FITEMOS CORP. no será responsable, directa o indirectamente, de ningún daño o pérdida causada o supuestamente causada por el uso o la dependencia de dicho contenido, bienes o servicios disponibles en o a través de dichos sitios web o servicios.',
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
                    'Le sugerimos que lea los términos y condiciones y las políticas de privacidad de los sitios web o servicios de terceros que visite.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text('7. TERMINACIÓN',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'Los presentes TERMINOS Y CONDICIONES tendrán una duración indefinida y cesarán cuando medie la terminación del uso de los SERVICIOS, por voluntad del USUARIO o por causas imputables al usuario, listadas en el presente documento.',
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
                    'FITEMOS se reserva el derecho a rescindir o suspender su acceso inmediatamente, previo aviso, por cualquier motivo, incluso, entre otros, si usted no cumple con los “Términos”.',
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
                    'Al finalizar la relación, su derecho a utilizar FITEMOS cesará inmediatamente.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text('8. LIMITACIÓN DE RESPONSABILIDAD',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'En ningún caso, FITETMOS CORP., ni sus directores, empleados, socios, agentes, proveedores o afiliados, serán responsables por daños indirectos, incidentales, especiales, consecuentes o punitivos, que incluyen, entre otros, pérdida de ganancias, datos, uso, buena voluntad u otras pérdidas intangibles, como resultado de:',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    '1. Su acceso o uso o incapacidad para acceder o usar el Sitio Web',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    '2. Cualquier conducta o contenido de un tercero en el Sitio Web',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: '3. Cualquier contenido obtenido del Sitio Web; y',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    '4. Acceso no autorizado, uso o alteración de sus transmisiones o contenido, ya sea basado en garantía, contrato, agravio (incluyendo negligencia) o cualquier otra teoría legal, ya sea que se nos haya informado o no de la posibilidad de tal daño, e incluso si se encuentra que un remedio establecido en este documento ha fallado en su propósito esencial.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text('9. RENUNCIA',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'El uso del Sito Web es bajo su propio riesgo y responsabilidad.',
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
                    'FITEMOS CORP., sus subsidiarias, afiliadas y sus licenciantes no garantizan que:',
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
                    'a) El Servicio funcione sin interrupciones o esté disponible en un momento o lugar en particular;',
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
                    'b) Cualquier error o defecto será corregido de inmediato;',
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
                    'c) El Servicio está libre de virus u otros componentes dañinos;',
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
                    'd) Los resultados del uso del Servicio cumplirán sus requisitos.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text('10. LEY QUE REGULA LA MATERIA',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'Estos “Términos” se regirán e interpretarán de conformidad con las leyes de la República de Panamá.',
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
                    'Nuestro incumplimiento de cualquier derecho o disposición de estos “Términos” no se considerará una renuncia a esos derechos. Si alguna disposición de estos “Términos” se considera inválida o inaplicable por un tribunal, las disposiciones restantes de estos “Términos” seguirán vigentes. Estos “Términos” constituyen el acuerdo completo entre nosotros con respecto a nuestro Servicio o “Sitio Web”, y reemplazan cualquier acuerdo anterior que podamos tener entre nosotros con respecto al Servicio.',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text('11. CAMBIOS',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333))),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    'FITEMOS se reserva el derecho, bajo su exclusivo criterio unilateral, de modificar o reemplazar estos “Términos” en cualquier momento. Le notificaremos mediante un aviso destacado en el “Sitio Web” antes de que entren en vigencia los nuevos “Términos”.',
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
                    'Al continuar accediendo o utilizando nuestro “Sitio Web” después de que esas revisiones entren en vigencia, usted acepta estar sujeto a los nuevos “Términos”.',
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
                    'Se recomienda que revise los “Términos” periódicamente para detectar cualquier cambio.',
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
                    'Si no está de acuerdo con los nuevos términos, puede darse de baja del “Sitio Web” enviando un correo electrónico a: ',
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
          ),
          SizedBox(height: 15),
          Text('Contáctenos',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333))),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text:
                  'Si tiene alguna pregunta o consulta relacionada a estos “Términos”, escríbanos a: ',
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
