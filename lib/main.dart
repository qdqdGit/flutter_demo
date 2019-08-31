import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/", //名为"/的路由作为home首页
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
//      onGenerateRoute: (RouteSettings settings){
//        return MaterialPageRoute(builder: (context){
//          String routeName = settings.name;
//          print(routeName);
//        });
//      },
      routes: {
        "/":(context)=>MyHomePage(title: '装饰器演示'
            ''),//注册首页路由
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FixedExtentScrollController fixedExtentScrollController = new FixedExtentScrollController();

  final List<String> imgList = [
    'https://p0.meituan.net/deal/66516fcd8ae3975edd2f4b5f8a931ce925464.jpg.webp@180w_180h_1e_1c_1l_80q%7Cwatermark=0',
    'https://p1.meituan.net/deal/141205589b18b856b87543af52abc29e35813.jpg.webp@180w_180h_1e_1c_1l_80q%7Cwatermark=0',
    'https://p1.meituan.net/deal/bc4a2aa8ea099f18053ab1c3eac6b6ae409003.jpg.webp@180w_180h_1e_1c_1l_80q%7Cwatermark=0',
    'https://p0.meituan.net/deal/e4f7972d34b289a00ae2491c70359024128785.jpg.webp@180w_180h_1e_1c_1l_80q%7Cwatermark=0',
    'https://p1.meituan.net/deal/603250f870b1a380817b6e236f34d91e29643.jpg.webp@180w_180h_1e_1c_1l_80q%7Cwatermark=0',
    'https://p1.meituan.net/deal/dc61effc0eea3e9e7eb46ad6538406104138050.jpg.webp@180w_180h_1e_1c_1l_80q%7Cwatermark=0',
    'https://p1.meituan.net/deal/21cb8a9168c0cb1ef309f7b7a6127f3f29289.jpg.webp@180w_180h_1e_1c_1l_80q%7Cwatermark=0',
    'https://p1.meituan.net/deal/0edbee70060eb1db27b7db7853dedb8424600.jpg.webp@180w_180h_1e_1c_1l_80q%7Cwatermark=0',
    'https://p0.meituan.net/deal/0be8d6f4610dee0150b65f874192cabd47239.jpg.webp@180w_180h_1e_1c_1l_80q%7Cwatermark=0'
  ];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('本地优惠'),
        leading: IconButton(
            icon: new Icon(Icons.face),
            onPressed: (){
              print("Icons.face");
              Navigator.pop(context);
            }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.playlist_play),
            tooltip: 'tooltipl',
            onPressed: (){
              print("tooltip1");
            },
          ),
          IconButton(
            icon: Icon(Icons.playlist_add),
            tooltip: 'tooltip2',
            onPressed: (){
              print("tooltip2");
            },
          ),
          IconButton(
            icon: Icon(Icons.playlist_add_check),
            tooltip: 'tooltip3',
            onPressed: (){
              print("tooltip3");
            },
          )
        ],
      ),
      body: ListWheelScrollView(
          controller: fixedExtentScrollController,
          physics: FixedExtentScrollPhysics(),
          itemExtent: 150.0,
          children: imgList.map((img){
            return Card(
              child: Row(
                children: <Widget>[
                  Image.network(img,width: 150.0),
                  Text('文字介绍',style: TextStyle(fontSize: 20.0))
                ],
              ),
            );
          }).toList()
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
