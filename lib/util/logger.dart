import 'package:simple_logger/simple_logger.dart';

final logger = SimpleLogger()
  ..setLevel(
    Level.FINEST, // 適当なレベルを設定
    includeCallerInfo: true, // リリースビルドではfalseにする
  )
  ..onLogged = (log, info) {
    if (info.level >= Level.SEVERE) {
      // 適当なレベルを設定
      // Crashlyticsにエラーを送る。
    }
  };
