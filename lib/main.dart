import 'package:first_wtf_app/bottom_navigation.dart';
import 'package:first_wtf_app/pages/forgot_password_page.dart';
import 'package:first_wtf_app/pages/home_page.dart';
import 'package:first_wtf_app/pages/login_page.dart';
import 'package:first_wtf_app/pages/onboarding_page.dart';
import 'package:first_wtf_app/pages/signup_page.dart';
import 'package:first_wtf_app/provider/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>UserCubit(),
      child: MaterialApp(
        title: 'Save A Life',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          textTheme: GoogleFonts.robotoTextTheme()
        ),
        debugShowCheckedModeBanner: false, 
        routes: {
          "/o": (context)=> OnboardingPage(),
          "/home": (context)=> BottomNavigation(),
          "/login": (context)=> LoginPage(),
          "/signup": (context)=> SignupPage(),
          "/forgot": (context)=> ForgotPasswordPage(),
        },
        initialRoute: "/login",
        // home: BottomNavigation()
      ),
    );
  }
}
