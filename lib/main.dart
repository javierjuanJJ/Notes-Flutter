import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      primarySwatch: Colors.blue,
    ),
    home: HomePage(),
  ));
}



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Column(children: [
        TextField(
          controller: _email,
          decoration: const InputDecoration(
            hintText: 'Enter your email here'
          ),
        ),
        TextField(
          controller: _password,
          decoration: const InputDecoration(
              hintText: 'Enter your password here'
          ),
        ),
        TextButton(onPressed: () async {
          final email = _email.text;
          final password = _password.text;

          final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: email,
              password: password
          );

          print(userCredential);

        }, child: const Text('Register'),
        )]
      ) ,
    );
  }

}
