import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final String category;
  const Categories({@required this.category, Key key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String _category;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _category = widget.category;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width * 0.2,
          height: size.height * 0.2,
          decoration: new BoxDecoration(
            border: Border.all(
              color: Color(0xffD0D0D0),
            ),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xffD8ECF8),
                Color(0xff56A7E1),
              ],
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              _category,
              width: size.height * 0.07,
            ),
          ),
        ),
      ],
    );
  }
}
