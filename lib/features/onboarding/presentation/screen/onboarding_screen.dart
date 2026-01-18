import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_test_app/core/config/app_palette.dart';
import 'package:iot_test_app/core/helpers/extension.dart';
import 'package:iot_test_app/core/routing/routes.dart';
import 'package:iot_test_app/core/theming/text_styles_manager.dart';
import 'package:iot_test_app/core/widgets/app_padding.dart';
import 'package:iot_test_app/core/widgets/custom_button.dart';
import 'package:iot_test_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final ValueNotifier<double> _pageNotifier = ValueNotifier(0.0);

  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page != null) {
        _pageNotifier.value = _pageController.page!;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ValueListenableBuilder<double>(
              valueListenable: _pageNotifier,
              builder: (context, value, child) {
                final pageIndex = _pageController.hasClients
                    ? _pageController.page!.toInt()
                    : 0;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(onboardingPages[pageIndex].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(color: Colors.black.withOpacity(0.5)),
                );
              },
            ),
            // -------------------------
            // PageView content
            // -------------------------
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: onboardingPages.length,
                    itemBuilder: (context, index) {
                      final page = onboardingPages[index];
                      return Padding(
                        padding: paddingHorizontal(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              page.title,
                              style: TextStylesManager.headline1(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            16.0.height,
                            Text(
                              page.subtitle,
                              style: TextStylesManager.bodyMedium(
                                color: Colors.white70,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                    onPageChanged: (index) {
                      _pageNotifier.value = index.toDouble();
                    },
                  ),
                ),
                Padding(
                  padding: paddingHorizontal(24),
                  child: Column(
                    children: [
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: onboardingPages.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: AppPalette.primaryColor,
                          dotColor: Colors.white38,
                          dotHeight: 8.h,
                          dotWidth: 8.w,
                          spacing: 6.w,
                        ),
                      ),
                      20.0.height,
                      SizedBox(
                        width: double.infinity,
                        height: 55.h,
                        child: CustomButton.filled(
                          onPressed: () {
                            if (_pageController.page!.toInt() ==
                                onboardingPages.length - 1) {
                              context.pushReplacementNamed(Routes.loginScreen);
                              return;
                            }
                            _pageController.animateToPage(
                              _pageController.page!.toInt() + 1,
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.easeInOut,
                            );
                          },
                          backgroundColor: AppPalette.primaryColor,
                          child: Text(
                            'التالي',
                            style: TextStylesManager.button(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      10.0.height,
                      SizedBox(
                        width: double.infinity,
                        height: 55.h,
                        child: CustomButton.filled(
                          onPressed: () {
                            context.pushReplacementNamed(Routes.loginScreen);
                          },
                          backgroundColor: AppPalette.primaryColor,
                          child: Text(
                            'تخطي',
                            style: TextStylesManager.button(
                              color: AppPalette.whiteColor,
                            ),
                          ),
                        ),
                      ),
                      20.0.height,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
