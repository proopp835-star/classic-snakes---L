# QA report — Classic Snakes & Ladders 1.0.1

Date: 2026-10-30

## APK status: NOT BUILT
The build environment had only a JRE (no javac), no Android SDK, no Gradle, and no network
access, so no APK could be compiled, installed, or run. No APK is provided; none was faked.
Build one with `.github/workflows/build-apk.yml` (GitHub Actions) or `./build_apk.sh`
on a machine with the Android SDK. The Java/Gradle/manifest edits in this release are
UNCOMPILED and UNTESTED.

## Bugs found and fixed (web game)
1. **Computer never moved** (critical): `finishTurn` locked input, then `rollDice` refused to run
   while locked, so Play vs Computer froze after the human's first turn. Fixed.
2. **Small (50) board**: square 32 was both ladder base and snake head (snake ignored but drawn);
   a ladder also ended on a snake head. Board generation now guarantees no square starts two
   jumps and no ladder ends on a snake head. Other sizes unchanged in practice.
3. **Changing board size/mode during a game corrupted it** (win square, exact-roll rule, who is
   computer-controlled). Running games now use their own `activeSize`; computer control belongs
   to the player. Selecting a size before starting now previews that board.
4. Safe-area padding added for notches/cutouts.

## Android project edits (uncompiled)
- `configChanges` so rotation no longer restarts the WebView and wipes the game.
- WebView media autoplay allowed (sound after computer turns), pause/resume with the activity,
  immersive mode re-applied on focus, file access disabled (assets still load).
- Lint no longer aborts the build; CI workflow and `build_apk.sh` added.

## Tests actually run (Node.js, DOM/Audio stubs, `tests/logic_harness.js`)
Complete games played to a winner for all five board sizes (50/100/150/200/250) in
vs-Computer mode and Local mode with 1, 2, 3, 4 and 6 players (5-player not run);
position bounds, single winner, win state, no conflicting jumps; mid-game settings changes;
restart mid-roll; Sound ON/OFF gating of tone generation (stubbed AudioContext). Result: all passed.

## NOT tested
Real rendering/layout, animation smoothness, actual audible sound, touch input, WebView
behaviour, APK build/install/launch, any physical device or emulator.

## Re-verification (1.0.1, second session)
- APK: STILL NOT BUILT. This environment had a JRE only (no javac), no Android SDK, no Gradle, no network.
- Re-ran `node tests/logic_harness.js`: output ended "ALL LOGIC CHECKS PASSED" (logic only, stubbed DOM/audio).
- Confirmed web/index.html is byte-identical to android/app/src/main/assets/index.html and to the GameHub index.html.
- Confirmed no external network references in the game (only the SVG XML namespace string).
- Still NOT tested: rendering, animation, audible sound, touch, WebView, APK install/launch.
