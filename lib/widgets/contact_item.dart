import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core/app_assets.dart';
import '../core/app_colors.dart';
import '../model/contact_model.dart';

class ContactItem extends StatelessWidget {
  final ContactModel contact;
  final Function deleteContactItemByIndex;

  const ContactItem(
      {super.key,
      required this.contact,
      required this.deleteContactItemByIndex});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: AppColors.white,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              contact.image == null
                  ? Lottie.asset(AppImages.emptyList)
                  : AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                          ),
                          child: Image.file(
                            contact.image!,
                            fit: BoxFit.cover,
                          ))),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(contact.username ?? ""),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 8, right: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      contact.email,
                      style: TextStyle(
                          fontSize: 10, overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      contact.phone,
                      style: TextStyle(
                          fontSize: 10, overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      deleteContactItemByIndex();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Delete",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
