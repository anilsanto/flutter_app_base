class AppString {
  static Map<String, String> _resource = {
    'app_title': 'My App',
    
  };

  static String getText(String text) {
    if (_resource[text] != null) return _resource[text];
    return text;
  }
}