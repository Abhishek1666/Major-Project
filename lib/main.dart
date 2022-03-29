import 'package:flutter/material.dart';
import 'package:projectpart1/constants.dart';
import 'colorScheme.dart';
// import 'package:projectpart1/Screens/Login/login.dart';
import 'package:projectpart1/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase/firebase.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        fontFamily: 'avenir',
      ),
      home: MyHomePage(),
      routes: {
        '/home_page' : (context) => LoginScreen(),
      },
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  painter: pathPainter(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(50),
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Skyler: The Doctor AssistanT", style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),),



                    Text("A Constant Companion to the Saviours OF Humanity", style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),)


                  ],
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height*0.3,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Image.asset('images/img1.jpg'),
                    )
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  child: Container(
                    height: 80,
                    width: 200,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0,1],
                          colors: [getStartedColorStart,getStartedColorEnd],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                        )
                    ),
                    child: Center(
                      child: Text(
                        "Get Started", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                      ),
                    ),
                  ),
                  onTap: openHomePage,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  void openHomePage()
  {
    Navigator.pushNamed(context, '/home_page');
  }
}
class pathPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = path1Color;
    paint.style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, size.height*0.4);
    path.quadraticBezierTo(size.width*0.35, size.height*0.40, size.width*0.58, size.height*0.6);
    path.quadraticBezierTo(size.width*0.72, size.height*0.8, size.width*0.92, size.height*0.8);
    path.quadraticBezierTo(size.width*0.98, size.height*0.8, size.width, size.height*0.82);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}