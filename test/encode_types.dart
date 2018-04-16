import 'package:hashids/hashids.dart';
import 'package:test/test.dart';

encodeTypesTest() {
  final testParams = (numbers) {
    final hashids = new HashIds();

    final id = hashids.encode(numbers);
    final decodedNumbers = hashids.decode(id);
    final encodedId = hashids.encode(decodedNumbers);

    //expect(id);
    expect(id, encodedId);
  };
  group('encode types', () {
    test("should encode 1, 2, 3", () {
      testParams([1, 2, 3]);
    });

    /*test("should encode [1, 2, 3]", () {
      testParams(['1', '2', '3']);
    });*/

    test("should encode '1', '2', '3'", () {
      testParams([1, 2, 3]);
    });

    /*test("should encode ['1', '2', '3']", () {
      testParams(['1', '2', '3']);
    });*/
  });
}
