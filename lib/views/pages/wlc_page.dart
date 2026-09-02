import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/views/pages/signup_page.dart';
import 'package:lottie/lottie.dart';

const Color _kBg = Color(0xFF0D1114);
const Color _kAccent = Color(0xFF00E5FF);

class WlcPage extends StatelessWidget {
  const WlcPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),

              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 300.w,
                    width: 300.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [Color(0x2900E5FF), Colors.transparent],
                      ),
                    ),
                  ),

                  Container(
                    height: 280.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(14.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(8),
                      borderRadius: BorderRadius.circular(28.r),
                      border: Border.all(color: Colors.white.withAlpha(18)),
                    ),
                    child: Lottie.asset(
                      'assets/lotties/Welcome.json',
                      delegates: LottieDelegates(
                        values: [
                          ValueDelegate.color(const ['**'], value: _kAccent),
                        ],
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              Text(
                'A Q A R I +',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 6.w,
                  color: Colors.white38,
                ),
              ),

              SizedBox(height: 14.h),

              Text(
                'Find it. Love it.\nMove in.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w800,
                  height: 1.25,
                  color: _kAccent,
                  shadows: [
                    Shadow(color: _kAccent.withAlpha(100), blurRadius: 24.r),
                  ],
                ),
              ),

              SizedBox(height: 18.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 42.w,
                    height: 1.h,
                    color: Colors.white.withAlpha(30),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      '◆',
                      style: TextStyle(
                        fontSize: 8.sp,
                        color: _kAccent.withAlpha(220),
                      ),
                    ),
                  ),

                  Container(
                    width: 42.w,
                    height: 1.h,
                    color: Colors.white.withAlpha(30),
                  ),
                ],
              ),

              SizedBox(height: 18.h),

              Text(
                'Curated homes and premium spaces,\nchosen for the way you live.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  height: 1.6,
                  color: Colors.white54,
                ),
              ),

              SizedBox(height: 38.h),

              FilledButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const SignUpPage()),
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
                      'Next',
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
            ],
          ),
        ),
      ),
    );
  }
}
