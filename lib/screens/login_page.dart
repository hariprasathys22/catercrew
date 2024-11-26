import 'package:catercrews/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final TextEditingController controller = TextEditingController();

  // State variable to toggle between Login and Sign Up
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // This allows the layout to adjust for the keyboard
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Image.asset(
                "assets/images/catercrew.png",
                width: 200,
                height: 150,
              ),
              // AnimatedSwitcher for ease-in-out animation
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500), // Animation duration
                switchInCurve: Curves.easeInOut, // Ease-in-out curve
                switchOutCurve: Curves.easeInOut, // Ease-in-out curve
                transitionBuilder: (Widget child, Animation<double> animation) {
                  // Fade in/out animation with scaling effect
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(scale: animation, child: child),
                  );
                },
                child: Column(
                  key: ValueKey<bool>(isLogin), // Key to trigger animation
                  children: [
                    Text(
                      isLogin ? "Log in to your account" : "Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Phone number",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: double.infinity, // Full width within the padding
                      child: IntlPhoneField(
                        decoration: InputDecoration(
                          labelText: 'Enter your Phone Number',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                        onPressed: () {
                          if (isLogin) {
                            print("Logging in...");
                          } else {
                            print("Signing up...");
                          }
                        },
                        buttonText: isLogin ? 'Log in' : 'Create new account',
                      ),
                    ),
                    SizedBox(height: 40),
                    if (isLogin)
                      Column(
                        children: [
                          Text(
                            "Log in with",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/images/google.png'),
                                  iconSize: 5,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isLogin
                              ? "Don't have an account?"
                              : "Already have an account?",
                          style: TextStyle(
                              color: Color.fromRGBO(211, 192, 177, 1),
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isLogin = !isLogin; // Toggle login/signup state
                            });
                          },
                          child: Text(
                            isLogin ? "Sign up" : "Log in",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
