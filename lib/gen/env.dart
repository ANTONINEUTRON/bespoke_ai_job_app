// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@envied
abstract class Env {
  @EnviedField(varName: 'GEMINI_KEY', obfuscate: true)
  static  String geminiKey = _Env.geminiKey;
}
