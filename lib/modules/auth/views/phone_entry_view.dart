import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:ordering/core/helpers/country_picker_helper.dart';
import 'package:ordering/core/utils/assets.dart';

import 'otp_entry_view.dart';

class PhoneEntryView extends StatefulWidget {
  const PhoneEntryView({super.key});

  @override
  State<PhoneEntryView> createState() => _PhoneEntryViewState();
}

class _PhoneEntryViewState extends State<PhoneEntryView> {
  Country selectedCountry = Country.from(json: {
    "e164_cc": "91",
    "iso2_cc": "IN",
    "e164_sc": 0,
    "geographic": true,
    "level": 1,
    "name": "India",
    "example": "9123456789",
    "display_name": "India (IN) [+91]",
    "full_example_with_plus_sign": "+919123456789",
    "display_name_no_e164_cc": "India (IN)",
    "e164_key": "91-IN-0"
  });

  void setCountry({required Country country}) {
    selectedCountry = country;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeeeeee),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 46, left: 14, right: 14, bottom: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
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
                  const Text(
                    "Enter your number below. You'll receive an SMS with a One Time PIN.",
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
                        "Mobile Number",
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffbbbbbb)),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color(0xffeeeeee),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                countryCodeBottomSheet((Country country) {
                                  setCountry(country: country);
                                }, true);
                              },
                              child: Container(
                                width: 54,
                                height: 38,
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: const Color(0xffdddddd),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                    child: Text(
                                  "+${selectedCountry.phoneCode}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff444444),
                                  ),
                                )),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                cursorHeight: 20,
                                cursorColor: const Color(0xffbbbbbb),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff444444),
                                ),
                                decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: "Mobile Number",
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xffbbbbbb),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const OTPEntryView()));
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
                          "SEND OTP",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.logoBG,
                      height: 40,
                      color: Color(0xffdd2f6e),
                    ),
                    SizedBox(width: 5),
                    Text(
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
      ),
    );
  }
}
