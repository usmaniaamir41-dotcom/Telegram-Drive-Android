# Release Notes — v1.0.0

**Telegram Drive: Android Edition**
**Release Date:** July 4, 2026
**Contributors:** [Aamir](https://github.com/usmaniaamir41-dotcom) & [Arish](https://github.com/worriedwolf629-sudo)

---

## What is this?

This is the **first Android release** of [Telegram Drive](https://github.com/caamer20/Telegram-Drive), an open-source app that turns your Telegram account into unlimited cloud storage.

The original project by [Cameron Amer (caamer20)](https://github.com/caamer20) supported desktop platforms only. We engineered this Android adaptation so mobile users can access the same powerful functionality.

---

## Download

| File | Architecture | Size |
|:-----|:------------|:-----|
| `TelegramDrive-Android-v1.0.0.apk` | ARM64 (most phones) | ~38 MB |

> **Note:** This build targets ARM64 (aarch64), which covers the vast majority of modern Android smartphones (2017+).

---

## Installation

1. Download the APK from this release
2. On your Android device, enable **"Install from unknown sources"**
3. Open the APK and install
4. Launch the app
5. Enter your Telegram `api_id` and `api_hash` from [my.telegram.org](https://my.telegram.org)

---

## What's New in This Release

### ✅ Android-Specific Additions
- Native Android APK (ARM64)
- Mobile-optimized UI (touch-friendly, status-bar-aware)
- File access permissions for Android 6–14
- Share from other apps (receive files via Android Share Sheet)
- Background upload support via Foreground Service

### ✅ Bug Fixes
- Status bar no longer overlaps app buttons
- File upload no longer crashes (permissions fixed)
- About section now correctly credits the original developer

---

## Requirements

- Android 7.0 (Nougat) or higher
- A Telegram account
- Free API credentials from [my.telegram.org](https://my.telegram.org)

---

## Known Limitations

- ARM64 only (32-bit ARM devices not supported in this build)
- Sideload installation only (not on Play Store)
- Requires your own Telegram API credentials

---

## Credits

Original concept and architecture by **[Cameron Amer (caamer20)](https://github.com/caamer20/Telegram-Drive)**.
Android adaptation by **Aamir** and **Arish**.

---

## License

MIT License — see [LICENSE](../LICENSE)
