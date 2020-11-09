import 'package:fitemos/src/FitemosPage.dart';
import 'package:fitemos/src/model/apisModal.dart';
import 'package:fitemos/src/utils/apiDataSource.dart';
import 'package:fitemos/src/utils/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:fitemos/src/auth/loginPage.dart';
// import 'package:page_transition/page_transition.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  RestDatasource api = new RestDatasource();

  @override
  void initState() {
    super.initState();
    bool loginFlag = SessionManager.getLogIn();
    bool rememberFlag = SessionManager.rememberedMe();
    if( loginFlag && rememberFlag) {        
        api.getUserInfo(SessionManager.getToken()).then((User res) async {
           if(res==null || res.active == 0 
          //  || res.subscriptionActive == false
           ) {
             Navigator.push(
                context,
                // PageTransition(
                //     type: PageTransitionType.rightToLeft, //leftToRight, 
                //       child: LoginPage())
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                )
             );
           } else{
             Navigator.push(
                context,
                // PageTransition(
                //     type: PageTransitionType.leftToRight, // leftToRight, 
                //       child: FitnessNav())
                MaterialPageRoute(
                  builder: (context) => FitnessNav(),
                )
             );
           }
          }).catchError((error) {

          });                
      } else {
        Future.delayed(const Duration(seconds: 5), () {      
           Navigator.push(
              context,
              // PageTransition(
              //     type: PageTransitionType.leftToRight, child: LoginPage())
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              )
           ); 
        });        
      }
    
  }

  Widget _splashIcon() {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        padding: EdgeInsets.symmetric(vertical: 0),
        alignment: Alignment.center,
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }

  Widget _splashAppName() {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 30,
        padding: EdgeInsets.symmetric(vertical: 0),
        alignment: Alignment.center,
        child: Image.asset('assets/images/app_name.png'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color(0xff333333)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              _splashIcon(),
              SizedBox(
                height: 30,
              ),
              _splashAppName(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
