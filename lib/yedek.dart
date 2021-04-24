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

  play() async{
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

  durum(){
    player.onPlayerStateChanged.listen((AudioPlayerState s) => {
    print('Current player state: $s');
        setState(() => playerState = s)
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
                onPressed: stop,
                child: Text('Stop')
            ),
            ElevatedButton(
                onPressed: stop,
                child: Text('Stop')
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



StreamController _streamController=StreamController();

void streamYayin() async{
  for(int i=0; i<10; i++){
    if(i==6){_streamController.addError('bir hata oluştu');}
    await Future.delayed(Duration(seconds: 1));
    _streamController.sink.add(i+1);
  }
  _streamController.close();
}

streamYayin();
_streamController.stream.listen((event){
print(event*10);
},
onDone: (){
print('Stream listem içerisinde onDone fonksiyonu çalıştı');
},
onError: (error){
print(error);
},
cancelOnError: true
);
