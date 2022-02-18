import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidation_bloc/signin/Bloc/signin_bloc.dart';
import 'package:formvalidation_bloc/signin/signin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(),
        body: BlocProvider(
          create: (context) => SignInBloc(),
          child: Signin(),
        ),
      ),
    );
  }
}
