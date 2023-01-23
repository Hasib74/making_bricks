import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class CategoryNameWidget extends StatelessWidget {
  String? name;

  CategoryNameWidget({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: AppColors.shadowColor,
      borderRadius: BorderRadius.circular(45),
      elevation: 5,
      child: Container(
        height: 25,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(45),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              name!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      ),
    );
  }
}
