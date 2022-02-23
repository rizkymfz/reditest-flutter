import 'package:flutter/material.dart';
import 'package:reditest_flutter/Quiz3/ChatScreen.dart';
import 'package:reditest_flutter/Quiz3/HomeScreens.dart';
import 'package:reditest_flutter/Quiz3/Models/login_request_model.dart';
import 'package:reditest_flutter/Quiz3/services/services.dart';
import 'MainApp.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isAPICallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String username;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 40),
              child: Text(
                "Redilabs",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                "https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png",
                height: 100,
                width: 100,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Username "),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Password"),
              ),
            ),
            // FlatButton(
            //   onPressed:(){

            //   },
            //   textColor: Colors.blue,
            //   child: Text("Forgot Password"),
            // ),
            // TextButton(onPressed: () {}, child: Text("Forgot Password")),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                // textColor: Colors.white,
                style: raisedButtonStyle,
                child: Text("Login"),
                onPressed: () {
                  LoginRequestModel model = LoginRequestModel(
                      username: usernameController.text,
                      password: passwordController.text);

                  APIService.login(model).then((response) {
                    if (response.status == 200) {
                      print('haha');
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (route) => false);
                    } else {
                      print(response);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("invalid username or password"),
                      ));
                    }
                  });
                  // }
                  // Navigator.push(
                  //   context,
                  //   new MaterialPageRoute(
                  //     builder: (context) => new ChatScreen(),
                  //   ),
                  // );
                  // print(nameController.text);
                  // print(passwordController.text);
                  //<!-- //? #Soal No. 1 (15poin) -- LoginScreen.dart -- Function LoginScreen
                  //? Buatlah sebuah fungsi untuk berpindah halaman di button login apabila di press akan ke halaman HomeScreen.dart
                  // Soal 1 Tuliskan Coding disini
                  //
                  //  End Coding
                },
              ),
            ),

            Container(
                child: Row(children: <Widget>[
              Text("   Does not have account?"),
              TextButton(
                  // textColor: Colors.blue,
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/register");
                  })
            ]))
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.grey[300],
  primary: Colors.blue[300],
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
);
