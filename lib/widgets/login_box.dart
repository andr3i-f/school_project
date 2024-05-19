import 'package:flutter/material.dart';
import 'package:recourse/main.dart';

class LoginBox extends StatelessWidget {
  const LoginBox({
    super.key,
    required this.title,
    required this.textStyle,
    required this.appState,
    required this.fn,
  });

  final TextStyle textStyle;
  final AppState appState;
  final String title;
  final Function fn;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 300,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: textStyle),
              SizedBox(
                  width: 200,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () {
                            fn();
                          },
                          child: Text("Login")),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
