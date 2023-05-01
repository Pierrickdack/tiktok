import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants.dart';
import 'package:tiktok/screen/api/google_signin_api.dart';

class LogupPage extends StatefulWidget {
  const LogupPage({super.key});

  @override
  State<StatefulWidget> createState() => _LogupPageState();
}

class _LogupPageState extends State<LogupPage> {
  final _usernameController = TextEditingController();
  final _usersurnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  /* Future signInFse() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  } */

  @override
  void dispose() {
    _usernameController.dispose();
    _usersurnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          //end: Alignment.center,
          end: Alignment.topLeft,
          colors: [
            Color.fromARGB(255, 26, 194, 194),
            Colors.redAccent,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _userImg(),
              _nameApp(),
              const SizedBox(height: 50),
              _inputField("username", _usernameController),
              const SizedBox(height: 20),
              _inputField("usersurname", _usersurnameController),
              const SizedBox(height: 20),
              _inputField("email", _emailController),
              const SizedBox(height: 20),
              _inputField("Password", _passwordController, isPassword: true),
              const SizedBox(height: 50),
              _loginBtn(),
              const SizedBox(height: 20),
              _extraText(),
              /*const SizedBox(height: 20),
               _signinGgle(),
              const SizedBox(height: 10), */
            ],
          ),
        ),
      ),
    );
  }

  /* Widget _icon() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(0, 0, 0, 0), width: 2),
          shape: BoxShape.circle),
      child: const Icon(Icons.,
          color: Color.fromARGB(255, 0, 0, 0), size: 120),
    );
  } */
  Widget _userImg() {
    return Stack(children: [
      const CircleAvatar(
        radius: 64,
        backgroundImage: NetworkImage(
            'https://www.pngitem.com/middle/wxwbiT_user-hd-png-download/'),
        backgroundColor: Colors.white,
      ),
      Positioned(
        bottom: -10,
        left: 80,
        child: IconButton(
          onPressed: () => authController.pickImage(),
          icon: const Icon(Icons.add_a_photo_outlined),
        ),
      ),
    ]);
  }

  Widget _nameApp() {
    return const Text(
      "Tik Tok",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 30, color: Colors.black),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white)
    );

    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () => authController.registerUser(
        _usernameController.text,
        _usersurnameController.text,
        _emailController.text,
        _passwordController.text,
        authController.pathPhoto,
      ),
       /* {
        debugPrint("Username : ${_usernameController.text}");
        debugPrint("Email : ${_emailController.text}");
        debugPrint("Passwword : ${_passwordController.text}");
      }, */
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        shape: const StadiumBorder(),
        backgroundColor: const Color.fromARGB(255, 228, 226, 226),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const SizedBox(
          width: double.infinity,
          child: Text(
            "Sign up",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          )),
    );
  }

  Widget _extraText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account ?  ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        InkWell(
          onTap: () {
            print('Navigating user');
          },
          child: Text(
            '  Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
