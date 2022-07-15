import 'package:flutter/material.dart';
import 'package:modiriyatmali/UI/HomeScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key,required this.number}) : super(key: key);

  final int number;

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {

  int _selectedIndex = 0;
  DateTime timepressBack = DateTime.now();

  void snakbarShow({required String msg ,required ColorShow}){
    final snackBar = SnackBar(

      backgroundColor: ColorShow,
      content: Text( msg , style: TextStyle(fontSize: 20.0 , color: Colors.white),),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  @override
  void initState() {

    super.initState();
    print(widget.number);
    _selectedIndex = widget.number;
  }


  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    // ProfileScreens(),
    // //DeleteUser(),
    // Setting(),
    //ProfileScreens(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
          child: Scaffold(
            body:  _widgetOptions.elementAt(_selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color(0xe8000000),
              unselectedItemColor: Color(0xFFF6F2F2),
              showUnselectedLabels: false,
              showSelectedLabels: false,
              iconSize: 35.0,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.green,
              onTap: _onItemTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'account',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'settings',
                ),

              ],
            ),
          )
      ),
      onWillPop: __onWillPop,
    );
  }

  Future<bool> __onWillPop() async{
    Duration chekTimePreesBack =  DateTime.now().difference(timepressBack);
    bool canExitApp = chekTimePreesBack <= Duration(seconds: 1);
    timepressBack = DateTime.now();
    if(canExitApp == true){
      return true;
    }
    if(canExitApp == false){
      snakbarShow(msg: "برای خروج دوباره دکمه بازگشت را فشار دهید" , ColorShow: Color(
          0x86ec0606));
      return false;
    }
    return false;
  }
}