import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/mobile/auth_service.dart';
import 'package:flutter_app/views/pages/signup_page.dart';
import 'package:flutter_app/views/widget_tree.dart';

const Color _kBg = Color(0xFF0D1114); // near-black from your design
const Color _kAccent = Color(0xFF00E5FF); // bright cyan from your design

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controlleremail = TextEditingController();
  final TextEditingController controllerpw = TextEditingController();
  bool hidepw = true;

  @override
  void dispose() {
    controlleremail.dispose();
    controllerpw.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // Login page: a bit bigger than the base design
    final double scale = ((screenHeight / 780).clamp(0.65, 1.0)) * 1.20;

    double s(double value) => value * scale;

    return Scaffold(
      backgroundColor: _kBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white70),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: s(12)),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          height: s(64),
                          width: s(64),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/fonts/images/logo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: s(20)),

                      Text(
                        'Log in to your\nAQARI+ account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: s(22),
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(height: s(22)),

                      Text(
                        'Email or Phone',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: s(13.0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: s(8)),
                      TextField(
                        controller: controlleremail,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: s(15.0),
                        ),
                        decoration: InputDecoration(
                          hintText: 'name@example.com',
                          hintStyle: TextStyle(
                            color: Colors.white24,
                            fontSize: s(14.5),
                          ),
                          prefixIcon: const Icon(
                            Icons.mail_outline,
                            color: Colors.white38,
                            size: 20.0,
                          ),
                          filled: true,
                          fillColor: Colors.white.withAlpha(10),
                          contentPadding: EdgeInsets.symmetric(vertical: s(14)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: Colors.white.withAlpha(20),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: _kAccent,
                              width: 1.4,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: s(14)),

                      Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: s(13.0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: s(8)),
                      TextField(
                        controller: controllerpw,
                        obscureText: hidepw,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: s(15.0),
                        ),
                        decoration: InputDecoration(
                          hintText: '••••••••',
                          hintStyle: TextStyle(
                            color: Colors.white24,
                            fontSize: s(14.5),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Colors.white38,
                            size: 20.0,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () => setState(() => hidepw = !hidepw),
                            icon: Icon(
                              hidepw
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.white38,
                              size: 20.0,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white.withAlpha(10),
                          contentPadding: EdgeInsets.symmetric(vertical: s(14)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: Colors.white.withAlpha(20),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: _kAccent,
                              width: 1.4,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: s(8)),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: onForgotPasswordPressed,
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: _kAccent,
                              fontSize: s(13.0),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: s(20)),

                      FilledButton(
                        onPressed: onLoginPressed,
                        style: FilledButton.styleFrom(
                          minimumSize: Size(double.infinity, s(50)),
                          backgroundColor: _kAccent,
                          foregroundColor: const Color(0xFF00262B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                        ),
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: s(16.0),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: s(20)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: s(13.5),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: _kAccent,
                                fontSize: s(13.5),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: s(12)),

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Privacy Policy',
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 12.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              '·',
                              style: TextStyle(color: Colors.white24),
                            ),
                          ),
                          Text(
                            'Terms of Service',
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void onLoginPressed() async {
    try {
      await authService.value.signIn(
        email: controlleremail.text,
        password: controllerpw.text,
      );

      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const WidgetTree()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Authentication error')),
      );
    }
  }

  void onForgotPasswordPressed() async {
    final email = controlleremail.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email first')),
      );
      return;
    }

    try {
      await authService.value.resetPassword(email: email);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset email sent')),
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Could not send reset email')),
      );
    }
  }
}
