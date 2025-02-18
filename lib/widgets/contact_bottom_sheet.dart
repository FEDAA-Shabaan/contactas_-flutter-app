import 'dart:io';

import 'package:contcts_flutter_app/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../core/app_assets.dart';
import '../core/app_colors.dart';
import '../core/validations.dart';
import '../model/contact_model.dart';

class AddContactBottomSheet extends StatefulWidget {
  final VoidCallback onAddContact;

  AddContactBottomSheet({super.key, required this.onAddContact});

  @override
  State<AddContactBottomSheet> createState() => _AddContactBottomSheetState();
}

class _AddContactBottomSheetState extends State<AddContactBottomSheet> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Container(
                    padding: pickedImage == null
                        ? EdgeInsets.all(8)
                        : EdgeInsets.all(0),
                    margin: EdgeInsets.all(15),
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColors.white, width: 2),
                    ),
                    child: pickedImage == null
                        ? InkWell(
                            onTap: () async {
                              final pickedFile = await picker.pickImage(
                                  source: ImageSource.gallery);
                              if (pickedFile != null) {
                                setState(() {
                                  pickedImage = File(pickedFile.path);
                                });
                              }
                            },
                            child: Lottie.asset(AppImages.imagePicker),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.file(
                              pickedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: emailController,
                        builder: (context, value, child) {
                          return Text(
                              value.text.isEmpty ? "your email" : value.text);
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: .5,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: nameController,
                        builder: (context, value, child) {
                          return Text(
                              value.text.isEmpty ? "your name" : value.text);
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: .5,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: phoneController,
                        builder: (context, value, child) {
                          return Text(
                              value.text.isEmpty ? "phone Number" : value.text);
                        },
                      )
                    ],
                  ),
                ],
              ),
              CustomTextFiled(
                type: TextInputType.emailAddress,
                controller: emailController,
                text: "Enter your email",
                validator: (value) => Validation.validateEmail(value),
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFiled(
                type: TextInputType.name,
                controller: nameController,
                text: "Enter your name",
                validator: (value) => Validation.validateEmptyName(value),
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFiled(
                type: TextInputType.phone,
                controller: phoneController,
                text: "Enter your phone number",
                validator: (value) => Validation.validatePhone(value),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    addContactItem();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Enter User",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  addContactItem() {
    if (formKey.currentState!.validate()) {
      ContactModel.contacts.add(ContactModel(
          username: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          image: pickedImage));
    }
    widget.onAddContact();
    Navigator.pop(context);
  }
}
