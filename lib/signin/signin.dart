// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidation_bloc/signin/Bloc/signin_bloc.dart';
import 'package:formvalidation_bloc/signin/Bloc/signin_event.dart';
import 'package:formvalidation_bloc/signin/Bloc/signin_state.dart';

class Signin extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  Signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          SizedBox(
            height: 10,
          ),
          BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              if (state is SignInErrorState) {
                return Text(
                  "The error will show up here",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: emailController,
            onChanged: (val) {
              BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(
                  emailValue: emailController.text,
                  passwordValue: PasswordController.text));
            },
            decoration: InputDecoration(hintText: "Email Address"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: PasswordController,
            onChanged: (val) {
              BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(
                  emailValue: emailController.text,
                  passwordValue: PasswordController.text));
            },
            decoration: InputDecoration(
              hintText: "Password",
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 10,
          ),
          BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              return CupertinoButton(
                child: Text("Sign In"),
                onPressed: () {},
                color: (state is SignInValidState) ? Colors.blue : Colors.red,
              );
            },
          )
        ],
      ),
    );
  }
}
