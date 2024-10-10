class UrlBuilder {
  // Google Shopping URL'sini oluşturur
  static String buildGoogleShoppingUrl(List<String> keywords) {
    final encodedKeywords = Uri.encodeComponent(keywords.join(' '));
    return 'https://www.google.com/search?tbm=shop&q=$encodedKeywords';
  }
}
