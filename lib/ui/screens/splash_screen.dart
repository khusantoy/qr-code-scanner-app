import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner_app/ui/screens/home_screen.dart';
import 'package:qr_code_scanner_app/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  bool clicked = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CustomColors.primaryColor,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              top: animate ? 0 : -200.h,
              child: SvgPicture.asset("assets/images/top_wave.svg"),
            ),
            Center(
              child: SvgPicture.asset("assets/images/qr_logo.svg"),
            ),
            AnimatedPositioned(
              bottom: animate ? 110.h : -120,
              duration: const Duration(milliseconds: 300),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text(
                      "Get Started",
                      style: TextStyle(fontSize: 42.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Go and enjoy our features for free and make your life easy with us.",
                        style: TextStyle(
                          fontSize: 17.sp,
                          color: const Color(0xFF3E3E42).withOpacity(0.6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              bottom: animate ? -30.h : -160,
              right: 0,
              duration: const Duration(milliseconds: 400),
              child: SvgPicture.asset("assets/images/bottom_wave.svg"),
            ),
            AnimatedPositioned(
              bottom: animate ? 20 : -160,
              right: 20,
              duration: const Duration(milliseconds: 600),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    clicked = true;
                  });

                  Future.delayed(const Duration(milliseconds: 100), () {
                    setState(() {
                      clicked = false;
                    });
                  });

                  Future.delayed(const Duration(milliseconds: 200), () {
                    Navigator.of(context).pushReplacement(_createRoute());
                  });
                },
                child: Transform.scale(
                  scale: clicked ? 1.1 : 1,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    width: 70.w,
                    height: 70.h,
                    decoration: const BoxDecoration(
                      color: CustomColors.primaryColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.primaryColor,
                          spreadRadius: 1,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: const Icon(CupertinoIcons.arrow_right),
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

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
