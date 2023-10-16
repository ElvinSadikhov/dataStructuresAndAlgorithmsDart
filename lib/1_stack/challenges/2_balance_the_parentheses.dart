//! Challenge 2: Balance the Parentheses
// Check for balanced parentheses. Given a string, check if there are ( and ) characters, and return true if the parentheses in the string are balanced. For example:

import 'package:data_structures_and_algorithms/1_stack/base/stack.dart';
import 'package:data_structures_and_algorithms/1_stack/stack_impl.dart';

bool isBalanced(String input) {
  final Stack<String> stack = StackImpl<String>();
  
  for (final String char in input.split("")) {
    if (char == "(") {
      stack.push(char);
    } else if (char == ")") {
      try {
        stack.pop();
      } catch (e) {
        return false;
      }
    }
  }
  return stack.isEmpty;
}

void main() {
  final String input1 = "h((e))llo(world)()"; // balanced parentheses
  final bool isInput1Balanced = isBalanced(input1);
  print("$input1 -> $isInput1Balanced");

  final String input2 = "(hello world"; // unbalanced parentheses
  final bool isInput2Balanced = isBalanced(input2);
  print("$input2 -> $isInput2Balanced");
}