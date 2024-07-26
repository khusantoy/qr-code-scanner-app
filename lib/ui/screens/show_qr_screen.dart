import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner_app/utils/colors.dart';

class ShowQrScreen extends StatefulWidget {
  const ShowQrScreen({super.key});

  @override
  State<ShowQrScreen> createState() => _ShowQrScreenState();
}

class _ShowQrScreenState extends State<ShowQrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondaryColorGrey,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).viewPadding.top),
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: CustomColors.secondaryColorDarker,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF000000).withOpacity(0.6),
                            spreadRadius: 0,
                            blurRadius: 46,
                          )
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: CustomColors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    Text(
                      "QR Code",
                      style: TextStyle(
                        fontSize: 27.sp,
                        color: CustomColors.secondaryColorWhiter,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 80.h,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: 312.w,
                  height: 68.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B3B3B).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Data",
                        style: TextStyle(
                          fontSize: 19.sp,
                          color: CustomColors.secondaryColorWhiter,
                        ),
                      ),
                      Text(
                        "https://www.google.com/",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: CustomColors.secondaryColorWhiter,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 181.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 181.w,
                        height: 181.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: CustomColors.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Image.asset(
                          "assets/images/qr_example.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 60.w,
                                height: 60.w,
                                decoration: BoxDecoration(
                                  color: CustomColors.primaryColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: const Icon(
                                  Icons.share_rounded,
                                  size: 40,
                                  color: CustomColors.secondaryColorDarker,
                                ),
                              ),
                              SizedBox(
                                height: 9.h,
                              ),
                              const Text(
                                "Share",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: CustomColors.secondaryColorWhiter,
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 60.w,
                                height: 60.w,
                                decoration: BoxDecoration(
                                  color: CustomColors.primaryColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: const Icon(
                                  Icons.save,
                                  size: 40,
                                  color: CustomColors.secondaryColorDarker,
                                ),
                              ),
                              SizedBox(
                                height: 9.h,
                              ),
                              const Text(
                                "Save",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: CustomColors.secondaryColorWhiter,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    width: double.infinity,
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
                            child:
                                SvgPicture.asset("assets/images/scan_qr.svg"),
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
      ),
    );
  }
}
