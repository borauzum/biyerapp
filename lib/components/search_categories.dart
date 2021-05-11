import 'package:flutter/material.dart';

class SearchCategory extends StatefulWidget {
  const SearchCategory({Key key}) : super(key: key);

  @override
  _SearchCategoryState createState() => _SearchCategoryState();
}

class _SearchCategoryState extends State<SearchCategory> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.28,
      height: size.height * 0.28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffC0E2F7),
      ),
      child: Center(
        child: Image.asset(
          'images/Coffee.png',
          height: size.height * 0.13,
          width: size.width * 0.13,
        ),
      ),
    );
  }
}
