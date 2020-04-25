
// These are old files I made when I started this project a while ago. Since then I moved to a different
// state management solution, Scoped Model. So, these files are here for any reference I might need. Will delete in future.


// import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound_player.dart';

// enum stithi { notinited, inited, stopped, playing, paused }

// class Player extends StatefulWidget {
//   Player({Key key}) : super(key: key);

//   @override
//   _PlayerState createState() => _PlayerState();
// }

// class _PlayerState extends State<Player> {
//   FlutterSoundPlayer _thePlayer;
//   IconData _bomma;
//   stithi _paristithi;

//   final fileUri =
//       "http://traffic.libsyn.com/astronomycast/AstroCast-200413.mp3?dest-id=11189";
//   @override
//   void initState() {
//     super.initState();
//     _thePlayer = FlutterSoundPlayer();
//     _paristithi = stithi.notinited;
//     _bomma = Icons.music_note;
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_paristithi == stithi.notinited) {
//       initPlayer();
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Player page"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Container(
//             child: Center(
//               child: _thePlayer.isInited
//                   ? _thePlayer.isPlaying
//                       ? Text("Enjoy music")
//                       : CircularProgressIndicator()
//                   : Text(" Press to start"),
//             ),
//           ),
//           Container(
//             child: Center(
//                 child: IconButton(
//               onPressed: () async {
//                 if (_paristithi == stithi.inited) {
//                   await _thePlayer.startPlayer(fileUri, whenFinished: () {
//                     setState(() {
//                       _paristithi = stithi.stopped;
//                       _bomma = Icons.music_note;
//                     });
//                   });
//                   print("bufferinf started");

//                   setState(() {
//                     _paristithi = stithi.playing;
//                     _bomma = Icons.pause;
//                   });
//                 } else if (_paristithi == stithi.stopped) {
//                   await _thePlayer.startPlayer(fileUri, whenFinished: () {
//                     setState(() {
//                       _paristithi = stithi.stopped;
//                       _bomma = Icons.music_note;
//                     });
//                   });
//                   print("bufferinf started");

//                   setState(() {
//                     _paristithi = stithi.playing;
//                     _bomma = Icons.pause;
//                   });
//                 } else if (_paristithi == stithi.playing) {
//                   await _thePlayer.pausePlayer();
//                   //print("I tried pausing");
//                   setState(() {
//                     _paristithi = stithi.paused;
//                     _bomma = Icons.play_arrow;
//                   });
//                 } else if (_paristithi == stithi.paused) {
//                   await _thePlayer.resumePlayer();
//                   setState(() {
//                     _paristithi = stithi.playing;
//                     _bomma = Icons.pause;
//                   });
//                 }
//               },
//               icon: Icon(_bomma),
//             )),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _thePlayer.release();
//     super.dispose();
//   }

//   void initPlayer() async {
//     await _thePlayer.initialize();
//     setState(() {
//       _paristithi = stithi.inited;
//     });
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_sound/track_player.dart';

// class Player extends StatefulWidget {
//   Player({Key key}) : super(key: key);

//   @override
//   _PlayerState createState() => _PlayerState();
// }

// class _PlayerState extends State<Player> {
//   TrackPlayer trackPlayer;

//   @override
//   void initState() {
//     super.initState();
//     trackPlayer = TrackPlayer();
//     _init();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//       ),
//       body: Container(
//         child: IconButton(
//             icon: Icon(Icons.music_note),
//             onPressed: () async {
//               await trackPlayer.startPlayerFromTrack(
//                 track,
//                 whenFinished: () {
//                   print('I hope you enjoyed listening to this song');
//                 },
//                 whenPaused: pausePlayer(),
//                 onSkipBackward: () {
//                   print('Skip backward');
//                   stopPlayer();
//                   startPlayer();
//                 },
//                 onSkipForward: () {
//                   print('Skip forward');
//                   stopPlayer();
//                   startPlayer();
//                 },
//               );
//             }),
//       ),
//     );
//   }

//   Track track = new Track(
//     trackPath:
//         "http://traffic.libsyn.com/astronomycast/AstroCast-200413.mp3?dest-id=11189", // An example audio file
//     trackTitle: "Track Title",
//     trackAuthor: "Track Author",
//     albumArtUrl:
//         "https://file-examples.com/wp-content/uploads/2017/10/file_example_PNG_1MB.png", // An example image
//   );

//   void stopPlayer() {
//     trackPlayer.stopPlayer();
//   }

//   void startPlayer() {
//     trackPlayer.stopPlayer();
//   }

//   void _init() async {
//     trackPlayer = await TrackPlayer().initialize();
//   }

//   pausePlayer() {
//     trackPlayer.pausePlayer();
//   }
// }
