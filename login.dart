// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key:key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  String textUsername = "";
  String textPassword = "";
  String username = "Winda Adrianti";
  String password = "password";

  void checkLogin(){
    if(textUsername == "" || textPassword == ""){
      Fluttertoast.showToast(
        msg: "Username dan password kosong. Mohon untuk mengisi pada kolom username dan password!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        fontSize: 16.0
      );
      // return;
    }

    else if(textUsername != username || textPassword != password){
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            title: Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.maxFinite,
                decoration: BoxDecoration (
                   color: Colors.orange,
                   borderRadius: BorderRadius.circular(4)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget> [
                    Icon(
                      FontAwesomeIcons.triangleExclamation,
                      color: Colors.white,
                    ),
                    Text(
                      "  Login Failed",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ]
                )
              )
            ), 
            content: Stack(
              // alignment: Alignment.center,
              children: <Widget>[
                Container(
                ),
                const Text('Username atau Password salah. \nSilahkan isi kembali!'),
              ]
            ),
            actions: <Widget>[
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: FittedBox(
                  // constraints: const BoxConstraints(maxWidth: fit),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration (
                      color: const Color.fromARGB(255, 212, 102, 12),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const <Widget>[
                        Icon(
                          FontAwesomeIcons.xmark,
                          color: Colors.white,
                        ),
                        Text(
                          '  Close',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ) 
              )
            ],
          );
        } 
      );
    }

    else if(textUsername == username && textPassword == password){
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            title: Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.maxFinite,
                decoration: BoxDecoration (
                   color: Colors.orange,
                   borderRadius: BorderRadius.circular(4)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget> [
                    Icon(
                      FontAwesomeIcons.circleCheck,
                      color: Colors.white,
                    ),
                    Text(
                      "  Login Successfully!",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ]
                )
              )
            ), 
            content: Stack(
              // alignment: Alignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text('Selamat datang $username! \nKlik tombol continue untuk melanjutkan!'),
                )
              ]
            ),
            actions: <Widget>[
              TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/profile');
                },
                child: FittedBox(
                  // constraints: const BoxConstraints(maxWidth: fit),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration (
                      color: const Color.fromARGB(255, 212, 102, 12),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const <Widget>[
                        Icon(
                          FontAwesomeIcons.arrowRight,
                          color: Colors.white,
                        ),
                        Text(
                          '  Continue',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ) 
              )
            ],
          );
        } 
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Align(
      //     alignment: Alignment.center, child: Text("Login Page"),
      //   )
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(15),
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
                ),  
              )
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              // Icon(FontAwesomeIcons.cartPlus),
              child: TextField(
                onChanged: (x) => textUsername = x,
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                )  
              )
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                onChanged: (y) => textPassword = y,
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                )
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              padding: const EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Raleway',
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: InkWell(
                onTap: () {
                  checkLogin();
                },
                child: Container(
                  padding: const EdgeInsets.all(0.0),
                  height: 60.0,//MediaQuery.of(context).size.width * .08,
                  width: 220.0,//MediaQuery.of(context).size.width * .3,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 212, 102, 12),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 233, 233, 233),
                        blurRadius: 4,
                        offset: Offset(8, 8)
                      )
                    ]
                  ),
                  child: Row(
                    children: <Widget>[
                      const Expanded(
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      LayoutBuilder(builder: (context, constraints) {
                        print(constraints);
                        return Container(
                          height: constraints.maxHeight,
                          width: constraints.maxHeight,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(10)
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_circle_right,
                            color: Color.fromARGB(255, 212, 102, 12),
                          ),
                        );
                      }),
                    ]
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Belum Punya akun? ",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Raleway',
                    ),
                  ),
                  TextButton(
                    onPressed:(){

                    },
                    child: const Text(
                      'Daftar sekarang',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  )
                ],
              ) 
            ),
            Container(
              alignment: Alignment.center,
            )
          ]
        )
      )
    );
  }
}