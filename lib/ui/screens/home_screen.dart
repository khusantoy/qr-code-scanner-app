import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_scanner_app/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Barcode? _barcode;

  Widget _buildBarcode(Barcode? value) {
    if (value == null) {
      return const Text(
        'Scan something!',
        overflow: TextOverflow.fade,
        style: TextStyle(color: Colors.white),
      );
    }

    return Text(
      value.displayValue ?? 'No display value.',
      overflow: TextOverflow.fade,
      style: const TextStyle(color: Colors.white),
    );
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    if (mounted) {
      setState(() {
        _barcode = barcodes.barcodes.firstOrNull;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            MobileScanner(
              onDetect: _handleBarcode,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Container(
                  width: 320.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    color: CustomColors.secondaryColorDarker,
                    borderRadius: BorderRadius.circular(6.r),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF000000).withOpacity(0.6),
                        spreadRadius: 0,
                        blurRadius: 46,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.photo,
                            color: CustomColors.secondaryColorWhiter,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.bolt_fill,
                            color: CustomColors.secondaryColorWhiter,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.camera_rotate_fill,
                            color: CustomColors.secondaryColorWhiter,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset("assets/images/qr_scan_space.svg"),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  width: 320.w,
                  height: 67.h,
                  decoration: BoxDecoration(
                    color: CustomColors.secondaryColorDarker,
                    borderRadius: BorderRadius.circular(6.r),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF000000).withOpacity(0.6),
                        spreadRadius: 0,
                        blurRadius: 46,
                      )
                    ],
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              CupertinoIcons.qrcode,
                              size: 35,
                              color: Color(0xFFD9D9D9),
                            ),
                            Text(
                              "Generate",
                              style: TextStyle(
                                fontSize: 17.sp,
                                letterSpacing: 0.1,
                                color: CustomColors.secondaryColorWhiter,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -45,
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          width: 70.w,
                          height: 70.h,
                          decoration: const BoxDecoration(
                            color: CustomColors.primaryColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: CustomColors.primaryColor,
                                spreadRadius: 2,
                                blurRadius: 10,
                              )
                            ],
                          ),
                          child: SvgPicture.asset("assets/images/scan_qr.svg"),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.history,
                              size: 35,
                              color: CustomColors.secondaryColorWhiter,
                            ),
                            Text(
                              "History",
                              style: TextStyle(
                                fontSize: 17.sp,
                                letterSpacing: 0.1,
                                color: CustomColors.secondaryColorWhiter,
                              ),
                            ),
                          ],
                        ),
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
