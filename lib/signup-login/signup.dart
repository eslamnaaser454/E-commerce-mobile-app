// بسم الله
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/signup-login/Error.dart';
import 'package:ecommerce/signup-login/confirm.dart';
import 'package:ecommerce/splash_screen/SplashScreen.dart';
import 'package:ecommerce/signup-login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  void _navigateToLoginPage() {
    // Implement navigation to the login page here
   Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage()));
  }

  @override
  Widget build(BuildContext context) {
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
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 32),
                _buildTextField(
                  controller: _emailController,
                  hintText: 'Email',
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
                SizedBox(height: 19),
                _buildTextField(
                  controller: _fullNameController,
                  hintText: 'Full Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 19),
                _buildTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true,
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
                SizedBox(height: 19),
                Text(
                  'By Signing up, you agree to our Terms & Conditions and Privacy Policy.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0x80000000),
                  ),
                  textAlign: TextAlign.center,
                ),
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
    ),
    SizedBox(height: 20),

              ],
            ),
          ),
        ),
      ),
    );
  }
  // Sign-up button logic
Widget _buildSignUpButton(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          color: Color(0xFF6055D8),
          borderRadius: BorderRadius.circular(15),
        ),
      child: ElevatedButton(
        onPressed: () async {
          // Check if email, phone, or username already exist
          bool emailExists = await _checkIfExists('email', _emailController.text);
     
     
          if(_emailController.text.length>320){
  _showAlert(context,'Not Valid' ,'Email is not Valid');
            return;



          }
          if(_fullNameController.text.isEmpty){
          
  _showAlert(context,'Not Valid', 'Full Name Can\'t be empty');
            return;

          }



if(_passwordController.text.isEmpty){
  _showAlert(context,'Not Valid', 'Password Can\'t be empty');
            return;
}
          if(_emailController.text.isEmpty){
  _showAlert(context,'Not Valid', 'Email Can\'t be empty');
            return;



          }
          // Check if phone number contains less than 8 digits
      


          
          if (emailExists) {
            _showAlert(context, 'Not Valid','Email is already registered.');
            return;
          }


          
          // If no conflicts, proceed with user registration
          try {
            UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _emailController.text,
              password: _passwordController.text,
            );

          // Save user data in Firestore
await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set({
 
  'email': _emailController.text,
  'fullName': _fullNameController.text,
  'uid': credential.user!.uid,
  'isVerify': false, // Add this field with a default value of false
});
      _showDoneDialog(context, 'Account created successfully');
        await Future.delayed(Duration(seconds: 1, milliseconds: 500));
            Navigator.push(context, _createPageRoute( Loginpage()));
          } on FirebaseAuthException catch (e) {
            _showAlert(context,'Not Valid', 'An error occurred: ${e.message}');
          } catch (e) {
            _showAlert(context,'Not Valid', 'An unexpected error occurred.');
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: const Size(270, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
       child: Text(
                    'Continue',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
      ),
    );
  }
  PageRouteBuilder _createPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
void _showDoneDialog(BuildContext context, String message) {
   bool dialogOpen = true;

    // Show the dialog
    showDialog(
      context: context,
      builder: (context) => Confirmpopup(
        title: 'Confirmation Message',
        description: message,
      ),
    ).then((_) {
      // When the dialog is dismissed manually, set dialogOpen to false
      dialogOpen = false;
    });

    // Dismiss the dialog automatically after 1.5 seconds
    Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
      if (dialogOpen) {
        Navigator.of(context).pop(); // Dismiss the dialog only if still open
      }
    });
}
   void _showAlert(BuildContext context,String t, String message) {
     bool dialogOpen = true;

    // Show the dialog
    showDialog(
      context: context,
      builder: (context) => ErrorMessagePopup(
        title: t,
        description: message,
      ),
    ).then((_) {
      // When the dialog is dismissed manually, set dialogOpen to false
      dialogOpen = false;
    });

    // Dismiss the dialog automatically after 1.5 seconds
    Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
      if (dialogOpen) {
        Navigator.of(context).pop(); // Dismiss the dialog only if still open
      }
    });
  }
  
  Future<bool> _checkIfExists(String field, String value) async {
    QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where(field, isEqualTo: value)
        .get();
    return result.docs.isNotEmpty;
  }
 //************** */
 
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required String? Function(String?) validator,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 241, 241),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
        ),
        validator: validator,
      ),
    );
  }
}
