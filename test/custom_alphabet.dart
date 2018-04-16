import 'package:hashids/hashids.dart';
import 'package:test/test.dart';

void customAlphabetTest() {
  final testAlphabet = (alphabet) {
    var hashids = new HashIds('', 0, alphabet);
    var numbers = [1, 2, 3];

    var id = hashids.encode(numbers);
    var decodedNumbers = hashids.decode(id);

    expect(decodedNumbers, equals(numbers));
  };
  group('Custom Alphabet', () {
    test('should work with the worst alphabet', () {
      testAlphabet('cCsSfFhHuUiItT01');
    });

    test('should work with half the alphabet being separators', () {
      testAlphabet('abdegjklCFHISTUc');
    });

    test('should work with exactly 2 separators', () {
      testAlphabet('abdegjklmnopqrSF');
    });

    test('should work with no separators', () {
      testAlphabet('abdegjklmnopqrvwxyzABDEGJKLMNOPQRVWXYZ1234567890');
    });

    test('should work with super long alphabet', () {
      testAlphabet(
          'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\'~!@#\$%^&*()-_=+\\|\'";:/?.>,<{[}]');
    });

    test('should work with a weird alphabet', () {
      testAlphabet('~!@#\$%^&*()-_=+\\|\'' '";:/?.>,<{[}]');
    });
  });
}