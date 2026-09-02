import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/mobile/auth_service.dart';
import 'package:flutter_app/views/pages/login_page.dart';
import 'package:flutter_app/views/widget_tree.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const Color _kBg = Color(0xFF0D1114); // near-black from your designqq
const Color _kAccent = Color(0xFF00E5FF); // bright cyan from your design

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController controllername = TextEditingController();
  final TextEditingController controlleremail = TextEditingController();
  final TextEditingController controllerpw = TextEditingController();
  bool hidepw = true;

  @override
  void dispose() {
    controllername.dispose();
    controlleremail.dispose();
    controllerpw.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // Register page: a bit smaller than the base design
    final double scale = ((screenHeight / 780).clamp(0.65, 1.0)) * 0.92;

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
                        'Create your AQARI+\naccount',
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
                        'Full Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: s(13.0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: s(8)),
                      TextField(
                        controller: controllername,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: s(15.0),
                        ),
                        decoration: InputDecoration(
                          hintText: 'John Doe',
                          hintStyle: TextStyle(
                            color: Colors.white24,
                            fontSize: s(14.5),
                          ),
                          prefixIcon: const Icon(
                            Icons.person_outline,
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

                      SizedBox(height: s(20)),

                      FilledButton(
                        onPressed: onCreateAccountPressed,
                        style: FilledButton.styleFrom(
                          minimumSize: Size(double.infinity, s(50)),
                          backgroundColor: _kAccent,
                          foregroundColor: const Color(0xFF00262B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                        ),
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: s(16.0),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: s(16)),

                      Container(
                        padding: EdgeInsets.all(s(12)),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(10),
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(color: Colors.white.withAlpha(15)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 24.0,
                              width: 24.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _kAccent.withAlpha(31),
                              ),
                              child: const Icon(
                                Icons.info_outline,
                                color: _kAccent,
                                size: 14.0,
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            const Expanded(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'By registering, you start as a ',
                                    ),
                                    TextSpan(
                                      text: 'Free User',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '. You can search freely and list up to ',
                                    ),
                                    TextSpan(
                                      text: '3 properties',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(text: '. Upgrade to '),
                                    TextSpan(
                                      text: 'Agent',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(text: ' anytime!'),
                                  ],
                                ),
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 12.0,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: s(18)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
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
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Log In',
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

  void onCreateAccountPressed() async {
    try {
      await authService.value.createAccount(
        email: controlleremail.text.trim(),
        password: controllerpw.text,
      );

      await authService.value.updateUsername(
        username: controllername.text.trim(),
      );

      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'name': controllername.text.trim(),
          'email': controlleremail.text.trim(),
          'role': 'user',
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

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
}
