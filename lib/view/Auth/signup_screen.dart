import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kompanyon_app/User%20Pathway/input_message1.dart';
import 'package:kompanyon_app/const/color.dart';
import 'package:kompanyon_app/const/image.dart';
import 'package:kompanyon_app/view/Auth/login_screen.dart';
import 'package:kompanyon_app/view/nav_bar/nav_bar.dart';
import 'package:kompanyon_app/widgets/custom_button.dart';
import 'package:kompanyon_app/widgets/custom_inter_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kompanyon_app/widgets/custom_textfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> with SingleTickerProviderStateMixin {
  // Controllers for text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailController1 = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController retypepasswordController =
      TextEditingController();

  // Focus nodes for text fields
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _retypePasswordFocusNode = FocusNode();

  late AnimationController _controller;
  late final Animation<double> _logoAnimation;
  late final Animation<double> _contentAnimation;
  bool _isLogoInFinalPosition = false;
  late final Animation<double> _scaleAnimation;
  bool ishowcontent = false;
  bool isselected = false;
  String isselectedsignup = "Signup";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _logoAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _contentAnimation = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 2.0, end: 1.0).animate(_controller);

    Future.delayed(Duration(milliseconds: 600), () {
      setState(() {
        _isLogoInFinalPosition = true;
      });
      _controller.forward().then((value) {
        setState(() {
          ishowcontent = true;
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    // Dispose focus nodes
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _retypePasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GestureDetector(
        onTap: () {
          // Unfocus all text fields when tapping outside
          _emailFocusNode.unfocus();
          _passwordFocusNode.unfocus();
          _retypePasswordFocusNode.unfocus();
        },
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            if (ishowcontent == false)
              AnimatedPositioned(
                duration: Duration(milliseconds: 600),
                top: _isLogoInFinalPosition
                    ? Get.height * .13
                    : (Get.height / 2) - 37,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Center(
                    child: Center(
                        child: Image.asset(
                      AppImages.bglogo,
                      height: 60,
                      width: 60,
                    )),
                  ),
                ),
              ),
            if (ishowcontent)
              SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 42.w),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 160.h),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.anchor,
                                size: 25, // Adjust the size as needed
                                color:
                                    primaryColor // Adjust the color as needed
                                ),
                            SizedBox(
                              width: 10.w,
                            ),
                            ScaleTransition(
                              scale: _scaleAnimation,
                              child: InterCustomText(
                                text: 'Kompanyon',
                                textColor: primaryColor,
                                fontsize: 30.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        InterCustomText(
                          text: 'Welcome',
                          textColor: primaryColor,
                          fontsize: 24.sp,
                        ),
                        SizedBox(height: 3.h),
                        InterCustomText(
                          textAlign: TextAlign.center,
                          text: 'Access your account or create a new one below',
                          textColor: primaryColor,
                          fontsize: 14.sp,
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Handle the onTap event to set isselected
                                setState(() {
                                  isselectedsignup = "Signup";
                                });
                              },
                              child: Container(
                                width: 90,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: isselectedsignup == "Signup"
                                      ? primaryColor
                                      : Colors
                                          .white, // Change color based on isselected
                                ),
                                child: Center(
                                  child: InterCustomText(
                                    textAlign: TextAlign.center,
                                    text: 'Sign up',
                                    textColor: isselectedsignup == "Signup"
                                        ? Colors.white
                                        : primaryColor,
                                    fontsize: 18.sp,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         Login(), // Replace 'Login' with your login screen widget
                                //   ),
                                // );

                                // Handle the onTap event to set isselected to false
                                setState(() {
                                  isselectedsignup = "Signin";
                                });
                              },
                              child: Container(
                                width: 90,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: isselectedsignup == "Signin"
                                      ? primaryColor
                                      : Colors
                                          .white, // Change color based on isselected
                                ),
                                child: Center(
                                  child: InterCustomText(
                                    textAlign: TextAlign.center,
                                    text: 'Sign in',
                                    textColor: isselectedsignup == "Signin"
                                        ? Colors.white
                                        : primaryColor,
                                    fontsize: 18.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        isselectedsignup == "Signup"
                            ? Column(
                                children: [
                                  InputField(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    hint: 'Email',
                                    keyboard: TextInputType.emailAddress,
                                    controller: emailController,
                                    focusNode:
                                        _emailFocusNode, // Added focusNode
                                  ),
                                  SizedBox(height: 24.h),
                                  InputField(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    hint: 'Password',
                                    keyboard: TextInputType.text,
                                    controller: passwordController,
                                    focusNode:
                                        _passwordFocusNode, // Added focusNode
                                  ),
                                  SizedBox(height: 24.h),
                                  InputField(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    hint: 'Confirm Password',
                                    keyboard: TextInputType.text,
                                    controller: retypepasswordController,
                                    focusNode:
                                        _retypePasswordFocusNode, // Added focusNode
                                  ),
                                  SizedBox(height: 24.h),
                                  Align(
                                    alignment: Alignment.center,
                                    child: CustomButton(
                                      text: 'Create Account',
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                NavBar(), // Replace 'Login' with your login screen widget
                                          ),
                                        );
                                        print('Create Account button pressed');
                                      },
                                      width: 327,
                                      height: 52,
                                      borderRadius: 12,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 24.h),
                                ],
                              )
                            : Column(
                                children: [
                                  InputField(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    hint: 'Email',
                                    keyboard: TextInputType.text,
                                    controller: emailController1,
                                    focusNode:
                                        _emailFocusNode, // Added focusNode
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                  InputField(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    hint: 'Password',
                                    keyboard: TextInputType.text,
                                    controller: passwordController1,
                                    focusNode:
                                        _passwordFocusNode, // Added focusNode
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                  CustomButton(
                                    text: 'Sign-In',
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => NavBar()),
                                      );
                                      print('Sign-In button pressed');
                                    },
                                    width: 327,
                                    height: 52,
                                    borderRadius: 12,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  InterCustomText(text: 'Forgot Password?', textColor: primaryColor,fontsize: 14.sp,)
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     Container(
                                  //       height: 1.h,
                                  //       width: 102.w,
                                  //       color: Color(0xffE6E6E6),
                                  //     ),
                                  //     SizedBox(
                                  //       width: 8.w,
                                  //     ),
                                  //     InterCustomText(
                                  //       textAlign: TextAlign.center,
                                  //       text: 'or continue with',
                                  //       textColor: Color(0xff828282),
                                  //       fontsize: 14.sp,
                                  //     ),
                                  //     SizedBox(
                                  //       width: 8.w,
                                  //     ),
                                  //     Container(
                                  //       height: 1.h,
                                  //       width: 102.w,
                                  //       color: Color(0xffE6E6E6),
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: 10.h,
                                  // ),
                                  // Container(
                                  //   width: 327.w,
                                  //   height: 40.h,
                                  //   decoration: BoxDecoration(
                                  //     color: primaryColor.withOpacity(0.3),
                                  //     borderRadius: BorderRadius.circular(8.r),
                                  //   ),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.center,
                                  //     children: [
                                  //       Image.asset(
                                  //         AppImages.googleIcon,
                                  //         height: 20.h,
                                  //         width: 20.w,
                                  //       ),
                                  //       SizedBox(
                                  //         width: 8.w,
                                  //       ),
                                  //       Center(
                                  //         child: InterCustomText(
                                  //           textAlign: TextAlign.center,
                                  //           text: 'Google',
                                  //           textColor: primaryColor,
                                  //           fontsize: 14.sp,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 24.h,
                                  // ),
                                  // RichText(
                                  //   textAlign: TextAlign.center,
                                  //   text: TextSpan(
                                  //     text:
                                  //         'By clicking continue, you agree to our ',
                                  //     style: GoogleFonts.inter(
                                  //       color: Color(0xff828282),
                                  //       fontWeight: FontWeight.w400,
                                  //       fontSize: 12.sp,
                                  //     ),
                                  //     children: [
                                  //       TextSpan(
                                  //         text: 'Terms of Service',
                                  //         style: GoogleFonts.inter(
                                  //           color: primaryColor,
                                  //           fontWeight: FontWeight.w400,
                                  //           fontSize: 12.sp,
                                  //         ),
                                  //         recognizer: TapGestureRecognizer()
                                  //           ..onTap = () {
                                  //             // Navigate to the Terms of Service page
                                  //           },
                                  //       ),
                                  //       TextSpan(
                                  //         text: ' and ',
                                  //         style: GoogleFonts.inter(
                                  //           color: Color(0xff828282),
                                  //           fontWeight: FontWeight.w400,
                                  //           fontSize: 12.sp,
                                  //         ),
                                  //       ),
                                  //       TextSpan(
                                  //         text: 'Privacy Policy',
                                  //         style: GoogleFonts.inter(
                                  //           color: primaryColor,
                                  //           fontWeight: FontWeight.w400,
                                  //           fontSize: 12.sp,
                                  //         ),
                                  //         recognizer: TapGestureRecognizer()
                                  //           ..onTap = () {
                                  //             // Navigate to the Privacy Policy page
                                  //           },
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}