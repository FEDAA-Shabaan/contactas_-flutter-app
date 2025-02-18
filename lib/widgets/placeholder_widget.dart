
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core/app_assets.dart';
import '../core/app_colors.dart';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppImages.emptyList),
          const SizedBox(
            height: 8,
          ),
          const Text("There is No Contacts Added Here"
          ,style: TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),),
        ],
      ),
    );
  }
}
