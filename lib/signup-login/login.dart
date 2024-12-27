// بسم الله
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/HomePage.dart';
import 'package:ecommerce/signup-login/Error.dart';
import 'package:ecommerce/signup-login/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void navigateTosignupPage() {
      // Implement navigation to the login page here
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignUpPage()));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 63),
                Center(
                  child: Image.network(
                    'Media/images/shopping-bag.png',
                    width: 96,
                    height: 96,
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 32),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 241, 241, 241),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.4)),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 0),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 241, 241, 241),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(height: 19),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 241, 241, 241),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.4)),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 19),
                SizedBox(height: 19),
                Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Color(0xFF6055D8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      try {
                        // Attempt to sign in with Firebase Authentication
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );

                        // If successful, navigate to the Home Page

                        // Now, check if the email is verified from Firestore
                        DocumentSnapshot userDoc = await FirebaseFirestore
                            .instance
                            .collection(
                                'users') // Your Firestore collection name
                            .doc(userCredential.user!
                                .uid) // Get the user's UID from Firebase Auth
                            .get();

                        if (userDoc.exists) {
                          var fullName = userDoc.get('fullName');
                          var email = userDoc.get('email');
                          Navigator.push(
                              context,
                              _createPageRoute(HomePage(
                                  name: fullName,
                                  email:
                                      email))); // Check the 'isVerify' field in Firestore
                        }
                      } catch (e) {
                        // Show an alert if there is an error (e.g., wrong credentials)

                        bool dialogOpen = true;

                        // Show the dialog
                        showDialog(
                          context: context,
                          builder: (context) => ErrorMessagePopup(
                            title: "failed to Sign in",
                            description: "User name or password is incorrect",
                          ),
                        ).then((_) {
                          // When the dialog is dismissed manually, set dialogOpen to false
                          dialogOpen = false;
                        });

                        // Dismiss the dialog automatically after 1.5 seconds
                        Future.delayed(
                            const Duration(seconds: 1, milliseconds: 500), () {
                          if (dialogOpen) {
                            Navigator.of(context)
                                .pop(); // Dismiss the dialog only if still open
                          }
                        });
                      }
                    },

                    /**
                     
 SizedBox(height: 20),
    _buildSignUpButton(context),
    SizedBox(height: 20),
    TextButton(
      onPressed: () {
        _navigateToLoginPage();
      },
      child: Text(
        'Joined us before? Login',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w600,
                      color: Color(0xFF6055D8),
        ),
      ),
                     */
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: navigateTosignupPage,
                  child: Text(
                    'New User ? Sign up',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6055D8),
                    ),
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

PageRouteBuilder _createPageRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}
