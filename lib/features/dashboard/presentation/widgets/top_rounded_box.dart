import 'package:block/core/theme/extensions.dart';
import 'package:flutter/cupertino.dart';

class TopRoundedBox extends StatelessWidget{
  const TopRoundedBox({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      child: child,
    );
  }

}