import 'package:hashids/hashids.dart';
import 'package:test/test.dart';

void sampleTest() {
  group("real", () {
    test("Real Sample Hash", () {
      var hashids = new HashIds("this is my salt", 8,
          "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890");
      var id = hashids.encode([1, 2, 3]);
      var numbers = hashids.decode(id);
      expect(id, equals("GlaHquq0"));
      expect(numbers, equals([1, 2, 3]));
    });
  });
}



