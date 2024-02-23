import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representation/screens/login_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/buttom_widget.dart';

import '../../core/constants/dimension_constants.dart';
import '../../core/helpers/asset_helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String routeName = '/sign_up_screen';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    String? selectedValue = 'Vietnamese';
    return AppBarContinerWidget(
      titleString: 'Sign Up',
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kDefaultPadding * 5,
            ),
            TextField(
              style: TextStyle(fontSize: 18, color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Name',
                  prefixIcon: Container(
                    width: 1,
                    child: Icon(FontAwesomeIcons.user),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(6)))),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: Colors.white,
              ),
              child: DropdownButton<String>(
                value: selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                items: <String>['Vietnamese', 'Myanmar', 'japan', 'China']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.earthAsia), // Icon
                        SizedBox(width: 10), // Khoảng cách giữa icon và text
                        Text(value), // Text
                      ],
                    ),
                  );
                }).toList(),
                dropdownColor: Colors.white,
                isExpanded: true,
                underline: Container(
                  height: 0,
                  color: Colors.transparent,
                ),
              ),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            TextField(
              style: TextStyle(fontSize: 18, color: Colors.black),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Phone',
                  prefixIcon: Container(
                    width: 1,
                    child: Icon(FontAwesomeIcons.phone),
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
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Password',
                  prefixIcon: Container(
                    width: 1,
                    child: Icon(FontAwesomeIcons.lock),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(6)))),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  TextSpan(
                      text: 'By tapping sign up you agree to the ',
                      style: TextStyle(fontSize: 14)),
                  TextSpan(
                    text: 'Terms and Conditions ', // \n để xuống dòng
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Xử lý khi người dùng nhấp vào "Terms and Conditions"
                        print('Navigate to Terms and Conditions');
                      },
                  ),
                  TextSpan(
                    text: 'and ', // \n để xuống dòng
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1.5,
                      wordSpacing: 2.0,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Xử lý khi người dùng nhấp vào "and"
                        print('Navigate to "and"');
                      },
                  ),
                  TextSpan(
                    text: 'Privacy Policy ', // \n để xuống dòng
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Xử lý khi người dùng nhấp vào "Privacy Policy"
                        print('Navigate to Privacy Policy');
                      },
                  ),
                  TextSpan(
                    text: 'of this app',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              textAlign: TextAlign.center, // Căn giữa dòng văn bản
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            ButtonWidget(
              title: 'Sign Up',
              ontap: () {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              },
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
                    'or sign in with',
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
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.icoRectangleWhite),
                    Row(
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
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.icoRectangleBlue),
                    Row(
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
              ],
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
          ],
        ),
      ),
    );
  }
}