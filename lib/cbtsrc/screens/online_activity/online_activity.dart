import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../../../sfa_app.dart';
class OnlineActivity extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'PressStart',
      ),
      home: ColorGame(),
    );
  }
}

class ColorGame extends StatefulWidget {
  ColorGame() : super();

  createState() => ColorGameState();
}

class ColorGameState extends State<ColorGame> {
  /// Map to keep track of score
  final Map<String, bool> score = {};

  /// Choices for game
  final Map choices = {
    '🍏': Colors.green,
    '🍋': Colors.yellow,
    '🍅': Colors.red,
    '🍇': Colors.purple,
    '🥥': Colors.brown,
    '🥕': Colors.orange
  };

  // Random seed to shuffle order of items.
  int seed = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Score ${score.length} / 6'),
          backgroundColor: Colors.pink),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            score.clear();
            seed++;
          });
        },
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: choices.keys.map((emoji) {
                  return Expanded(
                    child: Draggable<String>(
                      data: emoji,
                      child: Emoji(emoji: score[emoji] == true ? '✅' : emoji, key: SfaApp.keyGlobal,),
                      feedback: Emoji(emoji: emoji, key: SfaApp.keyGlobal,),
                      childWhenDragging: Emoji(emoji: '🌱', key:SfaApp.keyGlobal,),
                    ),
                  );
                }).toList()),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: choices.keys.map((emoji) => Expanded(child: _buildDragTarget(emoji))).toList()
                    ..shuffle(Random(seed)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget(builder: (BuildContext context,List<dynamic> incoming,List rejected){
      return score[emoji]==true?Expanded(
        child: Container(
          color: Colors.white,
                  child: Text('Correct!'),
                  alignment: Alignment.center,
                  height: 80,
                  width: 200,
        ),
      ): Expanded(child: Container(color: choices[emoji], height: 80, width: 200));
    },onWillAccept: (data)=>data==emoji,onAccept: (data){
    setState(() {
          score[emoji] = true;
          // plyr.play('success.mp3');
        });
    },onLeave: (data){},);
    // return DragTarget<String>(
    //   builder: (BuildContext context, List<String> incoming, List rejected) {
    //     if (score[emoji] == true) {
    //       return Container(
    //         color: Colors.white,
    //         child: Text('Correct!'),
    //         alignment: Alignment.center,
    //         height: 80,
    //         width: 200,
    //       );
    //     } else {
    //       return Container(color: choices[emoji], height: 80, width: 200);
    //     }
    //   },
    //   onWillAccept: (data) => data == emoji,
    //   onAccept: (data) {
    //     setState(() {
    //       score[emoji] = true;
    //       plyr.play('success.mp3');
    //     });
    //   },
    //   onLeave: (data) {},
    // );
  }
}

class Emoji extends StatelessWidget {
  Emoji({required Key key, required this.emoji}) : super(key: key);

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        padding: EdgeInsets.all(10),
        child: Text(
          emoji,
          style: TextStyle(color: Colors.black, fontSize: 50),
        ),
      ),
    );
  }
}

AudioCache plyr = AudioCache();