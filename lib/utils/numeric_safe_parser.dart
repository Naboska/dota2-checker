num? numericSafeParser(String? str) {
  try {
    return str != null ? num.parse(str) : null;
  } catch (_) {
    return null;
  }
}