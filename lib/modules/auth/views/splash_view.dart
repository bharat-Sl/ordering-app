import 'package:flutter/material.dart';
import 'package:ordering/core/utils/assets.dart';
import 'package:ordering/modules/auth/views/phone_entry_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const PhoneEntryView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffdd2f6e),
      body: Center(
          child: Image.asset(
        Assets.logoBG,
        height: 200,
        color: Colors.white,
      )),
    );
  }
}
