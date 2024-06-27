import 'package:flutter/material.dart';
import '../../../../consts/colors.dart';

enum Gender { male, female, other }

class GenderDropdown extends StatefulWidget {
  final bool isEditable;

  const GenderDropdown({Key? key, required this.isEditable}) : super(key: key);

  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  Gender? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonFormField<Gender>(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: greyColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: greyColor),
          ),
          filled: true,
          fillColor: whiteColor,

        ),

        value: _selectedGender,
        onChanged: widget.isEditable ? (Gender? newValue) {
          setState(() {
            _selectedGender = newValue;
          });
        } : null, // Disable changing the value if not editable
        items: Gender.values.map((Gender classType) {
          return DropdownMenuItem<Gender>(
            value: classType,
            child: Text(classType.toString().split('.').last),
          );
        }).toList(),
      ),
    );
  }
}
