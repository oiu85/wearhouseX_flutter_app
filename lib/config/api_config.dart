class ApiConfig {
  ApiConfig._();

  // Update this to match your backend URL
  // For local development: 'http://localhost:8000/api'
  // For production: your production API URL
  static const String baseUrl = 'http://10.67.217.100:8000/api';

  // AUTH ENDPOINTS
  static const String driverLogin = '/driver/login';
  static const String logout = '/logout';
  static const String me = '/me';
  static const String forgotPassword = '/forgot-password';

  // STOCK ENDPOINTS
  static const String driverMyStock = '/driver/my-stock';

  // DRIVER STATS ENDPOINTS
  static const String driverStats = '/driver/stats';

  // SALES ENDPOINTS
  static const String createSale = '/sales';
}
