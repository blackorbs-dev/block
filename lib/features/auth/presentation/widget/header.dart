import 'package:block/core/theme/extensions.dart';
import 'package:block/features/shared/components/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeaderBox extends StatelessWidget{
  const HeaderBox({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 28),
            child: IconButton(
                onPressed: context.pop,
                padding: EdgeInsets.zero,
                style: ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap
                ),
                constraints: BoxConstraints(),
                icon: SvgIcon('assets/icons/ic_arrow_back.svg')
            )
        ),
        Text(
          title,
          style: context.theme.textTheme.headlineSmall
            .withColor(context.theme.colors.darkGrey),
        ),
        Text(
          subtitle,
          style: context.theme.textTheme.bodySmall
              .withColor(context.theme.colors.mutedGrey),
        ),
        SizedBox(height: 36)
      ]
    );
  }

}