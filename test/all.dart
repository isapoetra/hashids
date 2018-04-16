import 'bad_input.dart';
import 'custom_alphabet.dart';
import 'custom_params.dart';
import 'custom_params_hex.dart';
import 'custom_salt.dart';
import 'default_params.dart';
import 'default_params_hex.dart';
import 'encode_types.dart';
import 'sample.dart';

void main() {
  sampleTest();
  badInputTest();
  customSaltTest();
  customAlphabetTest();
  customParamsTest();
  customParamsHexTest();
  defaultParamsTest();
  defaultParamsHexTest();
  encodeTypesTest();
}