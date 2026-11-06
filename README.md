# Classic Snakes & Ladders — 1.0.1

A single-page, self-contained, offline Snakes & Ladders game, with an Android
WebView wrapper project. The web game has no runtime network requests or
third-party runtime dependencies.

## Included features

- Solo vs computer and local pass-and-play (1–6 players)
- Small (50), Standard (100), Extended (150), Large (200), Extra Large (250)
- Dice rolls, entry on six, extra turns on six, exact-roll finish, snakes/ladders
- Activity log, responsive board and player status
- Animated dice, step-by-step movement, snake/ladder movement and win feedback
- Original Web Audio API tones with Sound ON/OFF (on by default)
- Reduced-motion preference support

## Run offline in a browser

Open `web/index.html` in a modern browser. All game logic and sound generation
are local. Audio starts after user interaction as required by browser autoplay
policies.

## Build the Android APK

No prebuilt APK is included. Options:

- **GitHub Actions:** push this folder to a repo; the `Build Android APK` workflow produces
  `CLASSIC_SNAKES_AND_LADDERS.apk` (debug-signed, installable) as a downloadable artifact.
- **Local:** install JDK 17+, Android SDK (platform 35, build-tools 35.0.0), Gradle 8.9+, set
  `ANDROID_HOME`, then run `./build_apk.sh`.
- **Android Studio:** open this folder, sync, Build > Build APK(s).

Run `node tests/logic_harness.js` to replay the game-logic tests. The wrapper declares no
permissions and loads only the bundled asset. See [QA_REPORT.md](QA_REPORT.md) for what is
and is not verified.

## Licensing

Original game HTML/CSS/JavaScript, vector icon and programmatic sound logic are
released under CC0 1.0 Universal. No third-party runtime assets are bundled.
Android SDK and Android Gradle Plugin are third-party development tools and
remain under their own licenses. See `LICENSE`.
