import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supervisior_anbar/views/technician/components/text_field/password.dart';
import '../../../consts/colors.dart';
import '../../../consts/strings.dart';
import '../../../consts/styles.dart';
import '../../../widget_common/our_button.dart';
import '../../profile/components/text_field/email_widget.dart';
import '../../profile/components/text_field/text_field_entry.dart';
import '../../profile/components/text_field/text_field_number.dart';
import '../../profile/components/text_field/text_name_field.dart';

enum Gender { male, female, other }

class AddTechnician extends StatefulWidget {
  @override
  _AddTechnicianState createState() => _AddTechnicianState();
}

class _AddTechnicianState extends State<AddTechnician> {
  File? _image;
  File? _cnicFrontImage;
  File? _cnicBackImage;
  final picker = ImagePicker();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController specialityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  Gender? selectedGender;

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print("No image selected.");
    }
  }

  Future<void> _pickCnicImage(bool isFront) async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50, // Optional: reduce image quality to save memory
    );
    if (pickedFile != null) {
      setState(() {
        if (isFront) {
          _cnicFrontImage = File(pickedFile.path);
        } else {
          _cnicBackImage = File(pickedFile.path);
        }
      });
    } else {
      print("No CNIC image selected.");
    }
  }

  var maskFormatter = MaskTextInputFormatter(
      mask: '(###) ###-####',
      filter: {"#": RegExp(r'[0-9]')}
  );

  void _saveTechnicianData() async {
    // Check for required fields
    if (emailController.text.isEmpty ||
        firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        specialityController.text.isEmpty ||
        phoneController.text.isEmpty ||
        selectedGender == null ||
        _image == null ||
        _cnicFrontImage == null ||
        _cnicBackImage == null) {
      _showDialog('Error', 'All fields are required.', false);
      return;
    }

    try {
      // Check for duplicate data
      var querySnapshot = await FirebaseFirestore.instance
          .collection('technicians')
          .where('email', isEqualTo: emailController.text)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Show error dialog for duplicate data
        _showDialog(error, technicianExist, false);
      } else {
        // Save data if no duplicate found
        await FirebaseFirestore.instance.collection('technicians').add({
          'first_name': firstNameController.text,
          'last_name': lastNameController.text,
          'email': emailController.text,
          'password': '******', // Handle password securely
          'speciality': specialityController.text,
          'phone': phoneController.text,
          'gender': selectedGender.toString().split('.').last,
          'cnic_front_image': _cnicFrontImage?.path ?? '',
          'cnic_back_image': _cnicBackImage?.path ?? '',
          'profile_image': _image?.path ?? '',
          'status': true,
        });
        print('Technician data saved successfully');
        _showDialog(success, technicianSuccess, true);
      }
    } catch (e) {
      print('Error saving technician data: $e');
      _showDialog('Error', 'Error saving technician data: $e', false);
    }
  }

  void _showDialog(String title, String content, bool shouldClearFields) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            content,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: whiteColor, backgroundColor: primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                if (shouldClearFields) {
                  _clearFields();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _clearFields() {
    setState(() {
      emailController.clear();
      firstNameController.clear();
      lastNameController.clear();
      specialityController.clear();
      phoneController.clear();
      selectedGender = null;
      _image = null;
      _cnicFrontImage = null;
      _cnicBackImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 120,
                    color: primaryColor,
                  ),
                  Container(
                    child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 90),
                            child: GestureDetector(
                              onTap: _pickImage,
                              child: const Text(
                                changePicture,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: regular,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          profileTextField(firstName, bold, 14),
                          profileTextFieldEntry(greyColor, blackColor, true, firstNameController),
                          const SizedBox(height: 20),
                          profileTextField(lastName, bold, 14),
                          profileTextFieldEntry(greyColor, blackColor, true, lastNameController),
                          const SizedBox(height: 20),
                          profileTextField(email, bold, 14),
                          EmailInputField(controller: emailController, isEditable: true),
                          const SizedBox(height: 20),
                          profileTextField(password, bold, 14),
                          profilePasswordField(greyColor, blackColor, true),
                          const SizedBox(height: 20),
                          profileTextField(speciality, bold, 14),
                          profileTextFieldEntry(greyColor, blackColor, true, specialityController),
                          const SizedBox(height: 20),
                          profileTextField(phoneNumber, bold, 14),
                          phoneTextFieldEntry(greyColor, blackColor, maskFormatter, true, phoneController),
                          const SizedBox(height: 20),
                          profileTextField(gender, bold, 14),
                          GenderDropdown(
                            isEditable: true,
                            onChanged: (Gender? gender) {
                              setState(() {
                                selectedGender = gender;
                              });
                            },
                            value: selectedGender,
                          ),
                          const SizedBox(height: 20),
                          profileTextField(cnic, bold, 14),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () => _pickCnicImage(true), // True for front image
                                  child: Container(
                                    height: 200,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: primaryColor),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: _cnicFrontImage != null
                                        ? Image.file(_cnicFrontImage!, fit: BoxFit.cover)
                                        : Stack(
                                      children: [
                                        Center(
                                          child: Icon(Icons.camera_alt, size: 50),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 80),
                                          child: Center(
                                            child: Text(
                                              cnicfront,
                                              style: TextStyle(
                                                color: greyColor,
                                                fontSize: 12,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  ,
                                ),
                                SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () => _pickCnicImage(false), // False for back image
                                  child: Container(
                                    height: 200,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: primaryColor),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: _cnicBackImage != null
                                        ? Image.file(_cnicBackImage!, fit: BoxFit.cover)
                                        : Stack(
                                      children: [
                                        Center(
                                          child: Icon(Icons.camera_alt, size: 50),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 80),
                                          child: Center(
                                            child: Text(
                                              cnicback,
                                              style: TextStyle(
                                                color: greyColor,
                                                fontSize: 12,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  ,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: ourButton(
                              onPress: _saveTechnicianData,
                              color: primaryColor,
                              textColor: whiteColor,
                              title: save,
                            ),
                          ),
                          const SizedBox(height: 50),
                        ]
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Center(
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 71,
                      backgroundColor: whiteColor,
                      child: CircleAvatar(
                        radius: 69,
                        backgroundImage: _image != null ? FileImage(_image!) : null,
                        child: _image == null
                            ? const Icon(Icons.add_photo_alternate, size: 50)
                            : null,
                      ),
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

class GenderDropdown extends StatelessWidget {
  final bool isEditable;
  final Gender? value;
  final ValueChanged<Gender?> onChanged;

  const GenderDropdown({
    Key? key,
    required this.isEditable,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonFormField<Gender>(
        value: value,
        onChanged: isEditable ? onChanged : null,
        items: Gender.values.map((Gender gender) {
          return DropdownMenuItem<Gender>(
            value: gender,
            child: Text(gender.toString().split('.').last),
          );
        }).toList(),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: greyColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: blackColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: greyColor),
          ),
        ),
      ),
    );
  }
}
