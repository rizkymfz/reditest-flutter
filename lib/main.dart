import 'package:flutter/material.dart';
import 'package:reditest_flutter/Quiz3/ChatScreen.dart';
import 'package:reditest_flutter/Quiz3/HomeScreens.dart';
import 'package:reditest_flutter/Quiz3/LoginScreen.dart';
import 'package:reditest_flutter/Quiz3/registerScreen.dart';
import 'package:reditest_flutter/Quiz3/services/shared_service.dart';
// import 'package:reditest_flutter/Tugas/Tugas15/LoginScreen.dart';
// import 'package:reditest_flutter/Tugas/Tugas12/telegram.dart';
// import 'package:reditest_flutter/Tugas/Tugas14/get_data.dart';
// import 'package:reditest_flutter/Tugas/Tugas15/LoginScreen.dart';
// import 'package:reditest_flutter/Tugas/Tugas15/routes.dart';

Widget _defaultHome = LoginScreen();
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   bool _result = await SharedService.isLoggedIn();
//   if (_result) {
//     _defaultHome = ChatScreen();
//   }
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //
      routes: {
        '/': (context) => _defaultHome,
        '/home': (context) => ChatScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
