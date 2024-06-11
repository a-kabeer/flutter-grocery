import 'package:flutter/material.dart';
import 'package:grocerystacked/utils/app_color.dart';

class GlobalElevatedButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final double? buttonRadius;
  final Icon? icon;
  const GlobalElevatedButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.buttonRadius,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: 50,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColor.primary),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius ?? 25),
          )),
        ),
        onPressed: onPressed,
        icon: icon,
        label: Text(
          buttonText,
          style: TextStyle(color: AppColor.onPrimary),
        ),
      ),
    );
  }
}
