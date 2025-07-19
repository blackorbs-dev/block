import 'package:block/core/theme/extensions.dart';
import 'package:block/features/shared/components/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomSheetContainer extends StatelessWidget{
  const BottomSheetContainer({super.key,  required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 10,
          right: 10,
          child: IconButton.filled(
              onPressed: context.pop,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(context.theme.colors.lightGrey),
              ),
              icon: SvgIcon('assets/icons/ic_close_circle.svg')
          )
        )
      ],
    );
  }

}