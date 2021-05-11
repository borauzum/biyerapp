import 'package:biyer/components/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: DataSearch());
      },
      child: Column(
        children: [
          Container(
            height: size.height * 0.13,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  style: GoogleFonts.openSans(
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffF2F5F7),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xffD0D0D0),
                    ),
                    hintText: 'Arama yapmak icin tiklayiniz...',
                    prefixText: ' ',
                    hintStyle: TextStyle(color: Color(0xffD0D0D0)),
                    focusColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xffD0D0D0),
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xffD0D0D0),
                        )),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
