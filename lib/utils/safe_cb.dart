safeCb(dynamic checkValue, Function test) {
  if (checkValue != null) return test;
  return null;
}