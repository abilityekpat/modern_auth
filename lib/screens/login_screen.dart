import 'package:flutter/material.dart';
import 'package:modern_authentication/screens/home_page.dart';
import 'package:modern_authentication/services/auth_service.dart';
import 'package:modern_authentication/widgets/loader.dart';
import 'package:modern_authentication/widgets/my_button.dart';
import 'package:modern_authentication/widgets/my_textfield.dart';
import 'package:modern_authentication/widgets/square_tile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  AuthService _authService = AuthService();
  bool isLoading = false;

  //sign in user
  signUser() async {
    setState(() {
      isLoading = true;
    });

    bool result = await _authService.signInWithEmailAndPassword(
        emailcontroller.text, passwordcontroller.text);

    setState(() {
      isLoading = false;
    });

    if (result == true) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: isLoading
          ? (Loader())
          : SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),

                    //logo
                    const Icon(
                      Icons.lock,
                      size: 100,
                    ),
                    const SizedBox(height: 50),

                    //welcome back you've been missed
                    Text(
                      "Welcome back you've been missed",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 25),

                    //username textfield
                    MyTextField(
                      controller: emailcontroller,
                      hintText: "Email",
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),

                    //password textfield
                    MyTextField(
                      controller: passwordcontroller,
                      hintText: "Password",
                      obscureText: true,
                    ),
                    SizedBox(height: 10),

                    //forgot passeord
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Psssword?",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    //sign in button
                    MyButton(
                      onTap: signUser,
                      buttonText: "Sign In",
                    ),

                    const SizedBox(height: 50),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Or continue with",
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        //Google image
                        SquareTile(imagePath: "assets/images/google_image.png"),

                        SizedBox(width: 10),

                        // Apple image
                        SquareTile(imagePath: "assets/images/apple.png"),
                      ],
                    ),
                    const SizedBox(height: 50),

                    //Not a member? register
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a member?",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
