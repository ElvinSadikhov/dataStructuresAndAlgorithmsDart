//! Challenge 2: Unique Characters
// Write a function that returns the total number of unique characters used in a list of words.

int uniqueCharacters(List<String> words) {
  final Set<int> uniqueChars = {};

  for (String word in words) {
    for (int charCode in word.codeUnits) {
      uniqueChars.add(charCode);
    }
  }

  return uniqueChars.length;
}

void main() {
  final List<String> words = ['done', 'ad', 'eel', 'zoo', 'adept', 'do'];
  print(uniqueCharacters(words));
}