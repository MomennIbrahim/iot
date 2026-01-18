class OnboardingModel {
  final String image;
  final String title;
  final String subtitle;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

final List<OnboardingModel> onboardingPages = [
  OnboardingModel(
    title: "مرحبا بك في Smart Home",
    subtitle: "تحكم في أجهزتك المنزلية بسهولة",
    image: "assets/images/Onboarding1.jpeg",
  ),
  OnboardingModel(
    title: "المراقبة الفورية",
    subtitle: "تابع حالة أجهزتك المنزلية مباشرة",
    image: "assets/images/onbording2.jpg",
  ),
  OnboardingModel(
    title: "الدعم عند عدم الاتصال",
    subtitle: "يمكنك تنفيذ الأوامر حتى بدون إنترنت",
    image: "assets/images/onboarding3.png",
  ),
];
