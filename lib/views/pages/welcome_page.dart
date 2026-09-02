import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/views/pages/login_page.dart';
import 'package:flutter_app/views/pages/wlc_page.dart';

const Color _kBg = Color(0xFF0D1114);
const Color _kAccent = Color(0xFF00E5FF);

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kBg,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    height: 120.w,
                    width: 120.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Image.asset(
                        'assets/fonts/images/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 36.h),

                Text(
                  'The Future of\nReal Estate',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _kAccent,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w800,
                    height: 1.25,
                    shadows: [
                      Shadow(color: _kAccent.withAlpha(100), blurRadius: 24.r),
                    ],
                  ),
                ),

                SizedBox(height: 14.h),

                Text(
                  'Discover, invest, and manage properties\nwith the power of AI.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14.sp,
                    height: 1.6,
                  ),
                ),

                SizedBox(height: 40.h),

                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const WlcPage()),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 52.h),
                    backgroundColor: _kAccent,
                    foregroundColor: const Color(0xFF00262B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(Icons.arrow_forward, size: 18.sp),
                    ],
                  ),
                ),

                SizedBox(height: 12.h),

                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.infinity, 52.h),
                    backgroundColor: Colors.white.withAlpha(10),
                    foregroundColor: Colors.white,
                    side: BorderSide(color: Colors.white.withAlpha(25)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SizedBox(height: 24.h),

                Text.rich(
                  TextSpan(
                    children: const [
                      TextSpan(text: 'By continuing, you agree to our '),
                      TextSpan(
                        text: 'Terms',
                        style: TextStyle(
                          color: _kAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: _kAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(text: '.'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 11.5.sp,
                    height: 1.5,
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
