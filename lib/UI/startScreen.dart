import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modiriyatmali/Models/moneyBlock.dart';
import 'package:modiriyatmali/UI/mainScreen.dart';
import 'package:modiriyatmali/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../backend/SmsRead.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setting();
  }

  Future<void> setting() async {
    SharedPreferences par = await SharedPreferences.getInstance();
    bool? firstTimeCheck = par.getBool("first");
    print(par.getBool("first"));
    if(firstTimeCheck == null){
      print("sdsd");
      await par.setBool("first", false);
      await par.setInt("KESHAVARZI", 0);
      await par.setInt("lastID", 0);
      ferstReadSms(context);
    }else{
      int? number = par.getInt("KESHAVARZI");
      BlocProvider.of<KeshavarziBloc>(context).add(SetNumber(setMony: number!));
      //todo: set money to number
    }
    timer();
  }

  Future<void> timer() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MainScreen(number: 0);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Text(
              "start" ,
              style: TextStyle(
                fontSize: 55
              ),
            ),
          ),
        )
    );
  }
}
