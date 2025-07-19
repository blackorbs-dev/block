import 'dart:async';

import 'package:block/core/theme/extensions.dart';
import 'package:block/features/shared/components/primary_button.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../navigation/routes.dart';
import 'model.dart';

class OnboardingScreen extends StatefulWidget{
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>{
  final PageController _controller = PageController();
  int _currentPage = 0;
  late Timer _timer;

  final onboardingData = [
    const OnboardingItem(
      image: 'assets/images/wallet.png',
      title: 'One-stop app for your digital assets',
      subtitle: 'Never run out of Cash, Trade your Cryptocurrencies at any time.',
    ),
    const OnboardingItem(
      image: 'assets/images/gift_cards.png',
      title: 'Sell prepaid and gift cards for instant cash',
      subtitle: 'Our commitment is to ensure your satisfaction by providing you the best market rate for all transactions.',
    ),
    const OnboardingItem(
      image: 'assets/images/pay_bills.png',
      title: 'Fastest way to Pay all your bills',
      subtitle: 'Pay for utilities bills such airtime, data, TV subscriptions, electricity, etc.',
    ),
    const OnboardingItem(
      image: 'assets/images/secure.png',
      title: 'Safe and Secure',
      subtitle: 'Your information, crypto and gift cards are safe and secure with us.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                        controller: _controller,
                        onPageChanged: _onPageChanged,
                        itemCount: onboardingData.length,
                        itemBuilder: (_, index){
                          final item = onboardingData[index];
                          return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ColoredBox(
                                  color: context.theme.colors.lighterGrey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(26, 48, 26, 26),
                                        child: Text(
                                          item.title,
                                          textAlign: TextAlign.center,
                                          style: context.theme.textTheme.headlineSmall
                                              .withColor(context.theme.colors.darkGrey),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 402,
                                        child: Padding(
                                          padding: EdgeInsets.all(index == 3 ? 34 : 0),
                                          child: Image.asset(item.image),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 28, top: 40, right: 28,),
                                  child: Text(
                                    item.subtitle,
                                    textAlign: TextAlign.center,
                                    style: context.theme.textTheme.bodySmall
                                    .withColor(context.theme.colors.mutedGrey),
                                  ),
                                ),
                              ]
                          );
                        }
                    )
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: onboardingData.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: context.theme.colors.darkGrey,
                    dotColor: context.theme.colors.lightGrey,
                    dotHeight: 6,
                    dotWidth: 12,
                    radius: 6,
                    expansionFactor: 2,
                    spacing: 4,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(20,24,20,32),
                    child: PrimaryButton(
                        text: 'Get Started',
                        onPressed: () => context.go(Route.getStarted)
                    ),
                )
              ]
          ),
        )
    );
  }


  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_controller.hasClients) {
        int nextPage = (_currentPage + 1) % onboardingData.length;
        _controller.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _onPageChanged(nextPage);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

}