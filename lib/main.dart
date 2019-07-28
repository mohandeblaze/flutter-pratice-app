import 'package:flutter/material.dart';
import 'package:pratice_app/models/ImgurResponse.dart';
import 'package:pratice_app/utils/imgurapi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blaze for Imgur',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Blaze for Imgur'),
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
  Future<ImgurResponse> imgurResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imgurResponse = getMostPopular();
  }

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder<ImgurResponse>(
          future: imgurResponse,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("Data recieved");
              return ListView.builder(
                itemCount: snapshot.data.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return getPostCard(snapshot.data.data[index], context);
                },
              );
            } else if (snapshot.hasError) {
              print("API Error!");
            }

            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
