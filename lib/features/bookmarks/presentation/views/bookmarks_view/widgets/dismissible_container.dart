import 'package:flutter/material.dart';
import 'package:job_hub/core/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hub/core/widgets/text_styles/app_style.dart';

class DismissibleContainer extends StatelessWidget {
  const DismissibleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 4, right: 4),
        decoration: BoxDecoration(
          color: Color(kOrange.value),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              size: 30,
              Icons.delete,
              color: Colors.white,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Delete',
              style: appStyle(
                15,
                Color(kLight.value),
                FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
