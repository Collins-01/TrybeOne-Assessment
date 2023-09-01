import 'package:flutter/material.dart';
import 'package:trybeone_assessment/extensions/extensions.dart';
import 'package:trybeone_assessment/presentation/widgets/widgets.dart';
import 'package:trybeone_assessment/utils/utils.dart';

class AppLongButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const AppLongButton({Key? key, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: context.getDeviceWidth,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        child: AppText.bodyLarge(
          title,
          color: Colors.white,
        ),
      ),
    );
  }
}

class AppShortButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const AppShortButton({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        width: 180,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        alignment: Alignment.center,
        child: AppText.bodyLarge(
          title,
          color: Colors.white,
        ),
      ),
    );
  }
}
