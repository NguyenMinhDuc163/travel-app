import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/global/common/toast.dart';
import 'package:travel_app/representation/screens/forgot_password_screen.dart';
import 'package:travel_app/representation/screens/home_screen.dart';
import 'package:travel_app/representation/screens/sign_up_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/buttom_widget.dart';
import 'package:travel_app/user_auth/fiirebase_auth_immplemmentation/firebase_auth_services.dart';

import 'hotel_screen.dart';
import 'main_app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isCheck = false;
  bool _isPressed = false;
  bool _isSigin = false;
  bool _isCliclSignUp = false;

  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      titleString: 'Login',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: kDefaultPadding * 5,
            ),
            TextField(
              style: TextStyle(fontSize: 18, color: Colors.black),
              controller: _emailController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Email',
                  prefixIcon: Container(
                    width: 1,
                    child: Icon(FontAwesomeIcons.envelope),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(6)))),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            TextField(
              style: TextStyle(fontSize: 18, color: Colors.black),
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Password',
                  prefixIcon: Container(
                    width: 1,
                    // child: ImageHelper.loadFromAsset(AssetHelper.icoLock),
                    child: Icon(FontAwesomeIcons.lock),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  )),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: _isCheck,
                        onChanged: (bool? val) {
                          setState(() {
                            _isCheck = val ?? false;
                          });
                        }),
                    // SizedBox(width: kDefaultPadding,),
                    Text(
                      'Remember me',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: kMediumPadding,
                ),
                InkWell(
                  child: Text(
                    'Forgot password',
                    style: TextStyle(
                        fontSize: 14,
                        color: _isPressed ? Colors.purple : Colors.blue),
                  ),
                  onTap: () {
                    setState(() {
                      if (!_isPressed) _isPressed = true;
                      Navigator.of(context)
                          .pushNamed(ForgotPasswordScreen.routeName);
                    });
                  },
                )
              ],
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            //TODO login button
            ButtonWidget(
              title: 'Login',
              isign: _isSigin,
              ontap: _signIn,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    color: Colors.grey, // Màu của đường thẳng
                    thickness: 1, // Độ dày của đường thẳng
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'or login with',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey, // Màu của đường thẳng
                    thickness: 1, // Độ dày của đường thẳng
                  ),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
              ],
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Row(

              children: [
                GestureDetector(
                  onTap: _signInWithGoogle,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ImageHelper.loadFromAsset(AssetHelper.icoRectangleWhite),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ImageHelper.loadFromAsset(AssetHelper.icoGG),
                          SizedBox(
                            width: kMinPadding,
                          ),
                          Text(
                            'Google',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //TODO login with facebook
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ImageHelper.loadFromAsset(AssetHelper.icoRectangleBlue),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ImageHelper.loadFromAsset(AssetHelper.icoFB),
                          SizedBox(
                            width: kMinPadding,
                          ),
                          Text(
                            'Facebook',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account? ',
                  style: TextStyle(fontSize: 14),
                ),
                InkWell(
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        fontSize: 14,
                        color: _isCliclSignUp ? Colors.purple : Colors.blue),
                  ),
                  onTap: () {
                    setState(() {
                      if (!_isCliclSignUp) _isCliclSignUp = true;
                    });
                    Navigator.of(context).pushNamed(SignUpScreen.routeName);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigin = true;
    });
    await Future.delayed(const Duration(milliseconds: 400));
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    print('email: $email, password: $password');

    User? user = await _auth.signInWithEmailAndPassWord(email, password);

    setState(() {
      _isSigin = false;
    });

    if (user != null) {
      showToast(message: 'Sign in success');
      Navigator.of(context).pushNamed(MainApp.routeName);
    } else {
      showToast(message: 'Sign up failed');
    }
  }

  _signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Navigator.pushNamed(context, MainApp.routeName);
      }
    } catch (e) {
      showToast(message: "some error occured $e");
      print(e);
    }
  }

  _signInWithFaceBook() async {
    //TODO login with facebook
  }
}
