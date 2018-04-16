import 'package:hashids/hashids.dart';
import 'package:test/test.dart';

defaultParamsHexTest() {
  final hashids = new HashIds();

  final map = {
    'wpVL4j9g': 'deadbeef',
    'kmP69lB3xv': 'abcdef123456',
    '47JWg0kv4VU0G2KBO2': 'ABCDDD6666DDEEEEEEEEE',
    'y42LW46J9luq3Xq9XMly': '507f1f77bcf86cd799439011',
    'm1rO8xBQNquXmLvmO65BUO9KQmj': 'f00000fddddddeeeee4444444ababab',
    'wBlnMA23NLIQDgw7XxErc2mlNyAjpw': 'abcdef123456abcdef123456abcdef123456',
    'VwLAoD9BqlT7xn4ZnBXJFmGZ51ZqrBhqrymEyvYLIP199':
        'f000000000000000000000000000000000000000000000000000f',
    'nBrz1rYyV0C0XKNXxB54fWN0yNvVjlip7127Jo3ri0Pqw':
        'fffffffffffffffffffffffffffffffffffffffffffffffffffff'
  };

  group('encodeHex/decodeHex using default params', () {
    for (final id in map.keys) {
      final hex = map[id];

      test("should encode '0x${hex.toUpperCase()}' to '${id}'", () {
        expect(id, hashids.encodeHex(hex));
      });

      test(
          "should encode '0x${hex
          .toUpperCase()}' to '${id}' and decode back correctly", () {
        final encodedId = hashids.encodeHex(hex);
        final decodedHex = hashids.decodeHex(encodedId);

        expect(hex.toLowerCase(), decodedHex);
      });
    }
  });
}
