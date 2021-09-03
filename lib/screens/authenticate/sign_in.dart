import 'package:flutter/material.dart';
import 'package:pruebauno/Animation/FadeAnimation.dart';
import 'package:pruebauno/services/auth.dart';
import 'package:pruebauno/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo[500],
        elevation: 0.0,
        title: Text('Sign in to Trip Mapper'),
        actions: <Widget>[
          // ignore: deprecated_member_use
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white),
            label: Text('Register', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            onPressed: () {
              widget.toggleView();
            }
          )
        ],
      ),
      body: SingleChildScrollView(
        //padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill
                  )
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 10,
	                    width: 80,
	                    height: 200,
	                    child: FadeAnimation(1, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/light-1.png')
	                        )
	                      ),
	                    ),
                    )),
                    Positioned(
	                    left: 140,
	                    width: 80,
	                    height: 150,
	                    child: FadeAnimation(1.3, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/light-2.png')
	                        )
	                      ),
	                    ),
                    )),
                    Positioned(
	                    right: 40,
	                    top: 40,
	                    width: 80,
	                    height: 150,
	                    child: FadeAnimation(1.5, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/clock.png')
	                        )
	                      ),
	                    ),
                    )),
                    Positioned(
	                    child: FadeAnimation(1.6, Container(
	                      margin: EdgeInsets.only(top: 50),
	                      child: Center(
	                        child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
	                      ),
                      )),
	                  )
                  ],
                ),
              ),
              Padding(
	              padding: EdgeInsets.all(30.0),
	              child: Column(
	                children: <Widget>[
	                  FadeAnimation(1.8, Container(
	                    padding: EdgeInsets.all(5),
	                    decoration: BoxDecoration(
	                      color: Colors.white,
	                      borderRadius: BorderRadius.circular(10),
	                      boxShadow: [
	                        BoxShadow(
	                          color: Color.fromRGBO(143, 148, 251, .2),
	                          blurRadius: 20.0,
	                          offset: Offset(0, 10)
	                        )
	                      ]
	                    ),
	                    child: Column(
	                      children: <Widget>[
	                        Container(
	                          padding: EdgeInsets.all(8.0),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                          ),
	                          child: TextFormField(
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Email or Phone number",
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0)
                                ),
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
                              validator: (val) => val.isEmpty ? 'Enter an email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
	                          ),
	                        ),
	                        Container(
	                          padding: EdgeInsets.all(8.0),
	                          child: TextFormField(
                              obscureText: true,
                              validator: (val) => val.length < 6 ? 'Enter an password 6+ chars long' : null,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Password",
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0)
                                ),
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
                              onChanged: (val) {
                                setState(() => password = val);
                              },
	                          ),
	                        )
	                      ],
	                    ),
	                  )),
	                  SizedBox(height: 30,),
                    FadeAnimation(2, Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            // ignore: deprecated_member_use
                            RaisedButton(
                              child: Center(
                                child: Text('Sign in', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              ),
                              color: Color.fromRGBO(143, 148, 251, .9),
                              onPressed: () async {
                                if (_formkey.currentState.validate()){
                                  setState(() => loading = true); 
                                  dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                  if(result == null) {
                                    setState(() {
                                      error = 'COULD NOT SIGN IN WITH THOSE CEDENTAILS';
                                      loading = false;
                                    });
                                  }
                                }
                              },
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              error,
                              style: TextStyle(color: Colors.red, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                    )),
	                  SizedBox(height: 60,),
	                  FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
	                ],
	              ),
	            ),
            ],
          ),
        )
      ),
    );
  }
}