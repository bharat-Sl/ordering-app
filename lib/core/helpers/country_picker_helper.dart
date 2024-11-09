import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:ordering/core/utils/constants.dart';

void countryCodeBottomSheet(Function callBack, bool showPhoneCode) {
  var border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.shade300,
      ),
      borderRadius: BorderRadius.circular(4));

  return showCountryPicker(
    context: Constants.navigatorKey.currentContext!,
    showPhoneCode: showPhoneCode,

    // countryFilter: countryFilters,
    countryListTheme: CountryListThemeData(
      flagSize: 25,
      backgroundColor: const Color(0xffeeeeee),
      textStyle: const TextStyle(
        fontSize: 16,
      ),
      bottomSheetHeight:
          Constants.navigatorKey.currentContext!.size!.height / 1.6,
      // Optional. Country list modal height
      //Optional. Sets the border radius for the bottomsheet.
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),

      //Optional. Styles the search field.
      inputDecoration: InputDecoration(
          hintText: 'Search here',
          hintStyle: const TextStyle(
            color: Color(0xffC4C4C4),
            fontSize: 14,
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          border: border,
          focusedBorder: border,
          errorBorder: border,
          enabledBorder: border),
    ),
    onSelect: (country) => callBack(country),
  );
}
