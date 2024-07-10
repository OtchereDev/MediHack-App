// ignore_for_file: must_be_immutable

import 'package:country_pickers/country.dart';
import 'package:emergency_alert/AppTheme/app_config.dart';
import 'package:emergency_alert/Component/textField.dart';
import 'package:emergency_alert/Provider/Utils/util_provider.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:provider/provider.dart';

String countryCode = "233", countryName = "GH";
Widget _buildDropdownItem(Country country) => Container(
      color: Color(0xffFBFBFB),
      child: Row(
        children: [
          AppSpaces.width8,
          CountryPickerUtils.getDefaultFlagImage(country),
          Text(
            " +${country.phoneCode}",
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );

class PhoneNumberTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  VoidCallback? onIConTap;
  bool? validate;
  bool? remove = false;
  final FocusNode? focus;
  EdgeInsets? padding;
  IconData? icon;
  Function(String)? onValueChange;



  PhoneNumberTextField(
      {required this.controller,
      this.focus,
      this.hintText,
      this.remove,
      this.validate,
      this.icon,
      this.onIConTap,
      this.onValueChange,
      this.padding});

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  @override
  Widget build(BuildContext context) {
    List<Country> list = [
      Country(iso3Code: "GHA", name: "Ghana", isoCode: "GH", phoneCode: "233"),
      // Country(iso3Code: "USA", name: "USA", isoCode: "US", phoneCode: "1"),
      // Country(
      //     iso3Code: "NGA", name: "Nigeria", isoCode: "NG", phoneCode: "234"),
      // Country(
      //     iso3Code: "SEN", name: "Senegal", isoCode: "SE", phoneCode: "221"),
      // Country(iso3Code: "GBR", name: "UK", isoCode: "GB", phoneCode: "44"),
    ];

    return Consumer<UtilPovider>(
      builder: (context, util, _) {
        return Container(
            padding: EdgeInsets.only(left: 4),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 0.6,
                color: Color(0xff889199),
              ),
            ),
            child: Row(
              children: [
                CountryPickerDropdown(
                  initialValue: countryName,
                  itemBuilder: _buildDropdownItem,
                  priorityList: list,
                  itemFilter: (c) => ["GH", "NG", "US", "GB"].contains(c.isoCode),
                  sortComparator: (Country a, Country b) =>
                      a.isoCode.compareTo(b.isoCode),
                  onValuePicked: (Country country) {
                    // util.setCountry(country.isoCode);
                    // util.setCountryNumber(country.phoneCode);
                  },
                ),
                Expanded(
                  flex: 4,
                  child: textFormField(
                      hintText: widget.hintText!,
                      controller: widget.controller,
                      removeBorder: true,
                      focusNode: widget.focus,
                      validate: widget.validate,
                      validateMsg: "Phone number required",
                      isPhone: true,
                      inputType: TextInputType.phone,
                      icon: widget.icon,
                      onIconTap: widget.onIConTap,
                      iconColor: AppColors.PRIMARYCOLOR,
                      onValueChange:widget.onValueChange ,
                      padding: widget.padding),
                )
              ],
            ));
      }
    );
  }
}
