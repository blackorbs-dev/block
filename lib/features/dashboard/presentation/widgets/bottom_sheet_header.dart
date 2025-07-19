import 'package:block/core/theme/extensions.dart';
import 'package:block/features/shared/components/svg_icon.dart';
import 'package:flutter/cupertino.dart';

class BottomSheetHeader extends StatelessWidget{
  const BottomSheetHeader({super.key, this.icon, required this.title, required this.subtitle});

  final String? icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 36,), child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if(icon != null) Container(
          width: 48, height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.theme.colors.blueBackground
          ),
          child: Center(child: SvgIcon(icon!, size: 16,)),
        ),
        const SizedBox(height: 8,),
        Text(
          title, style: context.theme.textTheme.bodyLarge
            .withColor(context.theme.colors.darkGrey),
          textAlign: TextAlign.center,
        ),
        Text(
          subtitle, style: context.theme.textTheme.labelLarge
            .withColor(context.theme.colors.mutedGrey),
          textAlign: TextAlign.center,
        )
      ],
    ));
  }

}