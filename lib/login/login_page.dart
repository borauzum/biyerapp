import 'package:biyer/login/auth_service.dart';
import 'package:biyer/pages/home.dart';
import 'package:biyer/register/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Stack(
                children: [
                  CustomPaint(
                    size: Size(
                        size.width,
                        (size.width * 0.7)
                            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: TLCustomPainter(),
                  ),
                  CustomPaint(
                    size: Size(
                        size.width,
                        (size.width * 0.6)
                            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: TRCustomPainter(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 40, 0, 0),
                    child: Text(
                      'Giris Yap',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                    child: TextField(
                        controller: _emailController,
                        style: TextStyle(
                          color: Color(0xff504747),
                        ),
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffDDEDF9),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Color(0xff56A7E1),
                          ),
                          labelText: 'E-Mail',
                          prefixText: '',
                          labelStyle: GoogleFonts.openSans(
                            color: Color(0xff504747),
                            fontSize: 20,
                          ),
                          focusColor: Color(0xff56A7E1),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xff56A7E1),
                          )),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            style: BorderStyle.none,
                            color: Color(0xff56A7E1),
                          )),
                        )),
                  ), // TODO: insanlarin hesaplari olmadiginda hata ver.
                  // TODO: Google ve Facebook ile giris ekle.
                  // giris yaptiktan sonra geri tusu var onu kaldir.
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child: TextField(
                        controller: _passwordController,
                        style: TextStyle(
                          color: Color(0xff504747),
                        ),
                        cursorColor: Colors.white,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffDDEDF9),
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Color(0xff56A7E1),
                          ),
                          labelText: 'Sifre',
                          prefixText: '',
                          labelStyle: GoogleFonts.openSans(
                            color: Color(0xff504747),
                            fontSize: 20,
                          ),
                          focusColor: Color(0xff56A7E1),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xff56A7E1),
                          )),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            style: BorderStyle.none,
                            color: Color(0xff56A7E1),
                          )),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RichText(
                            textAlign: TextAlign.right,
                            text: TextSpan(
                                text: 'Sifremi Unuttum',
                                style: GoogleFonts.openSans(
                                  color: Color(0xff504747),
                                  fontSize: 15,
                                ), //TODO:sifremi unuttim sayfasi yap
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Sifremi Unuttum');
                                  })),
                      ],
                    ),
                  ),
                  Container(
                    height: size.width * 0.15,
                    width: size.width * 0.6,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: InkWell(
                      onTap: () {
                        _authService
                            .signIn(
                                _emailController.text, _passwordController.text)
                            .then((value) {
                          return Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xff56A7E1), Color(0xff56E17D)])
                            //color: colorPrimaryShade,
                            ,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          child: Center(
                            child: Text(
                              "Giriş yap",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Hesabin yok mu?  ',
                              style:
                                  GoogleFonts.openSans(color: Colors.black45)),
                          TextSpan(
                              text: 'Hesap olustur',
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff56A7E1),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()),
                                  );
                                }),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}

class TRCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.7358265, size.height * 0.5078545);
    path_0.cubicTo(
        size.width * 0.8873349,
        size.height * 0.4303664,
        size.width * 0.9851229,
        size.height * 0.8123909,
        size.width,
        size.height);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.4895273);
    path_0.cubicTo(
        0,
        size.height * 0.4895273,
        size.width * 0.03160434,
        size.height * 0.4638727,
        size.width * 0.1483716,
        size.height * 0.3089005);
    path_0.cubicTo(
        size.width * 0.2651398,
        size.height * 0.1539268,
        size.width * 0.3494169,
        size.height * 0.2390927,
        size.width * 0.3920386,
        size.height * 0.3507855);
    path_0.cubicTo(
        size.width * 0.4439084,
        size.height * 0.4397905,
        size.width * 0.5843181,
        size.height * 0.5853409,
        size.width * 0.7358265,
        size.height * 0.5078545);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff82C2F0).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TLCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2641735, size.height * 0.5078530);
    path_0.cubicTo(size.width * 0.1126658, size.height * 0.4303674,
        size.width * 0.01487737, size.height * 0.8123898, 0, size.height);
    path_0.lineTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.4895304);
    path_0.cubicTo(
        size.width,
        size.height * 0.4895304,
        size.width * 0.9683952,
        size.height * 0.4638754,
        size.width * 0.8516289,
        size.height * 0.3089006);
    path_0.cubicTo(
        size.width * 0.7348602,
        size.height * 0.1539268,
        size.width * 0.6505831,
        size.height * 0.2390927,
        size.width * 0.6079614,
        size.height * 0.3507859);
    path_0.cubicTo(
        size.width * 0.5560916,
        size.height * 0.4397891,
        size.width * 0.4156819,
        size.height * 0.5853419,
        size.width * 0.2641735,
        size.height * 0.5078530);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffC0E0F7).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
