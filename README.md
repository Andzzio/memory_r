# Memory R

**Memory R** is a lightweight, high-performance Windows desktop application
designed for real-time RAM monitoring and system memory optimization. Built
using Flutter and Fluent UI, it offers a modern Windows 11 native aesthetic
combined with direct Win32 API integration via Dart FFI.

---

## 🚀 Key Features

- **Real-Time RAM Monitoring**: Live telemetry of total physical RAM, active
  memory usage, available memory, and load percentage.
- **One-Click Memory Optimization**: Purges process working sets via native
  Win32 APIs (`EnumProcesses`, `EmptyWorkingSet`) to reclaim system memory.
- **Native Fluent UI Design**: Styled according to Windows 11 Fluent Design
  principles for a seamless desktop user experience.
- **System Tray Operations**: Minimizes to the system tray for unobtrusive
  background monitoring with customizable launch behaviors.
- **Clean Architecture & Riverpod**: Structured with Clean Architecture
  principles (Data, Domain, Presentation) and reactive state management using
  Riverpod.

---

## 🛠️ Tech Stack

- **Framework**: Flutter Desktop (Windows target)
- **Design System**: Fluent UI (`fluent_ui`)
- **State Management**: Riverpod (`flutter_riverpod`)
- **Native Interop**: Dart FFI (`win32`, `ffi`)
- **System Integration**: `window_manager` & `tray_manager`
- **Navigation**: GoRouter (`go_router`)

---

## 📦 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (^3.12.0)
- Windows 10/11 Development Environment (Visual Studio C++ Desktop workload)

### Running the App

```bash
# Fetch dependencies
flutter pub get

# Run on Windows desktop
flutter run -d windows
```
