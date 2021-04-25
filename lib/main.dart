import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  AudioPlayer audioPlayer=AudioPlayer();
  Duration duration;

  play() async{
    await audioPlayer.setUrl("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3");
    int result=await audioPlayer.play("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3");
    if(result==1){
      print('Play');
    }
  }

  stop() async{
    int result=await audioPlayer.stop();
    if(result==1){
      print('Stop');
    }
  }

  pause() async{
    int result=await audioPlayer.pause();
    if(result==1){
      print('Pause');
    }
  }

  seek() async{
    int result=await audioPlayer.seek(Duration(seconds:350));
  }

  duration1(){
    audioPlayer. onDurationChanged.listen((Duration d) {
      print('Max duration:$d');
      setState(() {
        duration=d;
      });
    });
  }

  position1(){
  audioPlayer.onAudioPositionChanged.listen((Duration p) {
    print('Current position :$p');
  });
  }

  durum(){
       audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
         print(s);
       });
       }


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: play,
                child: Text('Play')
            ),
            ElevatedButton(
                onPressed: pause,
                child: Text('Pause')
            ),
            ElevatedButton(
                onPressed: stop,
                child: Text('Stop')
            ),
            ElevatedButton(
                onPressed: seek,
                child: Text('Seek')
            ),
            ElevatedButton(
                onPressed: durum,
                child: Text('Durum')
            ),
            ElevatedButton(
                onPressed: duration1,
                child: Text('Duration Event')
            ),
            ElevatedButton(
                onPressed: position1,
                child: Text('Position Event')
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
