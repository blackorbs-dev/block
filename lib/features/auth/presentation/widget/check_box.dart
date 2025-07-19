import 'package:block/core/theme/extensions.dart';
import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget{
  const CheckBox({super.key, required this.onChanged, required this.value});

  final bool value;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 18,
      child: Checkbox(
          value: value,
          activeColor: context.theme.colors.navyBlue,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)
          ),
          side: BorderSide(color: context.theme.colors.midGrey),
          onChanged: onChanged
      ),
    );
  }

}