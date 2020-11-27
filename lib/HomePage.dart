import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rentals/Start.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   FirebaseUser user;
//   bool isloggedin = false;

//   checkAuthentification() async {
//     _auth.onAuthStateChanged.listen((user) {
//       if (user == null) {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => Start()));
//       }
//     });
//   }

//   signOut() async {
//     _auth.signOut();
//   }

//   getUser() async {
//     FirebaseUser firebaseUser = await _auth.currentUser;
//     await firebaseUser?.reload();
//     firebaseUser = await _auth.currentUser;

//     if (firebaseUser != null) {
//       setState(() {
//         this.user = firebaseUser;
//         isloggedin = true;
//       });
//     }
//   }

//   @override
//   void initState() {
//     this.checkAuthentification();
//     this.getUser();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       child: !isloggedin
//           ? CircularProgressIndicator()
//           : Column(
//               children: <Widget>[
//                 SizedBox(height: 40.0),
//                 Container(
//                   height: 300,
//                   child: Image(
//                     image: AssetImage("images/welcome.jpg"),
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 Container(
//                   child: Text(
//                     "Hello ${user.displayName} you are Logged in as ${user.email}",
//                     style:
//                         TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 RaisedButton(
//                   padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
//                   onPressed: signOut,
//                   child: Text('Signout',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold)),
//                   color: Colors.orange,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                 )
//               ],
//             ),
//     ));
//   }
// }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Start()));
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        print(user);
        this.isloggedin = true;
        print(isloggedin);
      });
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Start()));
  }

  @override
  void initState() {
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: !isloggedin
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: <Widget>[
                SizedBox(height: 40.0),
                Container(
                  height: 300,
                  child: Image(
                    image: AssetImage("images/welcome.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  child: Text(
                    "Hello ${user.displayName} you are Logged in as ${user.email}",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                  onPressed: signOut,
                  child: Text('Signout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )
              ],
            ),
    ));
  }
}
