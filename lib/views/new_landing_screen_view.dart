import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:podboi/models/landing_page_model.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:podboi/views/subscriptions_page_view.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:podboi/service_locator.dart';
import 'package:podboi/state_enums.dart';
import 'add_podcast_page_view.dart';
import 'player_page_view.dart';

class ScreenOne extends StatelessWidget {
  final padding = 8.0;
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return ScopedModel<LandingPageModel>(
      model: locator<LandingPageModel>(),
      child: Scaffold(
        backgroundColor: Colors.white,

        // I for the time being am removing the appbar. Trying a new look (kind of). Might revert to having an app bar later.
        // If you change your mind, wrap the appbar in a scopedmodeldescendant too. To manage its state.
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0.0,
        //   toolbarOpacity: 0.0,
        //   //title: Text("PodBoi", style: Theme.of(context).textTheme.headline4),
        //   title: Text(
        //     "podboi",
        //     style: GoogleFonts.monoton(
        //       textStyle: TextStyle(
        //         fontSize: 32.0,
        //         color: Colors.black,
        //       ),
        //     ),
        //   ),
        // ),
        body: ScopedModelDescendant<LandingPageModel>(
          builder: (child, context, model) {
            lpState _content = model.content();
            switch (_content) {
              case lpState.subscriptions:
                {
                  _selectedIndex = 0;
                  break;
                }

              case lpState.player:
                {
                  _selectedIndex = 2;
                  break;
                }
              case lpState.addpodcasts:
                {
                  _selectedIndex = 1;
                  break;
                }
            }
            return SafeArea(
              child: Row(
                children: <Widget>[
                  NavigationRail(
                    minWidth: 56.0,
                    groupAlignment: 0.0,
                    backgroundColor: Colors.white,
                    selectedIndex: _selectedIndex,
                    selectedIconTheme: IconThemeData(
                      color: Colors.red,
                    ),
                    onDestinationSelected: (int index) {
                      print(index);
                      if (index == 0) {
                        model.tappedIcon(lpState.subscriptions);
                      }
                      if (index == 1) {
                        model.tappedIcon(lpState.addpodcasts);
                      }
                      if (index == 2) {
                        model.tappedIcon(lpState.player);
                      }
                    },
                    labelType: NavigationRailLabelType.selected,
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
                      color: Colors.black,
                      fontSize: 13,
                      letterSpacing: 0.8,
                    ),
                    destinations: [
                      buildRailDestination(
                        "subs",
                        Icons.rss_feed,
                      ),
                      buildRailDestination(
                        "search",
                        Icons.explore,
                      ),
                      buildRailDestination(
                        "player",
                        Icons.music_note,
                      ),
                    ],
                  ),
                  VerticalDivider(),
                  // This is the main content.
                  ContentSpace(_content),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

NavigationRailDestination buildRailDestination(
  String text,
  IconData icond,
) {
  return NavigationRailDestination(
      icon: Icon(
        icond,
      ),
      label: Text(text));
}

class ContentSpace extends StatelessWidget {
  final lpState content;

  ContentSpace(this.content);

  @override
  Widget build(BuildContext context) {
    if (content == lpState.subscriptions) {
      return Expanded(
        child: SubscriptionsPageView(),
      );
    }

    if (content == lpState.addpodcasts) {
      return Expanded(
        child: AddPodcasts(),
      );
    }
    if (content == lpState.player) {
      return Expanded(
        child: Player(),
      );
    } else {
      return Expanded(
        child: Container(
          child: Center(
            child: Text("SOme bad state this is dawg! How did I end up here?" +
                content.toString()),
          ),
        ),
      );
    }
  }
}
