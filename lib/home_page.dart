import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int _currentIndex = 0;
  final tabs = [
    Center(child: Text("Home"),),
    Center(child: Text("Search"),),
    Center(child: Text("Favorite"),),
    Center(child: Text("Camera"),),
    Center(child: Text("Profile"),),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(

        title: Text("Navigation Bar"),
        centerTitle: true,
        actions:[Padding(
          padding: const EdgeInsets.only(right:0),
          child: MaterialButton(
            onPressed: (){
              Navigator.pushNamed(context,"login");
            },
            child: Icon(Icons.archive_outlined,
              color: Colors.white,

            ),

          ),
        ),
    ]
      ),




      body: tabs[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        // type: BottomNavigationBarType.fixed,

        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.black,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
            backgroundColor: Colors.black,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
            backgroundColor: Colors.black,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: "Camera",
            backgroundColor: Colors.black,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Colors.black,
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },

      ),



      drawer: Drawer(
      ),

    );
  }


}


