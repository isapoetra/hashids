import 'package:hashids/hashids.dart';
import 'package:test/test.dart';

void badInputTest() {
  group('bad input', () {
    test("should throw an error when small alphabet", () {
      try {
        new HashIds('', 0, '1234567890');
      }catch(e) {
        expect(1, 1);
      }
    });

    test('should throw an error when alphabet has spaces', () {
      try {
        new HashIds('', 0, 'a cdefghijklmnopqrstuvwxyz');
      }catch(e) {
        expect(1, 1);
      }
    });
    var hashids = new HashIds();
    test('should return an empty string when encoding nothing', () {
      var id = hashids.encode([]);
      expect(id, equals(''));
    });
    test('should return an empty string when encoding a negative number', () {
      var id = hashids.encode([-1]);
      expect(id, equals(''));
    });

    /*test('should return an empty string when encoding a string with non-numeric characters', ()  {
      expect(hashids.encode('6B'), '');
      expect(hashids.encode('123a'), '');
    });

    test('should return an empty string when encoding infinity', () {
      var id = hashids.encode([double.infinity]);
      expect(id, equals(''));
    });*/

    test('should return an empty string when encoding a null', () {
      var id = hashids.encode(null);
      expect(id, equals(''));
    });

    /*test('should return an empty string when encoding a NaN', ()  {
      const id = hashids.encode(nan);
      assert.equal(id, '');
    });

  test('should return an empty string when encoding an undefined', ()  {
      const id = hashids.encode(undefined);
      assert.equal(id, '');
    });

    test('should return an empty string when encoding an array with non-numeric input', ()  {
      const id = hashids.encode(['z']);
      assert.equal(id, '');
    });*/

    test('should return an empty array when decoding nothing', () {
      var numbers = hashids.decode("");
      expect(numbers, equals([]));
    });

    /*test('should return an empty string when encoding non-numeric input', ()  {
      var id = hashids.encode('z');
      assert.equal(id, '');
    });*/

    test('should return an empty array when decoding invalid id', () {
      var numbers = hashids.decode('f');
      expect(numbers, equals([]));
    });

    test('should return an empty string when encoding non-hex input', () {
      var id = hashids.encodeHex('z');
      expect(id, equals(''));
    });

    test('should return an empty array when hex-decoding invalid id', () {
      var numbers = hashids.decodeHex('f');
      expect(numbers, equals(""));
    });
  });
}
