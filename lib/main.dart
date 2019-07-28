import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:pratice_app/models/ImgurResponse.dart';
import 'package:pratice_app/utils/imgurapi.dart';
import 'package:pratice_app/widgets/post.dart';

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

  ScrollController _listviewController;

  @override
  void initState() {
    super.initState();

    imgurResponse = getMostPopular();

    getMostPopular().then((data) {
      print(data.success);
      print("success");
      setState(() {

      });
    });

    _listviewController = ScrollController();
    _listviewController.addListener(() {
      if (_listviewController.position.pixels ==
          _listviewController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  void _incrementCounter() {
    setState(() {});
  }

  @override
  void dispose() {
    _listviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller: _listviewController,
                itemBuilder: (BuildContext context, int index) {
                  return ImgurItemWidget(
                    UniqueKey(),
                    snapshot.data.data[index],
                  );
                },
              );
            } else if (snapshot.hasError) {
              print("API Error!");
            }

            return Center(
              child: CircularProgressIndicator(),
            );
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

  void _loadMore() async {
    ImgurResponse response = await getMostPopular(1);

    setState(() {
      print('loading more,...');
      //if we're at the end of the list, add more items
    });
  }
}
