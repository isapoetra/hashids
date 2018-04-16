import 'package:hashids/hashids.dart';
import 'package:test/test.dart';

void customSaltTest() {
  final testSalt = (salt) {
    final hashIds = new HashIds(salt);
    final numbers = [1, 2, 3];

    final id = hashIds.encode(numbers);
    final decodedNumbers = hashIds.decode(id);

    expect(decodedNumbers, numbers);
  };

  group('custom salt', () {
    test("should work with ''", () {
      testSalt('');
    });

    test("should work with '   '", () {
      testSalt('   ');
    });

    test("should work with 'this is my salt'", () {
      testSalt('this is my salt');
    });

    test("should work with a really long salt", () {
      testSalt(
          'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"~!@#\$%^&*()-_=+\\|\'";:/?.>,<{[}]');
    });

    test("should work with a weird salt", () {
      testSalt('"~!@#\$%^&*()-_=+\\|\'";:/?.>,<{[}]');
    });
  });
}
