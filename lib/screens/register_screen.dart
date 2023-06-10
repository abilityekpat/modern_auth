import 'package:flutter/material.dart';
import 'package:modern_authentication/screens/home_page.dart';
import 'package:modern_authentication/services/auth_service.dart';
import 'package:modern_authentication/widgets/loader.dart';
import 'package:modern_authentication/widgets/my_button.dart';
import 'package:modern_authentication/widgets/my_textfield.dart';
import 'package:modern_authentication/widgets/square_tile.dart';
import 'package:modern_authentication/widgets/toast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final fullnamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final comfirmpasswordcontroller = TextEditingController();
  final AuthService _authService = AuthService();
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  //sign in user
  signUserUp() async {
    if (_formKey.currentState!.validate()) {
      if (passwordcontroller.text != comfirmpasswordcontroller.text) {
        Toast.errorToast('Password do not match');
        return false;
      }
      setState(() {
        isLoading = true;
      });

      bool result = await _authService.createUserWithEmailAndPassword(
          emailcontroller.text, passwordcontroller.text);

      setState(() {
        isLoading = false;
      });

      if (result) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: isLoading
          ? (Loader())
          : SafeArea(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),

                        //logo
                        const Icon(
                          Icons.lock,
                          size: 50,
                        ),
                        const SizedBox(height: 30),

                        //welcome back you've been missed
                        Text(
                          "Welcome, Let's create an account for you",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 25),

                        //usernmae Textfield
                        MyTextField(
                          controller: fullnamecontroller,
                          hintText: "Full Name",
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your full Name';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 10),

                        //email textfield
                        MyTextField(
                          controller: emailcontroller,
                          hintText: "Email",
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 10),

                        //password textfield
                        MyTextField(
                          controller: passwordcontroller,
                          hintText: "Password",
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 10),

                        //comfirm password textfield

                        MyTextField(
                          controller: comfirmpasswordcontroller,
                          hintText: "Comfirm Password",
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
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
                          onTap: signUserUp,
                          buttonText: "Sign Up",
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                            SquareTile(
                                imagePath: "assets/images/google_image.png"),

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
              ),
            ),
    );
  }
}
