# shiftend

[<img src="https://dply.me/zxukmt/button/large" alt="Try it on your device via DeployGate">](https://dply.me/zxukmt#install))

A new Flutter application.

## Preparations

コミットに hook して，`flutter analyze`と`flutter format`を実行する準備

```bash
# 事前にpython3.8.3をインストール
# 以下インストール例
$ anyenv install pyenv
$ exec $SHELL -l
$ pyenv install 3.8.3
$ exec $SHELL -l
# ↑ここまで，pythonインストール
$ pip install pre-commit
$ pre-commit install
```

## version

```sh
$ flutter doctor -v
[✓] Flutter (Channel stable, 1.20.1, on Mac OS X 10.15.6 19G73, locale ja-JP)
    • Flutter version 1.20.1 at /Users/kmdkuk/go/src/github.com/flutter/flutter
    • Framework revision 2ae34518b8 (4 days ago), 2020-08-05 19:53:19 -0700
    • Engine revision c8e3b94853
    • Dart version 2.9.0

[✓] Android toolchain - develop for Android devices (Android SDK version 29.0.2)
    • Android SDK at /Users/kmdkuk/Library/Android/sdk
    • Platform android-30, build-tools 29.0.2
    • Java binary at: /Users/kmdkuk/Library/Application Support/JetBrains/Toolbox/apps/AndroidStudio/ch-0/193.6626763/Android Studio.app/Contents/jre/jdk/Contents/Home/bin/java
    • Java version OpenJDK Runtime Environment (build 1.8.0_242-release-1644-b3-6222593)
    • All Android licenses accepted.

[✓] Xcode - develop for iOS and macOS (Xcode 11.6)
    • Xcode at /Applications/Xcode.app/Contents/Developer
    • Xcode 11.6, Build version 11E708
    • CocoaPods version 1.9.3

[✓] Android Studio (version 4.0)
    • Android Studio at /Users/kmdkuk/Library/Application Support/JetBrains/Toolbox/apps/AndroidStudio/ch-0/193.6626763/Android Studio.app/Contents
    • Flutter plugin version 47.1.2
    • Dart plugin version 193.7361
    • Java version OpenJDK Runtime Environment (build 1.8.0_242-release-1644-b3-6222593)

[✓] VS Code (version 1.47.3)
    • VS Code at /Applications/Visual Studio Code.app/Contents
    • Flutter extension version 3.13.2

[✓] Connected device (1 available)
    • sdk gphone x86 (mobile) • emulator-5554 • android-x86 • Android 11 (API 30) (emulator)

• No issues found!
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
