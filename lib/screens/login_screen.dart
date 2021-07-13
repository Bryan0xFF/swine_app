import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/Login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    _emailFocusNode.addListener(_updateEmail);
    super.initState();
  }

  void _updateEmail() {
    if (!_emailFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _emailFocusNode.removeListener(_updateEmail);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appBar2 = AppBar(
      title: Text(
        'Swine App',
        style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
      ),
      backgroundColor: Theme.of(context).appBarTheme.color,
    );
    return Scaffold(
      appBar: appBar2,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: appBar2.preferredSize.height,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: MediaQuery.of(context).size.width * 0.8,
                          alignment: Alignment.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextFormField(
                    focusNode: _emailFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Usuario',
                      labelStyle: TextStyle(fontFamily: 'Raleway'),
                      contentPadding: EdgeInsets.all(0),
                    ),
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextFormField(
                    focusNode: _passwordFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: TextStyle(fontFamily: 'Raleway'),
                      contentPadding: EdgeInsets.all(0),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.login),
                  label: Text('Ingresar'),
                  style: TextButton.styleFrom(
                    primary: Color.fromRGBO(255, 182, 193, 1),
                    backgroundColor: Color.fromRGBO(105, 105, 105, 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
