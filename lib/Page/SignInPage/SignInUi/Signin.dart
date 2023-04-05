import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/Page/SignInPage/SignInBloc/bloc/sign_in_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("SIGN IN")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                if (state is SignInErrorState)
                  return Text(
                    state.errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  );
                else
                  return Container();
              }),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: "Enter email"),
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangedEvent(
                          emailValue: emailController.text.toString(),
                          passwordValue: passwordController.text.toString()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangedEvent(
                          emailValue: emailController.text.toString(),
                          passwordValue: passwordController.text.toString()));
                },
                decoration:
                    InputDecoration(hintText: "Enter Password(length>=5)"),
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoadingState)
                    return Center(child: CircularProgressIndicator());
                  return Container(
                    height: 40,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInSubmittedEvent(
                                email: emailController.text,
                                password: passwordController.text));
                      },
                      child: Text("SignIn"),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              state is SignInValidState
                                  ? Colors.blue
                                  : Colors.grey.shade600)),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
