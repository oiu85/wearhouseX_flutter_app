class ApiConfig {
  ApiConfig._();

  // Update this to match your backend URL
  // For local development: 'http://localhost:8000/api'
  // For production: your production API URL
  static const String baseUrl = 'http://10.95.138.100:8000/api';

  // AUTH ENDPOINTS
  static const String driverLogin = '/driver/login';
  static const String logout = '/logout';
  static const String me = '/me';
  static const String forgotPassword = '/driver/forgot-password';
  static const String resetPassword = '/driver/reset-password';

  // STOCK ENDPOINTS
  static const String driverMyStock = '/driver/my-stock';
  static const String stockDetail = '/driver/my-stock'; // /{productId}
  static const String stockStatistics = '/driver/my-stock/statistics';

  // DRIVER STATS ENDPOINTS
  static const String driverStats = '/driver/stats';

  // SALES ENDPOINTS
  static const String createSale = '/sales';
  static const String getSales = '/sales';
  static const String getSaleDetail = '/sales'; // /{id}
  static const String salesStatistics = '/driver/sales/statistics';
  static const String getInvoicePdf = '/sales'; // /{id}/invoice

  // DASHBOARD ENDPOINTS
  static const String dashboard = '/driver/dashboard';
}
