import 'package:block/core/theme/extensions.dart';
import 'package:block/features/shared/components/svg_icon.dart';
import 'package:flutter/cupertino.dart';

class EmptyBox extends StatelessWidget{
  const EmptyBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
          SvgIcon('assets/icons/ic_notebook.svg', size: 72),
          Text(
            'No transaction history found',
            style: context.theme.textTheme.labelLarge
              .withColor(context.theme.colors.mutedGrey),
          ),
          Text(
            'Fund your wallet and make some transaction',
            style: context.theme.textTheme.labelSmall
                .withColor(context.theme.colors.greyAccent),
          ),
        ],
      ),
    );
  }

}