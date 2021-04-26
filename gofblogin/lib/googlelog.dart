import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GooLog extends StatefulWidget {
  @override
  _GooLogState createState() => _GooLogState();
}

class _GooLogState extends State<GooLog> {
  @override
  bool _isLoggedIn = false;
  GoogleSignInAccount _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: _isLoggedIn
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(_userObj.photoUrl),
                    Text(_userObj.displayName),
                    Text(_userObj.email),
                    ElevatedButton(
                        onPressed: () {
                          _googleSignIn.signOut().then((value) {
                            setState(() {
                              _isLoggedIn = false;
                            });
                          }).catchError((e) {});
                        },
                        child: Text("Logout"))
                  ],
                )
              : Center(
                  child: ElevatedButton(
                    child: Text("Login with Google"),
                    onPressed: () {
                      _googleSignIn.signIn().then((userData) {
                        setState(() {
                          _isLoggedIn = true;
                          _userObj = userData;
                        });
                      }).catchError((e) {
                        print(e);
                      });
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
