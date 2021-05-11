import 'package:biyer/components/bot_nav_bar.dart';
import 'package:biyer/components/categories.dart';
import 'package:biyer/components/search_bar.dart';
import 'package:biyer/components/top_nav_bar.dart';
import 'package:biyer/login//auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService _authService = AuthService();
  int _selectedItem = 0;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: CustomBottomNavigationBar(
              iconList: [
                Icons.home,
                Icons.search,
                Icons.location_on,
                Icons.favorite,
                Icons.person,
              ],
              onChange: (val) {
                setState(() {
                  _selectedItem = val;
                });
              },
              defaultSelectedIndex: 0,
            ),
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(size.height * 0.1),
                child: TopNavBar()),
            body: Column(
              children: [
                SearchBar(),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Text(
                            'Kategoriler',
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xff504747),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Categories(
                            category: 'images/Steak.png',
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Categories(
                            category: 'images/Coffee.png',
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Categories(
                            category: 'images/Cocktail.png',
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
