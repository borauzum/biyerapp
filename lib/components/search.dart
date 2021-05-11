import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final businesses = [
    'Biyer Market',
    'Biyer Kutuphane',
    'Vas machts du',
    'Biyer kafe',
    'Biyer Bal',
    'Bar Burda her sey var',
    'YemekSEpeti Bar',
    'Biyer Bar',
    'Btm Market',
    'Cok iyi Market',
    'Biyer Hamburger',
    'Biyer Sucukcu',
    'Ikiyer Market',
  ];
  final recentSearch = [
    'Biyer Market',
    'Vas machts du',
    'Bar Burda her sey var',
    'Ikiyer Market',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Card(
        color: Colors.red,
        shape: StadiumBorder(),
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSearch
        : businesses.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.search),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}
