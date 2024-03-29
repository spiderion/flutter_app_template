build-base:
	flutter pub get

configure-firebase-dev:
	flutterfire configure $(firebaseConfigDev)

configure-firebase-prod:
	flutterfire configure $(firebaseConfigProd)

firebaseConfigDev=--project=your-firebase-project-dev \
--ios-bundle-id=com.default.dev \
--android-app-id=com.default.dev \
--macos-bundle-id=com.default.dev \
--platforms=ios,android

firebaseConfigProd=flutterfire configure \
--project=your-firebase-project-prod \
--ios-bundle-id=com.default.prod \
--android-app-id=com.default.prod \
--macos-bundle-id=com.default.prod \
--platforms=ios,android

configDev=--dart-define=DEFINE_APP_ID=com.default \
          --dart-define=DEFINE_APP_NAME=AppNameDev \
          --dart-define=DEFINE_APP_SUFFIX=.dev

configProd=--dart-define=DEFINE_APP_ID=com.default \
--dart-define=DEFINE_APP_NAME=AppNameProd \
--dart-define=DEFINE_APP_SUFFIX=.prod

buildType=--release

build-android-appbundle-dev: configure-firebase-dev build-base
	flutter build appbundle -t lib/main.dart $(buildType) $(configDev)

build-android-appbundle-prod: configure-firebase-prod build-base
	flutter build appbundle -t lib/main.dart $(buildType) $(configProd)

build-android-apk-dev: configure-firebase-dev build-base
	flutter build apk -t lib/main.dart $(buildType) $(configDev)

build-android-apk-prod: configure-firebase-prod build-base
	flutter build apk -t lib/main.dart $(buildType) $(configProd)

build-ios-dev: configure-firebase-dev build-base
	flutter build ios -t lib/main.dart $(buildType) --no-codesign $(configDev)

build-ios-prod: configure-firebase-prod build-base
	flutter build ios -t lib/main.dart $(buildType) --no-codesign $(configProd)


run-ios-dev: configure-firebase-dev build-base
	flutter run ios -t lib/main.dart $(buildType) $(configDev)

run-android-apk-dev: configure-firebase-dev build-base
	flutter run apk -t lib/main.dart $(buildType) $(configDev)


run-ios-prod: configure-firebase-prod build-base
	flutter run ios -t lib/main.dart $(buildType) --no-codesign $(configProd)

run-android-apk-prod: configure-firebase-prod build-base
	flutter run apk -t lib/main.dart $(buildType) $(configProd)
