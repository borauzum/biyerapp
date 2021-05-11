import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _counter = 0;
    return Stack(fit: StackFit.expand, children: <Widget>[
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xff010101).withOpacity(0.12),
                spreadRadius: 0.5,
                offset: Offset(0, 3),
              )
            ]),
      ),
      Center(
        child: Text(
          "Biyer",
          style: GoogleFonts.openSans(
              fontWeight: FontWeight.w600,
              color: Color(0xff56A7E1),
              fontSize: 30),
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.notifications,
          color: Colors.black,
          size: 30,
        ),
      ),
      Container(
        width: 30,
        height: 30,
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(top: 0),
        child: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffc32c37),
              border: Border.all(color: Colors.white, width: 1)),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Center(
              child: Text(
                _counter.toString(),
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
