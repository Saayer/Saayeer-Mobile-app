import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saayer/core/utils/theme/saayer_theme.dart';

class DropDownMenuWidget extends StatelessWidget {
  final String? selectedValue;
  final String hint;
  final validator;
  final List<String> items;
  final void Function(String?)? onChanged;

  const DropDownMenuWidget(
      {Key? key,
      required this.selectedValue,
      required this.hint,
      required this.items,
      required this.onChanged,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: FormField<String>(
        validator: validator,
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              hintText: hint,
              counterText: "",
              hintStyle:
                  TextStyle(fontSize: 14, color: SaayerTheme().getColorsPalette.greyColor),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            isEmpty: selectedValue == null,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue,
                isDense: true,
                onChanged: onChanged,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: SaayerTheme().getColorsPalette.blackTextColor,
                  size: 25,
                ),
                dropdownColor: SaayerTheme().getColorsPalette.whiteColor,
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: GoogleFonts.roboto(
                        color: SaayerTheme().getColorsPalette.blackTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
