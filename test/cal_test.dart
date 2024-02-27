// test/calculator_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator_test/cal_repo.dart'; // Adjust the import path based on your project struct

void main() {
  late Calculator calculator;

  setUpAll(() => calculator = Calculator());

  group('Addition', () {
    test(
        'Given  calcualtor obj, when giving two Adding two numbers, then result is a+b',
        () {
      expect(calculator.add(2, 3), 5);
    });
    test(
        'Given calculator Obj, When Adding two negative numbers, then result is a+b',
        () {
      expect(calculator.add(-2, -3), -5);
    });
    test(
        'Given calculator Obj, When Adding three numbers, then result is a+b+c',
        () {
      expect(calculator.addThreeNumbers(2, 3, 4), 9);
    });
    test(
        'Given calculator Obj, When Adding two large numbers , then result is a+b',
        () {
      expect(calculator.add(999999999999999, 1), 1000000000000000);
    });
    test(
        'Given calculator Obj, When Adding two decimal numbers, then result is a+b',
        () {
      expect(calculator.add(2.5, 3.5), 6);
    });
  });

  group('Subtraction', () {
    test(
        'Given calculator Obj, When Subtracting two numbers and subtrahend is lesser than minuend, Then a-b',
        () {
      expect(calculator.subtract(5, 3), 2);
    });
    test(
        'Given calculator Obj, When Subtracting two numbers and subtrahend is greater than minuend, Then a-b',
        () {
      expect(calculator.subtract(3, 5), -2);
    });
    test(
        'Given calculator Obj, When Subtracting a negative number from a positive number, Then a-b',
        () {
      expect(calculator.subtract(5, -3), 8);
    });
    test(
        'Given calculator Obj, When  Subtracting a positive number from a negative number, Then a-b',
        () {
      expect(calculator.subtract(-5, 3), -8);
    });
    test('Given calculator Obj, When  Subtracting two large numbers, Then a-b',
        () {
      expect(calculator.subtract(1000000000000000, 1), 999999999999999);
    });
    test(
        'Given calculator Obj, When  Subtracting two negative numbers, subtrahend is lesser than minuend, Then a-b',
        () {
      expect(calculator.subtract(-5, -3), -2);
    });
    test(
        'Given calculator Obj, When  Subtracting two negative numbers, subtrahend is greater than minuend, Then a-b',
        () {
      expect(calculator.subtract(-3, -5), 2);
    });
  });

  group('Multiplication', () {
    test(
        'Given calculator Obj, When Multiplying two numbers, Then result is a*b',
        () {
      expect(calculator.multiply(2, 3), 6);
    });
    test(
        'Given calculator Obj,When Multiplying a negative number by a positive number, Then result is the negative a*b',
        () {
      expect(calculator.multiply(-2, 3), -6);
    });
    test(
        'Given calculator class, when 2 positive numbers are multiplied, then output should be positive',
        () {
      expect(calculator.multiply(2, 3), 6);
      expect(calculator.multiply(3.0, 2.0), 6.0);
    });
    test(
        'Given calculator class, when 2 negative numbers are multiplied, then output should be positive',
        () {
      expect(calculator.multiply(-2, -3), 6);
      expect(calculator.multiply(-3.0, -2.0), 6.0);
    });
    test(
        'Given calculator class, when 1 positive and 1 negative number are multiplied, then output should be negative',
        () {
      expect(calculator.multiply(-2, 3), -6);
      expect(calculator.multiply(3.0, -2.0), -6.0);
    });
    test(
        'Given calculator class, when any numbers are mulitplied by 0 , then output should be 0',
        () {
      expect(calculator.multiply(-2, 0), 0);
      expect(calculator.multiply(0, -2), 0);
      expect(calculator.multiply(0, 0), 0);
    });
  });

  group('Division', () {
    test(
        'Given calculator obj, When given two numbers, Then return should be a/b',
        () {
      expect(calculator.divide(6, 2), 3);
    });
    test(
        'Given calculator obj, When given two negative, Then return should be -a/-b',
        () {
      expect(calculator.divide(-5.0, -5.0), 1);
    });
    test(
        'Given calculator obj, When given two non negative, Then return should be a/b',
        () {
      expect(calculator.divide(5.0, 5), 1);
    });
    test(
        'Given calculator Obj,  When Dividing a positive number by a negative number, Then result is a negative number',
        () {
      expect(calculator.divide(6, -2), -3);
    });
    test('Given calculator obj, When Dividing by 0, Then throws error', () {
      expect(() => calculator.divide(5, 0), throwsArgumentError);
    });
    test(
        'Given calculator Obj, When Rounding result, Then result is closeTo range',
        () {
      expect(calculator.divide(5, 3), closeTo(1.67, 0.01));
    });
  });

  tearDownAll(() => calculator = Calculator());
}
