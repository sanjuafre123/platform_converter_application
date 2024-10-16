import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/provider/theme_controller.dart';
import 'package:provider/provider.dart';

class MyCupertinoTextField extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;
  final IconData icons;
  final TextInputType? textInputType;

  const MyCupertinoTextField({
    super.key,
    required this.placeholder,
    required this.controller,
    required this.icons,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 11),
      placeholderStyle: const TextStyle(color: CupertinoColors.systemGrey),
      placeholder: placeholder,
      keyboardType: textInputType,
      style: TextStyle(
        color: Provider.of<ThemeController>(context).isDark
            ? CupertinoColors.white
            : CupertinoColors.black,
      ),
      controller: controller,
      prefix: Padding(
        padding: const EdgeInsets.only(left: 7),
        child: Icon(icons),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: (Provider.of<ThemeController>(context).isDark)
              ? CupertinoColors.white
              : CupertinoColors.darkBackgroundGray,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
