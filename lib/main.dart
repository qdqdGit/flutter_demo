import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation',
      home: Homes(),
      theme: ThemeData(primaryColor: Colors.orange),
    );
  }
}

class Homes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomesState();
  }
}
class _HomesState extends State<Homes> {
  int _currentIndex = 0;
  final List<BottomNavigationBarItem> _list = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
      //backgroundColor: Colors.orange
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.book),
      title: Text('Book'),
      //backgroundColor: Colors.orange
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.music_video),
      title: Text('Music'),
      //backgroundColor: Colors.orange
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.movie),
      title: Text('Movie'),
      //backgroundColor: Colors.orange
    ),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation'),
      ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: _list,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
        ),
        body: Text("底部导航演示:"+_currentIndex.toString())
    );
  }

  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}