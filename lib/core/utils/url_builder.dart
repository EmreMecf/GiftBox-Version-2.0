class UrlBuilder {
  // Google Shopping URL'sini oluşturur
  static String buildGoogleShoppingUrl(String productName) {
    final encodedProductName = Uri.encodeComponent(productName);
    return 'https://www.google.com/search?tbm=shop&q=$encodedProductName';
  }
}
