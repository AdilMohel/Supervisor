import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:supervisior_anbar/consts/consts.dart';
import '../../consts/colors.dart';
import '../../consts/styles.dart';
import '../../widget_common/our_button.dart';
import 'components/text_field/email_widget.dart';
import 'components/text_field/text_field_entry.dart';
import 'components/text_field/text_field_number.dart';
import 'components/text_field/text_name_field.dart';

enum Gender { male, female, other }

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  String? _imageUrl;
  final picker = ImagePicker();
  bool isEditable = false;  // State to manage if the fields are editable
  String buttonText = 'Update'; // Initial button text

  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  Gender? selectedGender;

  var maskFormatter = MaskTextInputFormatter(
      mask: '(###) ###-####',
      filter: {"#": RegExp(r'[0-9]')}
  );

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    String userId = "user123"; // Replace with the actual user ID or get it from the user authentication state
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userDoc.exists) {
      setState(() {
        firstNameController.text = userDoc['firstName'];
        lastNameController.text = userDoc['lastName'];
        emailController.text = userDoc['email'];
        phoneNumberController.text = userDoc['phoneNumber'];
        selectedGender = Gender.values.firstWhere((e) => e.toString() == userDoc['gender']);
        _imageUrl = userDoc['profileImage'];
      });
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        String downloadURL = await _uploadImageToFirebase(imageFile);
        setState(() {
          _image = imageFile;
          _imageUrl = downloadURL;
        });
      } else {
        print("No image selected.");
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<String> _uploadImageToFirebase(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference = FirebaseStorage.instance.ref().child('profile_images/$fileName');
      UploadTask uploadTask = storageReference.putFile(imageFile);
      TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadURL = await storageTaskSnapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error uploading image: $e');
      return '';
    }
  }

  void _toggleEdit() {
    if (isEditable) {
      // Save data to Firestore
      saveDataToFirestore();
    }
    setState(() {
      isEditable = !isEditable;
      buttonText = isEditable ? 'Save' : 'Update';
    });
  }

  void saveDataToFirestore() {
    String userId = "user123"; // Replace with the actual user ID or get it from the user authentication state
    FirebaseFirestore.instance.collection('users').doc(userId).set({
      'firstName': firstNameController.text,
      'lastName': lastNameController.text,
      'email': emailController.text,
      'phoneNumber': phoneNumberController.text,
      'gender': selectedGender.toString(),
      'profileImage': _imageUrl, // Save the image URL
    }).then((value) {
      print("User data saved successfully");
    }).catchError((error) {
      print("Failed to save user data: $error");
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
                    height: 190,
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
                                'Change Picture',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: regular,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          profileTextField(firstName, bold, 14),
                          profileTextFieldEntry(greyColor, blackColor, isEditable, firstNameController),
                          const SizedBox(height: 20),
                          profileTextField(lastName, bold, 14),
                          profileTextFieldEntry(greyColor, blackColor, isEditable, lastNameController),
                          const SizedBox(height: 20),
                          profileTextField(email, bold, 14),
                          EmailInputField(controller: emailController, isEditable: isEditable),
                          const SizedBox(height: 20),
                          profileTextField(phoneNumber, bold, 14),
                          phoneTextFieldEntry(greyColor, blackColor, maskFormatter, isEditable, phoneNumberController),
                          const SizedBox(height: 20),
                          profileTextField(gender, bold, 14),
                          GenderDropdown(
                            isEditable: isEditable,
                            selectedGender: selectedGender,
                            onChanged: (Gender? newValue) {
                              setState(() {
                                selectedGender = newValue;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: ourButton(
                              onPress: _toggleEdit,
                              color: primaryColor,
                              textColor: whiteColor,
                              title: buttonText,
                            ),
                          ),
                        ]
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Center(
                  child: GestureDetector(
                    onTap:_pickImage,
                    child: CircleAvatar(
                      radius: 71,
                      backgroundColor: whiteColor,
                      child: CircleAvatar(
                        radius: 69,
                        backgroundImage: _imageUrl != null ? NetworkImage(_imageUrl!) : null,
                        child: _imageUrl == null
                            ? const Icon(Icons.add_photo_alternate, size: 50)
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}

class GenderDropdown extends StatefulWidget {
  final bool isEditable;
  final Gender? selectedGender;
  final ValueChanged<Gender?> onChanged;

  const GenderDropdown({Key? key, required this.isEditable, required this.selectedGender, required this.onChanged}) : super(key: key);

  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  Gender? _selectedGender;

  @override
  void initState() {
    super.initState();
    _selectedGender = widget.selectedGender;
  }

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
            widget.onChanged(newValue);
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

