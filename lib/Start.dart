import 'package:flutter/material.dart';
import 'package:rentals/login.dart';
import 'package:rentals/SignUp.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  navigateToLogin() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  navigateToRegister() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 35.0),
            Container(
              child: Image(
                  image: AssetImage("images/start.jpg"),
                  width: 800,
                  fit: BoxFit.contain),
            ),
            SizedBox(height: 20.0),
            RichText(
                text: TextSpan(
                    text: 'Welcome to ',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                  TextSpan(
                      text: 'Rentals',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue))
                ])),
            SizedBox(height: 10.0),
            Text(
              'Select your home at your hand!!',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 35.0),
            // Row(
            //   children: <Widget>[
            //     RaisedButton(
            //         padding: EdgeInsets.only(left: 30, right: 30),
            //         onPressed: () {},
            //         child: Text(
            //           'Login',
            //           style: TextStyle(
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold,
            //               color: Colors.white),
            //         ),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),
            //         color: Colors.orange),
            //     SizedBox(width: 20.0),
            //     RaisedButton(
            //         padding: EdgeInsets.only(left: 30, right: 30),
            //         onPressed: () {},
            //         child: Text(
            //           'Register',
            //           style: TextStyle(
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold,
            //               color: Colors.white),
            //         ),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),
            //         color: Colors.orange),
            //   ],
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: new ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      onPressed: navigateToLogin,
                      child: new Text(
                        "Login",
                        style: new TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue),
                  new RaisedButton(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      onPressed: navigateToRegister,
                      child: new Text(
                        "register",
                        style: new TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue),
                ],
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
