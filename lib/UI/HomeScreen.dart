import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/moneyBlock.dart';
import '../backend/SmsRead.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSms();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight,
                      //radius: 3.0,
                      colors: [Color(0xff4e9952), Color(0xff8be866) ]
                  ),
                  boxShadow: [BoxShadow(
                    color: Color(0xb2080b0c),
                    blurRadius: 5,
                    offset: Offset(3, 10), // Shadow position
                  ),],
                  borderRadius: BorderRadius.all(Radius.circular(20)) ,
                  //color: buttonColors,
                ),
                width: double.infinity,
                height: 200,
                alignment: Alignment.center,
                child: BlocBuilder<KeshavarziBloc, int>(
                  builder: (context, count) {
                    return Text('$count', style: TextStyle(
                      fontSize: 55.0
                    ));
                  },
                ),
              ),

            ],
          ),
        )
    );
  }
}

