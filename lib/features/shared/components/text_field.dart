import 'package:block/core/theme/extensions.dart';
import 'package:block/features/shared/components/border.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget{
  const TextInputField({super.key, required this.hint, this.initialValue, required this.onChanged, this.inputType, this.prefix});

  final String hint;
  final String? initialValue;
  final Widget? prefix;
  final Function(String value) onChanged;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: context.theme.textTheme.bodySmall
            .withColor(context.theme.colors.darkGrey),
        keyboardType: inputType,
        decoration: InputDecoration(
          isDense: true,
          hintText: hint,
          prefixIcon: prefix,
          hintStyle: context.theme.textTheme.bodySmall
            .withColor(context.theme.colors.midGrey),
          border: outlinedBorder(color: context.theme.colors.mutedGrey),
          enabledBorder: outlinedBorder(color: context.theme.colors.mutedGrey),
          focusedBorder: outlinedBorder(color: context.theme.colors.mutedGrey),
          // contentPadding:
          //     const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        ),
        onChanged: onChanged
    );
  }

}