import 'package:flutter/material.dart';
import 'package:stringbuilder/interface.dart';

void main() {
  runApp(MyApp(MockMessageStream()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final IMessageStream _messageStream;

  MyApp(this._messageStream);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Center(
            child: StreamBuilder<Message>(
              stream: _messageStream.stream(),
              builder: (BuildContext context, AsyncSnapshot<Message> snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  return Text(snapshot.data.toString());
                } else {
                  return Text('${snapshot.connectionState}');
                }
              },
            ),
          ),
        ));
  }
}
