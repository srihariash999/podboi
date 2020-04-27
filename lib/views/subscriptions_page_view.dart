import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:podboi/models/subscriptions_page_model.dart';
import 'package:podboi/service_locator.dart';
import 'package:podboi/views/add_podcast_page_view.dart';
import 'package:podboi/views/player_page_view.dart';

import 'package:scoped_model/scoped_model.dart';

class SubscriptionsPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<SubscriptionsPageModel>(
        model: locator<SubscriptionsPageModel>(),
        child: Scaffold(
          backgroundColor: Colors.white,
          // appBar: AppBar(
          //   leading: IconButton(
          //     icon: Icon(Icons.menu),
          //     onPressed: () {},
          //     color: Colors.white,
          //   ),
          //   backgroundColor: Colors.black,
          //   title: Text("podboi"),
          // ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: Colors.lightGreen,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: 60.0,
                          child: Center(
                            child: Text(
                              "podboi",
                              style: GoogleFonts.monoton(
                                textStyle: TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          //padding: EdgeInsets.only(left: 20.0),
                        ),
                        SizedBox(
                          width: 25.0,
                        ),
                        Container(
                          height: 60.0,
                          child: RaisedButton(
                            elevation: 9.0,
                            color: Colors.lightBlueAccent,
                            shape: CircleBorder(),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AddPodcasts(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset("assets/podcast.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Your Subscriptions",
                      style: GoogleFonts.specialElite(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0)),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.grey,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      height: 280,
                      child: ScopedModelDescendant<SubscriptionsPageModel>(
                        builder: (context, child, model) {
                          String _imageLoadingState =
                              model.getImageLoadingState();
                          if (_imageLoadingState == "notLoaded") {
                            model.startLoadingImages();
                          }
                          return GridView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.all(10.0),
                            itemCount: model.requestLength(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 5.0,
                                    crossAxisSpacing: 5.0,
                                    crossAxisCount: 3),
                            itemBuilder: (BuildContext context, int index) {
                              //TODO:  Wrap the box with a gesture detector and add the onTap fucntionality
                              return GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Player(
                                      trackNumber: index,
                                    ),
                                  ),
                                ),
                                child: DottedBorder(
                                  strokeWidth: 1,
                                  strokeCap: StrokeCap.round,
                                  dashPattern: [6, 3, 2, 3],
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(20.0),
                                  child: _imageLoadingState == "loading" ||
                                          _imageLoadingState == "notLoaded"
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Center(
                                            child: Text(
                                              "loading..",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.network(
                                            model.requestCoverArt(index),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "New Releases",
                      style: GoogleFonts.specialElite(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.grey,
                  // ),
                  ScopedModelDescendant<SubscriptionsPageModel>(
                    builder: (context, child, model) {
                      String _imageLoadingState = model.getImageLoadingState();
                      if (_imageLoadingState == "notLoaded") {
                        model.startLoadingImages();
                      }
                      //TODO: Extract the widget tree this descendent is returning and keep it as a separate widget in /widgets folder
                      return Container(
                        height: 250,
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                                child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: _imageLoadingState ==
                                                      "loading" ||
                                                  _imageLoadingState ==
                                                      "notLoaded"
                                              ? Container(
                                                  child: Center(
                                                    child: Text("Loading..."),
                                                  ),
                                                )
                                              : Image.network(
                                                  model.requestCoverArt(index),
                                                  fit: BoxFit.scaleDown,
                                                ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(
                                                model.requestPodcastName(index),
                                                style: GoogleFonts.specialElite(
                                                  textStyle: TextStyle(
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ),
                                              subtitle: Text(
                                                model
                                                    .requestUploadedTime(index),
                                                style:
                                                    GoogleFonts.indieFlower(),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      model.requestEpisodeName(index),
                                      style: GoogleFonts.specialElite(
                                        textStyle: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                    subtitle: Text(
                                      model.requestEpisodeLength(index),
                                      style: GoogleFonts.indieFlower(
                                        textStyle: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.play_circle_filled,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.playlist_add,
                                          color: Colors.blue,
                                        ),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.file_download,
                                          color: Colors.green,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ));
                          },
                          itemCount: model.requestLength(),
                          viewportFraction: 0.7,
                          scale: 0.8,
                        ),
                      );
                    },
                  ),
                  Container(
                    height: 200,
                    child: Center(
                      child: IconButton(icon: Icon(Icons.delete), onPressed: ()
                      {
                        var box = Hive.box('subscriptionsBox');
                        for(int i=0; i<box.length; i++)
                        {
                          box.deleteAt(i);
                          print('deleted item at $i');
                        }
                        
                      }
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
