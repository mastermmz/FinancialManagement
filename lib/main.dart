import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modiriyatmali/UI/startScreen.dart';
import 'Models/moneyBlock.dart';
import 'UI/mainScreen.dart';

void main() {
  runApp(BlocProvider<KeshavarziBloc>(
      create: (context)=>KeshavarziBloc(),
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // home: const MainScreen(number: 0),
      home: const StartScreen(),
    );
  }
}
