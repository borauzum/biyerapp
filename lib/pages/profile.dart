import 'package:biyer/components/bot_nav_bar.dart';
import 'package:biyer/components/top_nav_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        defaultSelectedIndex: 4,
      ),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.1),
          child: TopNavBar()),
      body: Text('Profil'),
    ));
  }
}
