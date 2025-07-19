import 'package:block/core/theme/extensions.dart';
import 'package:block/features/shared/models/action_state.dart';
import 'package:block/features/dashboard/presentation/blocs/dashboard_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuoteBox extends StatelessWidget{
  const QuoteBox({super.key});

  @override
  Widget build(BuildContext context) {
    final quote = context.select((DashboardBloc bloc) => bloc.state.quote);
    final status = context.select((DashboardBloc bloc) => bloc.state.status);

    return AnimatedSwitcher(
          duration: 600.ms,
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation) {
          return SizeTransition(
              sizeFactor: animation,
              axis: Axis.vertical,
              child: child,
            );
        },
          child: switch(status){
            Success() => Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: context.theme.colors.mutedGrey
                    ),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
              key: ValueKey('success'),
              children: [
                Text(
                  '"${quote.text}"',
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.bodySmall?.copyWith(
                      color: context.theme.colors.darkGrey,
                      height: 1.4
                  ),
                ),
                Text(
                  '- ${quote.author}',
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.labelMedium
                      .withColor(context.theme.colors.mutedGrey),
                )
              ],
            )),
            _ => SizedBox.shrink(key: ValueKey('nothing'),)
            // )
          },
      );
  }

}