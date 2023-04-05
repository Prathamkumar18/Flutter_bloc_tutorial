import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/Blocks/bloc/internet_bloc.dart';
import 'package:state_management/Page/SignInPage/SignInBloc/bloc/sign_in_bloc.dart';
import 'package:state_management/Page/SignInPage/SignInUi/Signin.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: BlocBuilder<InternetBloc, InternetState>(
//         builder: (context, state) {
//           if (state is InternetGainedState)
//             return Text("Connected");
//           else if (state is InternetLostState)
//             return Text("Not Connected");
//           else
//             return Text("Loading..");
//         },
//       )),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(child: BlocListener<InternetBloc, InternetState>(
//       listener: (context, state) {
//         if (state is InternetGainedState) {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text("Connected")));
//         } else if (state is InternetLostState) {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text("Not Connected")));
//         } else {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text("Connected")));
//         }
//       },
//       child: Text("hello"),
//     )));
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: BlocConsumer<InternetBloc, InternetState>(
            builder: (context, state) {
              if (state is InternetGainedState)
                return Text("Connected");
              else if (state is InternetLostState)
                return Text("Not Connected");
              else
                return Text("Loading..");
            },
            listener: (context, state) {
              if (state is InternetGainedState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Connected")));
              } else if (state is InternetLostState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Not Connected")));
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Connected")));
              }
            },
          )),
          SizedBox(
            height: 200,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => SignInBloc(),
                              child: SignInPage(),
                            )));
              },
              child: Text("SignIn")),
        ],
      ),
    );
  }
}
