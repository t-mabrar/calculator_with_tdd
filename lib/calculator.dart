class StringCalculator {
  /// Adds numbers from a given string input.
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    List<String> delimiters = ["", ",", "\n"];
    String numbersPart = numbers;

    // Custom delimiter check
    if (numbers.startsWith("//")) {
      final parts = numbers.split("\n");
      final delimiterLine = parts.first.substring(2); // after //
      delimiters = [delimiterLine];
      numbersPart = parts.sublist(1).join("\n");
    }

    // Split numbers by delimiters
    final tokens = numbersPart.split(
      RegExp(delimiters.map(RegExp.escape).join("|")),
    );

    final parsedNumbers = tokens.map(int.parse).toList();

    // Check for negatives
    final negatives = parsedNumbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception("negative numbers not allowed: ${negatives.join(",")}");
    }

    return parsedNumbers.fold(0, (sum, n) => sum + n);
  }
}
