<!-- markdownlint-disable MD024 -->
# Changelog

All notable changes to **Memory R** will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to
[Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2026-07-23

### Added

- Custom high-resolution Windows desktop launcher icon (`app_icon.ico`).
- Updated organization package identifier (`com.andzzio.memory_r`) across
  native platform configurations.

### Changed

- Updated default `startAutomatically` preference to `false` to align with
  Riverpod provider state management and desktop UX best practices.

### Fixed

- Synchronized Windows startup shortcut lifecycle with user-triggered
  settings toggle via `LaunchAtStartupService`.

## [1.0.0] - 2026-07-22

### Added

- Real-time Windows RAM monitoring and optimization core engine.
- Fluent UI desktop interface built with Flutter and Fluent UI.
- System tray integration via `tray_manager` (minimize to tray, context
  menu, restore window).
- Persistent user settings storage using `SharedPreferences` and Clean
  Architecture (`AppSettings`, datasources, repositories, use cases).
- Periodic automatic RAM cleanup based on configurable memory threshold
  and interval timers.
- Fluent UI `SettingsScreen` and `AboutScreen` with custom title bar
  integration.
- Windows autostart support via `launch_at_startup`.
