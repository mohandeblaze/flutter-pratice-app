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
  ImgurResponse imgurResponse;
  int page = 0;

  ScrollController _listviewController;

  @override
  void initState() {
    super.initState();

    getMostPopular(page).then((data) {
      page++;
      print(data.success);
      setState(() {
        imgurResponse = data;
      });
    });

    _listviewController = ScrollController();
    _listviewController.addListener(() {
      if (_listviewController.position.pixels ==
          _listviewController.position.maxScrollExtent) {
        print("requesting page $page now");
        _loadMore();
      }
    });
  }

  void _incrementCounter() {
    _listviewController.animateTo(_listviewController.position.maxScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
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
        child: ListView.builder(
          controller: _listviewController,
          itemCount: isNull(imgurResponse) ? 0 : imgurResponse.data.length,
          itemBuilder: (BuildContext context, int index) {
            return ImgurItemWidget(
              UniqueKey(),
              imgurResponse.data[index],
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

  void _loadMore() {
    getMostPopular(page).then((data) {
      page++;
      setState(() {
        imgurResponse.data.addAll(data.data);
      });
    });
  }
}
