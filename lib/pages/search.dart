import 'package:biyer/components/bot_nav_bar.dart';
import 'package:biyer/components/search_bar.dart';
import 'package:biyer/components/search_categories.dart';
import 'package:biyer/components/top_nav_bar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
        defaultSelectedIndex: 1,
      ),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.1),
          child: TopNavBar()),
      body: Column(
        children: [
          SearchBar(),
          Row(
            children: [
              SizedBox(
                width: size.width * 0.04,
              ),
              SearchCategory(),
              SizedBox(
                width: size.width * 0.04,
              ),
              SearchCategory(),
              SizedBox(
                width: size.width * 0.04,
              ),
              SearchCategory(),
              SizedBox(
                width: size.width * 0.04,
              ),
            ],
          )
        ],
      ),
    ));
  }
}
