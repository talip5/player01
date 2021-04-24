import 'dart:async';
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

  StreamController _streamController=StreamController();

  AudioPlayer audioPlayer=AudioPlayer();

  void streamYayin() async{
    for(int i=0; i<10; i++){
      // if(i==6){_streamController.addError('bir hata oluştu');}
      await Future.delayed(Duration(seconds: 1));
      _streamController.sink.add(i+1);
    }
    _streamController.close();
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
                onPressed:null,
                child: Text('Yayınla')
            ),
            ElevatedButton(
                onPressed: () {
                  streamYayin();
                  _streamController.stream.listen((event){
                    print(event*10);},
                      onDone: (){
                        print('Stream bitti');
                      },
                      cancelOnError: true
                  );},
                child: Text('Reciever')
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}





