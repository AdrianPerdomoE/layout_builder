class PasswordOptions {
  int length;
  bool uppercase;
  bool lowercase;
  bool numbers;
  bool symbols;
  int minLength;

  PasswordOptions({
    required this.length,
    required this.uppercase,
    required this.lowercase,
    required this.numbers,
    required this.symbols,
    required this.minLength,
  });
}
