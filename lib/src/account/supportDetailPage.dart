import 'package:flutter/material.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportDetail extends StatefulWidget {
  final conTitle;
  SupportDetail({Key key, this.conTitle}) : super(key: key);

  @override
  _supportDetailState createState() => _supportDetailState();
}

class _supportDetailState extends State<SupportDetail> {
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
                    fontWeight: FontWeight.w300,
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
          Text("¿Cómo funciona Fitemos?",
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333))),
          SizedBox(height: 5),
          Text(
              'Es muy sencillo. Haz click en "COMENZAR" llena el formulario y suscríbete en minutos. Procederemos a enviarte tu rutina 100% personalizada y ya estará todo listo para que entrenes desde casa o un gym básico.',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333))),
          SizedBox(height: 15),
          Text("¿Cómo personalizan un workout para mi?",
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333))),
          SizedBox(height: 5),
          Text(
              'La efectividad de Fitemos, está en la personalización acorde a los objetivos de cada miembro. Tomamos tus datos como altura, peso, edad, condición física actual y el lugar donde realizarás las rutinas de Fitemos. Con estos datos podremos recomendarte un objetivo o bien escogerlo tu mismo, y realizar un plan 100% orientado al cumplimiento del mismo.',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333))),
          SizedBox(height: 15),
          Text("¿Dónde puedo ver mis workouts?",
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333))),
          SizedBox(height: 5),
          Text(
              'Los workouts siempre los podrás ver en tu perfil del sitio web y te los podremos enviar a tu correo electrónico o WhatsApp. Estas preferencias las podrás ajustar en cualquier momento desde tu perfil.',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333))),
          SizedBox(height: 15),
          Text("¿Necesito algún equipo especial para entrenar?",
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333))),
          SizedBox(height: 5),
          Text(
              'En Fitemos creamos rutinas personalizadas. Es decir, si no tienes equipo, te enviaremos una rutina que no requiera equipos. Sin embargo, siempre recomendamos tener un juego de mancuernas de peso mediano para tener workouts más variados y efectivos.',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333))),
          SizedBox(height: 15),
          Text("¿Necesito experiencia en Fitness para entrenar con Fitemos?",
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333))),
          SizedBox(height: 5),
          Text(
              'En lo absoluto. La comunidad de Fitemos la integran personas que se están iniciando en el Fitness hasta personas experimentadas. Todas las rutinas de Fitemos se ajustan a la condición física actual y vienen acompañadas de videos tutoriales de cada movimiendo, realizados por expertos y explicados con gran detalle.',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333))),
          SizedBox(height: 15),
          Text("¿Cómo funciona la facturación?",
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333))),
          SizedBox(height: 5),
          Text(
              'La facturación funciona por descuento directo y es 100% seguro. La frecuencia de la facturación y el monto dependerá del plan que hayas seleccionado. Aceptamos los métodos de pago Visa, Mastercard y Paypal.',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333))),
          SizedBox(height: 15),
          Text("¿Cómo cancelo mi suscripción?",
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333))),
          SizedBox(height: 5),
          Text(
              'La suscripción la podrás cancelar en cualquier momento desde tu perfil, sin cargos adicionales.',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333))),
          SizedBox(height: 15),
          Text("¿Cómo puedo maximizar mis resultados?",
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333))),
          SizedBox(height: 5),
          Text(
              'Las rutinas de Fitemos son altamente efectivas, gracias a su personalización. Para maximizar los resultados recomendamos seguir al pie de la letra las rutinas enviadas, respetar los días de descanso y leer nuestro blog semanal que contiene valiosa información sobre nutrición.',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333))),
          SizedBox(height: 15),
          Text("¿Cómo contacto a un coach?",
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333))),
          SizedBox(height: 5),
          Text(
              'Podrás contactar a un coach 24/7 desde tu perfil. El mismo te contestará lo antes posible y de la mejor manera, para resolver cualquier inquietud relacionada a fitness o nutrición.',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333))),
          SizedBox(height: 15),
          Text("¿Cómo aumento o disminuyo la intensidad del programa?",
              style: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333))),
          SizedBox(height: 5),
          Text(
              'Desde tu perfil, en la sección de Nivel de Condición Física, podrás ajustar la intensidad que va de uno a cinco.',
              style: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff333333))),
          SizedBox(height: 15),
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
