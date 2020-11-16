import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import './widgets/heading_auth.dart';
import '../../stores/auth.store.dart';
import './login_page.dart';

class RegisterScreen extends StatelessWidget {
  double _deviceWidth;
  // double _deviceHeigh;

  AuthStore _authStore;
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _authStore = Provider.of<AuthStore>(context);

    _deviceWidth = MediaQuery.of(context).size.width;
    // _deviceHeigh = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Observer(
          builder: (context) => _registerUI(context),
        ),
      ),
    );
  }

  Widget _registerUI(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.10),
      child: Column(
        children: <Widget>[
          Container(height: 50),
          HeadingAuth(),
          Container(height: 20),
          _formLogin(context),
          Container(height: 15),
          _loginButton(context),
          Container(height: 15),
          _textRegister(context),
        ],
      ),
    );
  }

  Widget _formLogin(context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(143, 148, 251, .6),
                blurRadius: 20.0,
                offset: Offset(0, 10))
          ]),
      child: Column(
        children: <Widget>[
          _nameTextField(context),
          _emailTextField(context),
          _passwordTextField(context),
        ],
      ),
    );
  }

  Widget _nameTextField(context) {
    return TextFormField(
      controller: _name,
      autocorrect: false,
      autofocus: true,
      style: TextStyle(color: Theme.of(context).primaryColor),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: 'Nome',
          hintStyle: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }

  Widget _emailTextField(context) {
    return TextFormField(
      controller: _email,
      autocorrect: false,
      autofocus: false,
      style: TextStyle(color: Theme.of(context).primaryColor),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: 'E-mail',
          hintStyle: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }

  Widget _passwordTextField(context) {
    return TextFormField(
      controller: _password,
      autocorrect: false,
      autofocus: false,
      obscureText: true,
      style: TextStyle(color: Theme.of(context).primaryColor),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
          hintText: 'Senha',
          hintStyle: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }

  Widget _loginButton(context) {
    return Container(
      width: _deviceWidth,
      child: MaterialButton(
          onPressed: () => _authStore.isLoading ? null : register(context),
          color: Theme.of(context).primaryColor,
          child: Text(_authStore.isLoading ? 'Cadastrando...' : 'CADASTRAR'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }

  Widget _textRegister(context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => LoginScreen()));
        Navigator.pushReplacementNamed(context, '/login');
      },
      child: Text(
        'Já tem cadastro? Faça o login!',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Future register(context) async {
    await _authStore.register(_name.text, _email.text, _password.text);

    Navigator.pushReplacementNamed(context, '/tenants');
  }
}
