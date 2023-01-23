import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_dimension.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final title;
  final RoundedLoadingButtonController? roundedLoadingButtonController;
  final double? width;
  final double? height;
  final double? radius;
  final Color? backgroundColor;
  final double? elevation;
  final EdgeInsets? padding;
  final bool? isAnimated;

  const AppButton(
      {Key? key,
      required this.onTap,
      required this.title,
      this.width,
      this.height,
      this.radius,
      this.backgroundColor,
      this.elevation,
      this.padding,
      this.roundedLoadingButtonController,
      this.isAnimated: false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;

    if (isAnimated!) {
      return Container(
        height: height ?? AppDimension.buttonHeight,
        width: width ?? _width * 0.9,
        child: RoundedLoadingButton(
          color: AppColors.primaryColor,
          child: Padding(
            padding: padding ?? EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: PhysicalModel(
              borderRadius: BorderRadius.all(Radius.circular(
                  radius ?? AppDimension.textFiledBorderRadious)),
              elevation: elevation ?? 5,
              color: AppColors.shadowColor,
              child: Container(
                decoration: BoxDecoration(
                    color: backgroundColor ?? AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(
                        radius ?? AppDimension.textFiledBorderRadious))),
                height: height ?? AppDimension.buttonHeight,
                width: width ?? _width * 0.9,
                child: Center(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          onPressed: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              currentFocus.focusedChild?.unfocus();
            }
            onTap();
          },
          controller: roundedLoadingButtonController!,
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild?.unfocus();
          }
          onTap();
        },
        child: Padding(
          padding: padding ?? EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: PhysicalModel(
            borderRadius: BorderRadius.all(
                Radius.circular(radius ?? AppDimension.textFiledBorderRadious)),
            elevation: elevation ?? 5,
            color: AppColors.shadowColor,
            child: Container(
              decoration: BoxDecoration(
                  color: backgroundColor ?? AppColors.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(
                      radius ?? AppDimension.textFiledBorderRadious))),
              height: height ?? AppDimension.buttonHeight,
              width: width ?? _width * 0.9,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
