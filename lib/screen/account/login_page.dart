import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants.dart';
import 'package:tiktok/screen/api/google_signin_api.dart';
import 'package:tiktok/screen/house_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future signInFse() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
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
              _icon(),
              _nameApp(),
              const SizedBox(height: 50),
              _inputField("Username", _emailController),
              const SizedBox(height: 20),
              _inputField("Password", _passwordController, isPassword: true),
              const SizedBox(height: 50),
              _loginBtn(),
              const SizedBox(height: 20),
              _extraText(),
              const SizedBox(height: 20),
              _signinGgle(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(0, 0, 0, 0), width: 2),
          shape: BoxShape.circle),
      child: const Icon(Icons.tiktok_sharp,
          color: Color.fromARGB(255, 0, 0, 0), size: 120),
    );
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
        borderSide: const BorderSide(color: Colors.white));

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
      onPressed: () => authController.loginUser(
        _emailController.text,
        _passwordController.text,
      )
      /* {
        debugPrint("Email : ${_emailController.text}");
        debugPrint("Passwword : ${_passwordController.text}");
      } */,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        shape: const StadiumBorder(),
        backgroundColor: const Color.fromARGB(255, 228, 226, 226),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const SizedBox(
          width: double.infinity,
          child: Text(
            "Sign in",
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
          "Can't access to your account ?  ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        InkWell(
          onTap: () {
            print('Navigating user');
          },
          child: Text(
            '  Sign up',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        ),
      ],
    );
  }

  Widget _signinGgle() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
      ),
      icon: const FaIcon(
        FontAwesomeIcons.google,
        color: Colors.red,
      ),
      label: const Text("Sign in with Google"),
      onPressed: signIn,
    );
  }

  Future signIn() async {
    final user = await GoogleSignInApi.login();

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Sign in failed"),
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HousePage(),
      ));
    }
  }
}
