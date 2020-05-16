import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:podboi/models/subscriptions_page_model.dart';
import 'package:podboi/service_locator.dart';
import 'package:podboi/views/add_podcast_page_view.dart';
import 'package:podboi/views/episodes_page_view.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'package:scoped_model/scoped_model.dart';

class SubscriptionsPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<SubscriptionsPageModel>(
      model: locator<SubscriptionsPageModel>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0.0,
        //   title: Text(
        //     "podboi",
        //     style: GoogleFonts.monoton(
        //       textStyle: TextStyle(
        //         fontSize: 32.0,
        //         color: Colors.black,
        //       ),
        //     ),
        //   ),
        //   actions: [
        //     IconButton(
        //         icon: Icon(
        //           Icons.library_add,
        //           color: Colors.black,
        //         ),
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (_) => AddPodcasts(),
        //             ),
        //           );
        //         })
        //   ],
        // ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 35.0,
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Your Subscriptions",
                  style: GoogleFonts.specialElite(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.50,
                  child: ScopedModelDescendant<SubscriptionsPageModel>(
                    builder: (context, child, model) {
                      var _state = model.getState();
                      print("subs page state is: " + _state);
                      if (_state == "init") {
                        model.initLoading();
                      }
                      int l = model.requestLength();

                      return LiquidPullToRefresh(
                        springAnimationDurationInMilliseconds: 300,
                        animSpeedFactor: 5.0,
                        color: Colors.grey,
                        backgroundColor: Colors.black,
                        showChildOpacityTransition: false,
                        onRefresh: ()async{
                          await model.initLoading();
                          print("loaded fromm front");
                        },
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.all(10.0),
                          itemCount: l ,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 5.0,
                                  crossAxisSpacing: 5.0,
                                  crossAxisCount: 3),
                          itemBuilder: (BuildContext context, int index) {
                            if (index == l) {
                             // print('building plus at index $index');
                              return Container(
                                child: IconButton(
                                    icon: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add_circle),
                                        Text("Add more")
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => AddPodcasts(),
                                        ),
                                      );
                                    }),
                              );
                            } else if (index < l) {
                             // print('building at index $index');
                              try {
                                return GestureDetector(
                                  onTap: () {
                                    // String _p = model.getTitleOnTap(index);
                                    // print("The title got was: " +_p);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => EpisodesPage(
                                                podcastIndex: index,
                                              )),
                                    );
                                  },
                                  child: DottedBorder(
                                    strokeWidth: 1,
                                    strokeCap: StrokeCap.round,
                                    dashPattern: [6, 3, 2, 3],
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(20.0),
                                    child: _state == 'loading'
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            child: Text("loading..."))
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
                              } catch (e) {
                                print(e);
                                return Container();
                              }
                            } else {
                              return Container();
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),

        //FAB I used previously to refresh the page manually. Now you can just swipe down!!


        // floatingActionButton: ScopedModelDescendant<SubscriptionsPageModel>(
        //   builder: (child, context, model) {
        //     return Container(
        //       height: 60.0,
        //       child: RaisedButton(
        //         elevation: 9.0,
        //         color: Colors.lightBlueAccent,
        //         shape: CircleBorder(),
        //         onPressed: () {
        //           model.initLoading();
        //         },
        //         child: Padding(
        //             padding: const EdgeInsets.all(12.0),
        //             child: Icon(Icons.refresh)),
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}

// Container(
//   padding: EdgeInsets.only(left: 20.0),
//   child: Text(
//     "New Releases",
//     style: GoogleFonts.specialElite(
//       textStyle: TextStyle(
//         color: Colors.black,
//         fontWeight: FontWeight.bold,
//         fontSize: 24.0,
//       ),
//     ),
//   ),
// ),
// Divider(
//   color: Colors.grey,
// ),
// ScopedModelDescendant<SubscriptionsPageModel>(
//   builder: (context, child, model) {
//     String _imageLoadingState = model.getImageLoadingState();
//     if (_imageLoadingState == "notLoaded") {
//       model.startLoadingImages();
//     }
//     //TODO: Extract the widget tree this descendent is returning and keep it as a separate widget in /widgets folder
//     return Container(
//       height: 250,
//       child: Swiper(
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//               child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 25.0),
//                   child: Row(
//                     mainAxisAlignment:
//                         MainAxisAlignment.center,
//                     crossAxisAlignment:
//                         CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: _imageLoadingState ==
//                                     "loading" ||
//                                 _imageLoadingState ==
//                                     "notLoaded"
//                             ? Container(
//                                 child: Center(
//                                   child: Text("Loading..."),
//                                 ),
//                               )
//                             : Image.network(
//                                 model.requestCoverArt(index),
//                                 fit: BoxFit.scaleDown,
//                               ),
//                       ),
//                       Expanded(
//                         flex: 3,
//                         child: Container(
//                           child: ListTile(
//                             title: Text(
//                               model.requestPodcastName(index),
//                               style: GoogleFonts.specialElite(
//                                 textStyle: TextStyle(
//                                   fontSize: 16.0,
//                                 ),
//                               ),
//                             ),
//                             subtitle: Text(
//                               model
//                                   .requestUploadedTime(index),
//                               style:
//                                   GoogleFonts.indieFlower(),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 ListTile(
//                   title: Text(
//                     model.requestEpisodeName(index),
//                     style: GoogleFonts.specialElite(
//                       textStyle: TextStyle(
//                         fontSize: 16.0,
//                       ),
//                     ),
//                   ),
//                   subtitle: Text(
//                     model.requestEpisodeLength(index),
//                     style: GoogleFonts.indieFlower(
//                       textStyle: TextStyle(
//                         fontSize: 16.0,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment:
//                       MainAxisAlignment.spaceEvenly,
//                   children: [
//                     IconButton(
//                       icon: Icon(
//                         Icons.play_circle_filled,
//                         color: Colors.black,
//                       ),
//                       onPressed: () {},
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         Icons.playlist_add,
//                         color: Colors.blue,
//                       ),
//                       onPressed: () {},
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         Icons.file_download,
//                         color: Colors.green,
//                       ),
//                       onPressed: () {},
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ));
//         },
//         itemCount: model.requestLength(),
//         viewportFraction: 0.7,
//         scale: 0.8,
//       ),
//     );
//   },
// ),
// ScopedModelDescendant<SubscriptionsPageModel>(
//   builder: (child, context, model) {
//     return Container(
//       height: 200,
//       child: Center(
//         child: IconButton(
//             icon: Icon(Icons.delete),
//             onPressed: () {
//               var box = Hive.box('subscriptionsBox');

//               print('the box1 length is ${box.length} before cleaning');
//               box.clear();
//               print('the box1 length is ${box.length} after cleaning');
//               model.initLoading();
//             }),
//       ),
//     );
//   },
// )
