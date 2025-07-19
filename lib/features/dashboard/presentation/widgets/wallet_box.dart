import 'package:block/core/theme/extensions.dart';
import 'package:block/features/shared/components/svg_icon.dart';
import 'package:flutter/material.dart';

class WalletBox extends StatelessWidget{
  const WalletBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.colors.darkGrey,
      padding: const EdgeInsets.only(top: 32, bottom: 24),
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgIcon('assets/icons/ic_bank_note.svg', size: 16,),
              const SizedBox(width: 4),
              Text(
                'Wallet Balance',
                style: context.theme.textTheme.labelLarge
                  .withColor(context.theme.colors.midGrey),
              )
            ]
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 32),
            child: Text(
              '\$1,000',
              style: context.theme.textTheme.headlineMedium
                .withColor(context.theme.colors.white),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 38),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: context.theme.colors.black80,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WalletItem(
                  onTap: (){},
                  title: 'Deposit',
                  icon: 'assets/icons/ic_arrow_down_square.svg',
                ),
                WalletItem(
                  onTap: (){},
                  title: 'Withdraw',
                  icon: 'assets/icons/ic_arrow_top_square.svg',
                ),
                WalletItem(
                  onTap: (){},
                  title: 'Swap',
                  icon: 'assets/icons/ic_swap.svg',
                ),
              ],
            ),
          )
        ]
      ),
    );
  }

}

class WalletItem extends StatelessWidget{
  const WalletItem({super.key, required this.onTap, required this.title, required this.icon});

  final String title;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SvgIcon(icon),
          const SizedBox(height: 6),
          Text(
            title,
            style: context.theme.textTheme.labelMedium
              .withColor(context.theme.colors.white),
          )
        ],
      )
    );
  }

}