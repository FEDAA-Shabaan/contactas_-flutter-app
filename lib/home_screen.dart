import 'package:contcts_flutter_app/widgets/contact_bottom_sheet.dart';
import 'package:contcts_flutter_app/widgets/contact_item.dart';
import 'package:contcts_flutter_app/widgets/placeholder_widget.dart';
import 'package:flutter/material.dart';

import 'core/app_assets.dart';
import 'core/app_colors.dart';
import 'model/contact_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset(
            "assets/images/logo.png",
            height: 38,
            width: 117,
          ),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ContactModel.contacts.isEmpty
            ? PlaceholderWidget()
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.56,
                ),
                itemBuilder: (context, index) {
                  return ContactItem(
                    contact: ContactModel.contacts[index],
                    deleteContactItemByIndex: () =>
                        deleteContactItemByIndex(index),
                  );
                },
                itemCount: ContactModel.contacts.length,
              ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: ContactModel.contacts.isNotEmpty,
            child: FloatingActionButton(
              onPressed: () {
                deletAllContract();
              },
              backgroundColor: AppColors.red,
              child: Icon(
                Icons.delete,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(height: 10),
          Visibility(
            visible: !(ContactModel.contacts.length >= 6),
            child: FloatingActionButton(
              onPressed: () {
                showContactModelSheet();
              },
              backgroundColor: AppColors.white,
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  void showContactModelSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColors.primaryColor,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: AddContactBottomSheet(
            onAddContact: () {
              setState(() {});
            },
          ),
        );
      },
    );
  }

  deleteContactItemByIndex(int index) {
    ContactModel.contacts.removeAt(index);
    setState(() {});
  }

  void deletAllContract() {
    ContactModel.contacts.clear();
    setState(() {});
  }
}
