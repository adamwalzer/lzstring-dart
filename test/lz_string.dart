import 'package:test/test.dart';
import 'package:lzstring/lzstring.dart';

void main() async {
  final input = "測試,测试,テスト,testing";
  final normal = await LZString.compress(input);
  final base64 = await LZString.compressToBase64(input);
  final utf16 = await LZString.compressToUTF16(input);
  final encodedUriComponent =
      await LZString.compressToEncodedURIComponent(input);
  final uint8Array = await LZString.compressToUint8Array(input);

  group('compress data', () {
    test('to normal', () {
      expect(normal, equals('贝ꌲ蠴贫梫텨挌觐젉蘰׀ꘆ煁Ⰷ恳 '));
      expect(normal, equals(LZString.compressSync(input)));
    });

    test('to base 64', () {
      expect(base64, equals('jR2jMog0jStoq9FoYwyJ0MgJhjAFwKYGcUEsB2BzIA=='));
      expect(base64, equals(LZString.compressToBase64Sync(input)));
    });

    test('to utf 16', () {
      expect(utf16, equals('䚮棬儦䣲孥⽥僦಩梄ʁ䘠尪こ䔤堮悓ဠ '));
      expect(utf16, equals(LZString.compressToUTF16Sync(input)));
    });

    test('to encoded uri component', () {
      expect(encodedUriComponent,
          equals('jR2jMog0jStoq9FoYwyJ0MgJhjAFwKYGcUEsB2BzIA'));
      expect(encodedUriComponent,
          equals(LZString.compressToEncodedURIComponentSync(input)));
    });

    test('to uint8 array', () {
      expect(
          uint8Array?.toList(),
          equals([
            141,
            29,
            163,
            50,
            136,
            52,
            141,
            43,
            104,
            171,
            209,
            104,
            99,
            12,
            137,
            208,
            200,
            9,
            134,
            48,
            5,
            192,
            166,
            6,
            113,
            65,
            44,
            7,
            96,
            115,
            32,
            0
          ]));
      expect(uint8Array?.toList(),
          equals(LZString.compressToUint8ArraySync(input)));
    });

    test('null to normal', () async {
      expect(await LZString.compress(null), isNull);
      expect(LZString.compressSync(null), isNull);
    });

    test('null to base 64', () async {
      expect(await LZString.compressToBase64(null), isNull);
      expect(LZString.compressToBase64Sync(null), isNull);
    });

    test('null to utf 16', () async {
      expect(await LZString.compressToUTF16(null), isNull);
      expect(LZString.compressToUTF16Sync(null), isNull);
    });

    test('null to encoded uri component', () async {
      expect(await LZString.compressToEncodedURIComponent(null), isNull);
      expect(LZString.compressToEncodedURIComponentSync(null), isNull);
    });

    test('null to uint8 array', () async {
      expect(await LZString.compressToUint8Array(null), isNull);
      expect(LZString.compressToUint8ArraySync(null), isNull);
    });
  });

  group('decompress data', () {
    test('from normal', () async {
      final output = await LZString.decompress(normal);
      expect(output, equals(input));
      expect(output, equals(LZString.decompressSync(normal)));
    });

    test('from base 64', () async {
      final output = await LZString.decompressFromBase64(base64);
      expect(output, equals(input));
      expect(output, equals(LZString.decompressFromBase64Sync(base64)));
    });

    test('from utf 16', () async {
      final output = await LZString.decompressFromUTF16(utf16);
      expect(output, equals(input));
      expect(output, equals(LZString.decompressFromUTF16Sync(utf16)));
    });

    test('from encoded uri component', () async {
      final output =
          await LZString.decompressFromEncodedURIComponent(encodedUriComponent);
      expect(output, equals(input));
      expect(
          output,
          equals(LZString.decompressFromEncodedURIComponentSync(
              encodedUriComponent)));
    });

    test('from uint8 array', () async {
      final output = await LZString.decompressFromUint8Array(uint8Array);
      expect(output, equals(input));
      expect(output, equals(LZString.decompressFromUint8ArraySync(uint8Array)));
    });

    test('null from normal', () async {
      expect(await LZString.decompress(null), isNull);
      expect(LZString.decompressSync(null), isNull);
    });

    test('null from base 64', () async {
      expect(await LZString.decompressFromBase64(null), isNull);
      expect(LZString.decompressFromBase64Sync(null), isNull);
    });

    test('null from utf 16', () async {
      expect(await LZString.decompressFromUTF16(null), isNull);
      expect(LZString.decompressFromUTF16Sync(null), isNull);
    });

    test('null from encoded uri component', () async {
      expect(await LZString.decompressFromEncodedURIComponent(null), isNull);
      expect(LZString.decompressFromEncodedURIComponentSync(null), isNull);
    });

    test('null from uint8 array', () async {
      expect(await LZString.decompressFromUint8Array(null), isNull);
      expect(LZString.decompressFromUint8ArraySync(null), isNull);
    });
  });
}
