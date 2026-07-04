# Changelog

All notable changes to the **Telegram Drive — Android Edition** are documented here.

This project follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and [Semantic Versioning](https://semver.org/).

---

## [1.0.0] — 2026-07-04

### 🎉 Initial Android Release

This is the first public release of the **Android adaptation** of [Telegram Drive](https://github.com/caamer20/Telegram-Drive) by [Cameron Amer](https://github.com/caamer20).

#### Added (Android-Specific)
- Native Android application package (APK) targeting ARM64 (aarch64)
- Platform detection — automatically loads `MobileDashboard` on Android, `DesktopDashboard` on desktop
- Android permissions for file access (`READ_MEDIA_IMAGES`, `READ_MEDIA_VIDEO`, `READ_MEDIA_AUDIO`, `READ_EXTERNAL_STORAGE`)
- Status bar safe area inset handling to prevent notification bar overlap
- Touch-friendly mobile UI via `MobileDashboard` component
- Bottom navigation bar for mobile navigation
- Share intent support — receive files from other Android apps
- Foreground service for reliable background uploads
- Android deep-link support for Telegram URLs

#### Fixed (Android Port)
- Fixed status bar overlapping clickable buttons by routing Android to the mobile UI
- Fixed file upload crash caused by missing storage permissions
- Fixed Tauri symlink creation error on Windows by manually placing compiled `.so`
- Fixed Kotlin incremental compilation error (cross-drive root mismatch)

#### Changed (Credits)
- Updated About section: credits now point to `github.com/caamer20` (original author)
- Updated GitHub repo link to correct case-sensitive path `caamer20/Telegram-Drive`

#### Infrastructure
- Moved Gradle cache (5.8 GB) and Cargo registry (930 MB) from C: to E: drive via NTFS junctions
- Configured `local.properties` with Android SDK path for Gradle
- Added `sdk.dir` to Android build configuration

---

## Upstream Changes (from caamer20/Telegram-Drive)

The following features are inherited from the original project and are fully functional in this Android build:

- File upload, download, delete, rename, move
- Folder management (create, rename, delete, reorder, group)
- File preview: images, video, audio, PDF, archives
- Multi-language support (17+ languages including Arabic RTL)
- Custom themes and dark mode
- VPN/Proxy support with timeout multiplier
- Bandwidth throttling
- Adaptive polling
- Keyboard shortcuts (desktop)
- Bulk operations
- Share dialog with expiry links
- Remote URL upload
- Archive browser (ZIP, 7z)
- Update checker

---

*For the full upstream changelog, see the [original repository](https://github.com/caamer20/Telegram-Drive).*
