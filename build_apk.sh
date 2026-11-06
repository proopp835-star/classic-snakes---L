#!/usr/bin/env bash
# Local build. Requires: JDK 17+, Android SDK (platform 35, build-tools 35.0.0; ANDROID_HOME set), Gradle 8.9+.
set -euo pipefail
cd "$(dirname "$0")"
cp web/index.html android/app/src/main/assets/index.html
gradle :android:app:assembleDebug
cp android/app/build/outputs/apk/debug/app-debug.apk CLASSIC_SNAKES_AND_LADDERS.apk
echo "Built CLASSIC_SNAKES_AND_LADDERS.apk (debug-signed; install with: adb install -r CLASSIC_SNAKES_AND_LADDERS.apk)"
