import 'package:block/core/theme/extensions.dart';
import 'package:block/features/shared/components/svg_icon.dart';
import 'package:block/features/dashboard/presentation/widgets/empty_box.dart';
import 'package:block/features/dashboard/presentation/widgets/quote_box.dart';
import 'package:block/features/dashboard/presentation/widgets/wallet_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/dashboard_bloc.dart';

class DashboardScreen extends StatelessWidget{
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 16, left: 12, right: 12),
                  child: Row(
                    children: [
                      SvgIcon('assets/icons/ic_user.svg', size: 32),
                      const SizedBox(width: 6),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back', style: context.theme.textTheme.labelLarge
                              .withColor(context.theme.colors.midGrey),
                          ),
                          BlocSelector<DashboardBloc, DashboardState, String>(
                              selector: (state) => state.user.name??'Jamiu',
                              builder: (context, name) => Text(
                                name, style: context.theme.textTheme.bodyMedium
                                  .withColor(context.theme.colors.darkGrey),
                              )
                          )
                        ],
                      ),
                      const Spacer(),
                      SvgIcon('assets/icons/ic_bell.svg'),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: context.theme.colors.darkGrey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '100', style: context.theme.textTheme.labelLarge
                                .withColor(context.theme.colors.white),
                            ),
                            const SizedBox(width: 4),
                            SvgIcon('assets/icons/ic_star_circle.svg')
                          ],
                        )
                      )
                    ],
                  ),
              ),
              const WalletBox(),
              const QuoteBox(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Transaction History', style: context.theme.textTheme.bodySmall
                            .withColor(context.theme.colors.darkGrey),
                        ),
                        Text(
                          'Showing your wallet history', style: context.theme.textTheme.labelSmall
                            .withColor(context.theme.colors.mutedGrey),
                        )
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: (){},
                        child: Row(
                          children: [
                            Text(
                              'View all', style: context.theme.textTheme.labelMedium
                                .withColor(context.theme.colors.navyBlue),
                            ),
                            SizedBox(width: 4,),
                            SvgIcon('assets/icons/ic_arrow_right.svg', size: 12,)
                          ],
                        )
                    )
                  ],
                ),
              ),
              const EmptyBox()
            ],
          )
      ),
    );
  }

}