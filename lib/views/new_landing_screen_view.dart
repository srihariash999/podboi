import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podboi/views/subscriptions_page_view.dart';

class ScreenOne extends StatelessWidget {
  final int _selectedIndex = 0;
  final padding = 8.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarOpacity: 0.0,
        //title: Text("PodBoi", style: Theme.of(context).textTheme.headline4),
        title: Text(
          "podboi",
          style: GoogleFonts.monoton(
            textStyle: TextStyle(
              fontSize: 32.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            NavigationRail(
              minWidth: 56.0,
              groupAlignment: 0.0,
              backgroundColor: Colors.white,
              selectedIndex: _selectedIndex,
              selectedIconTheme: IconThemeData(
                color: Color(0xffFCCFA8),
              ),
              onDestinationSelected: (int index) {
                print(index);
              },
              labelType: NavigationRailLabelType.all,
              leading: Column(
                children: <Widget>[
                  RotatedBox(
                    quarterTurns: -1,
                    child: IconButton(
                      icon: Icon(Icons.tune),
                      color: Colors.black26,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              selectedLabelTextStyle: TextStyle(
                color: Color(0xffFCCFA8),
                fontSize: 13,
                letterSpacing: 0.8,
                decoration: TextDecoration.underline,
                decorationThickness: 2.0,
              ),
              unselectedLabelTextStyle: TextStyle(
                fontSize: 13,
                letterSpacing: 0.8,
              ),
              destinations: [
                buildRailDestination(
                  "Favourites",
                  Icons.rss_feed,
                  Color(0xffFCCFA8),
                ),
                buildRailDestination(
                  "poo",
                  Icons.search,
                  Colors.black45,
                ),
                buildRailDestination(
                  "Favourites",
                  Icons.music_note,
                  Colors.black45,
                ),
              ],
            ),
            VerticalDivider(),
            // This is the main content.
            ContentSpace(),
          ],
        ),
      ),
    );
  }
}

NavigationRailDestination buildRailDestination(
    String text, IconData icond, Color rang) {
  return NavigationRailDestination(
      icon: Icon(
        icond,
        color: rang,
      ),
      label: Text(" "));
}

class ContentSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: SubscriptionsPageView());
  }
}
