// 验证长度
String valLength(String v, String named, int minLen, int maxLen) {
  if (v.length < minLen) {
    return 'The length is between $minLen and $maxLen digits.';
  }
  if (v.length > maxLen) {
    return 'The length is between $minLen and $maxLen digits.';
  }
  return null;
}
