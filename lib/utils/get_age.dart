
int getAge(DateTime date) {
  return DateTime.now().difference(date).inDays ~/ 365;
}