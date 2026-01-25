abstract class AppRoutes {
  static const String splash = '/';
  static const String onboardingPageOne = '/onboarding/page-one';
  static const String onboardingPageTwo = '/onboarding/page-two';
  static const String signup = '/auth/signup';
  static const String login = '/auth/login';
  static const String forgotPassword = '/auth/forgot-password';
  static const String checkEmail = '/auth/check-email';
  static const String verifyOtp = '/auth/verify-otp';
  static const String resetPassword = '/auth/reset-password';
  static const String home = '/home';
  static const String stock = '/stock';
  static const String stockDetail = '/stock/:id';
  static const String stockDetailByProduct = '/stock/product/:productId';
  static const String createSale = '/sales/create';
  static const String salesHistory = '/sales/history';
  static const String saleDetail = '/sales/:id';
  static const String donate = '/donate';
  static const String campaign = '/campaign';
  static const String catalogDetail = '/subcategories_campaign-detail';
  static const String calculatorType = '/calculator/type';
  static const String zakatCalculator = '/calculator/zakat';
  static const String getKnownUs = '/get-known-us';
  static const String blog = '/blog';
  static const String blogDetail = '/blog/:id';
  static const String payment = '/payment';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String myDonations = '/my-donations';
  static const String mySubscriptions = '/my-subscriptions';
  static const String contactUs = '/contact-us';
  static const String privacyPolicy = '/privacy-policy';
  static const String termsAndConditions = '/terms-and-conditions';
  static const String transparencyFile = '/transparency-file';
  static const String transparencyDonationLog = '/transparency-file/donation-log';
  static const String globalSearch = '/search';
}

