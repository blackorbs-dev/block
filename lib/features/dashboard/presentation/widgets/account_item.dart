import 'package:block/core/theme/extensions.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/svg_icon.dart';

class AccountItem extends StatelessWidget{
  const AccountItem({super.key, required this.icon, required this.title, required this.subtitle, required this.isDone, required this.onTap});

  final String icon;
  final String title;
  final String subtitle;
  final bool isDone;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDone ? null : onTap,
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 4),
        color: context.theme.colors.lighterGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Row(
            children: [
              SvgIcon(icon, size: 16,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title, style: context.theme.textTheme.bodySmall
                          .withColor(context.theme.colors.darkGrey),
                      ),
                      Text(
                        subtitle, style: context.theme.textTheme.labelLarge
                          .withColor(context.theme.colors.mutedGrey),
                      )
                    ],
                  ),
                )
              ),
              Container(
                width: 32, height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isDone ? context.theme.colors.navyBlue : context.theme.colors.mutedGrey,
                  shape: BoxShape.circle,
                ),
                child: SvgIcon(
                  'assets/icons/ic_check_mark.svg',
                  color: context.theme.colors.white
                ),
              )
            ],
          )
        ),
      ),
    );
  }

}