
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

void main() {
  runApp(MyApp());
}
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Login Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   bool _showPass = false;
//   String _errorUser = "";
//   String _errorPass = "";
//   bool _userInvalid = false;
//   bool _passInvalid = false;
//   TextEditingController _txtUser = new TextEditingController();
//   TextEditingController _txtPass = new TextEditingController();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Container(
//         constraints: BoxConstraints.expand(),
//         //padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Column(
//               children: [
//                 Container(
//                   //padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
//                   child: Icon(
//                     Icons.account_circle,
//                     color: Colors.blue,
//                     size: 36.0,
//                   ),
//                 ),
//                 Text(
//                   "Login",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.orange,
//                       fontSize: 20),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(40.0),
//               child: Column(
//                 children: [
//                   TextField(
//                     controller: _txtUser,
//                     decoration: InputDecoration(
//                       labelText: "Username",
//                       errorText: _userInvalid ? _errorUser : null,
//                       labelStyle: TextStyle(color: Colors.black12),
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.orange),
//                       ),
//                       enabledBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey),
//                         //  when the TextFormField in unfocused
//                       ),
//                     ),
//                   ),
//                   Stack(
//                     alignment: AlignmentDirectional.centerEnd,
//                     children: <Widget>[
//                       TextField(
//                         controller: _txtPass,
//                         decoration: InputDecoration(
//                           labelText: "Password",
//                           errorText: _passInvalid ? _errorPass : null,
//                           labelStyle: TextStyle(color: Colors.black12),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.orange),
//                           ),
//                           enabledBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.grey),
//                             //  when the TextFormField in unfocused
//                           ),
//                         ),
//                         obscureText: !_showPass,
//                       ),
//                       GestureDetector(
//                         onTap: onToggleShowPass,
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
//                           child: Text(
//                             _showPass ? 'Hide' : 'Show',
//                             style: TextStyle(color: Colors.blue),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
//                     child: Stack(
//                       alignment: AlignmentDirectional.centerEnd,
//                       children: <Widget>[
//                         SizedBox(
//                           width: double.infinity,
//                           child: RaisedButton(
//                             onPressed: onSignInClicked,
//                             color: Colors.orange,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.all(Radius.circular(5))
//                             ),
//                             child: Text(
//                               "Sign in",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
//                     child: Container(
//                       width: double.infinity,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Text('Sign up', style: TextStyle(color: Colors.grey)),
//                           Text('Forgot password?', style: TextStyle(color: Colors.orange))
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   void onSignInClicked(){
//     setState(() {
//       if(_txtUser.text.length < 3){
//         _userInvalid = true;
//         _errorUser = "Username must be at least 3 characters";
//       } else
//         _userInvalid = false;
//       if(_txtPass.text.length < 6 || _txtPass.text.contains(" ")){
//         _passInvalid = true;
//         _errorPass = "Password must be at least 6 characters";
//       } else
//         _passInvalid = false;
//
//       if(!_userInvalid && !_passInvalid){
//         Navigator.push(context, MaterialPageRoute(builder: (context) => MyHome()));
//       }
//     });
//   }
//   void onToggleShowPass(){
//     setState(() {
//       _showPass = !_showPass;
//     });
//   }
// }
