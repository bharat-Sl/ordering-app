import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ordering/core/utils/assets.dart';
import 'package:ordering/modules/restaurant/views/restaurant_dashboard_view.dart';
import 'package:pinput/pinput.dart';

class OTPEntryView extends StatefulWidget {
  const OTPEntryView({super.key});

  @override
  State<OTPEntryView> createState() => _OTPEntryViewState();
}

class _OTPEntryViewState extends State<OTPEntryView> {
  int _start = 30;
  late Timer _timer;

  void startTimer() {
    _start = 30;
    const oneSec = Duration(seconds: 1);
    setState(() {});
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start < 1) {
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  @override
  void initState() {
    startTimer();

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeeeeee),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 46, left: 14, right: 14, bottom: 26),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(child: SizedBox()),
                Container(
                  width: double.maxFinite,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(2, 2))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text(
                            "We've sent a PIN to ",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff777777)),
                          ),
                          Text(
                            "8955182448.",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff777777)),
                          ),
                        ],
                      ),
                      const Text(
                        "Please enter the PIN below.",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff777777)),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "PIN Number",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffbbbbbb)),
                          ),
                          const SizedBox(height: 6),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Pinput(
                                  length: 6,
                                  // forceErrorState: authProvider.otpError,
                                  focusedPinTheme: PinTheme(
                                    width: 44,
                                    height: 44,
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xffdd2f6e)),
                                      color: const Color(0xffeeeeee),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  defaultPinTheme: PinTheme(
                                    width: 44,
                                    height: 44,
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffeeeeee),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  errorPinTheme: PinTheme(
                                    width: 44,
                                    height: 44,
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.red.withOpacity(0.5)),
                                      color: const Color(0xffeeeeee),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  // onChanged: (v) {
                                  //   authProvider.errorChange(false);
                                  // },
                                  // onCompleted: (pin) {
                                  //   authProvider.validateOtp(
                                  //       context: context, pin: pin);
                                  // },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Didn't recieve your pin?",
                        style: TextStyle(
                          color: Color(0xff777777),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                color: Color(0xffdd2f6e),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                              children: [
                                if (_start < 1)
                                  TextSpan(
                                    text: 'Resend',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        startTimer();
                                      },
                                  ),
                                if (_start > 0)
                                  const TextSpan(
                                    text: 'Resend code in ',
                                    style: TextStyle(
                                      color: Color(0xff777777),
                                      fontSize: 12,
                                    ),
                                  ),
                                if (_start > 0)
                                  TextSpan(
                                    text: '0:$_start sec',
                                    style: const TextStyle(
                                        color: Color(0xffdd2f6e), fontSize: 12),
                                  ),
                                const TextSpan(
                                  text: ' or ',
                                  style: TextStyle(
                                    color: Color(0xff777777),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Change Number',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffdd2f6e),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).pop();
                                    },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      RichText(
                        text: const TextSpan(
                          text: 'By signing up you agree to our ',
                          style: TextStyle(
                            color: Color(0xffbbbbbb),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: 'Terms & Policies',
                              style: TextStyle(
                                color: Color(0xff777777),
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RestaurantDashboardView()),
                              (route) => false);
                        },
                        child: Container(
                          height: 50,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Color(0xffdd2f6e),
                                    Color(0xffed3f7e),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.centerRight),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                            child: Text(
                              "VERIFY OTP",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.logoBG,
                          height: 40,
                          color: const Color(0xffdd2f6e),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "BIT\nBYTES",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            height: 0.9,
                            color: Color(0xffdd2f6e),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Positioned(
                top: 16,
                right: 0,
                child: Icon(
                  Icons.close,
                  color: Colors.pink,
                  size: 22,
                ))
          ],
        ),
      ),
    );
  }
}
