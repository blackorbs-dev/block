import 'package:block/core/theme/extensions.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../navigation/routes.dart';
import '../shared/components/svg_icon.dart';

class GetStartedScreen extends StatelessWidget{
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colors.black,
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 38),
                child: SvgPicture.asset('assets/images/logo.svg'),
              ),
              Image.asset('assets/images/map.png'),
              Spacer(),
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 32),
                  child: Column(
                    children: [
                      RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Unlock the power of spending your ',
                                    style: context.theme.textTheme.headlineSmall
                                        .withColor(context.theme.colors.midGrey)
                                ),
                                TextSpan(
                                    text: 'Digital Assets.',
                                    style: context.theme.textTheme.titleLarge
                                        .withColor(context.theme.colors.white)
                                )
                              ]
                          )
                      ).animate().fadeIn(duration: 400.ms).moveY(begin: 20, curve: Curves.easeOut),
                      const SizedBox(height: 16),
                      ActionCard(
                          title: 'Join block',
                          icon: 'assets/icons/ic_user_add.svg',
                          color: context.theme.colors.white,
                          onTap: () => context.push(Route.signup)
                      ).animate().fadeIn(duration: 500.ms, delay: 350.ms)
                          .slideY(begin: 0.2, curve: Curves.easeOut),
                      ActionCard(
                          title: 'Log in',
                          icon: 'assets/icons/ic_arrow_right_square.svg',
                          color: context.theme.colors.lightGrey,
                          onTap: () => context.push(Route.login)
                      ).animate().fadeIn(duration: 600.ms, delay: 600.ms)
                          .slideY(begin: 0.2, curve: Curves.easeOut),
                    ]
                  )
              )
            ]
          )
      )
    );
  }

}

class ActionCard extends StatelessWidget{
  const ActionCard({super.key, required this.title, required this.icon, required this.color, required this.onTap});

  final String title;
  final String icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      radius: 8,
      child: Card(
          color: color,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 14, top: 22),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgIcon(icon, size: 40),
                        SizedBox(height: 10),
                        Text(
                            title,
                            style: context.theme.textTheme.bodyMedium.withColor(context.theme.colors.darkGrey)
                        )
                      ]
                  ),
                )
              ]
          )
      )
    );
  }
}