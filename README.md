# new_wear_os

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# vorbild
https://medium.com/flutter-community/flutter-building-wearos-app-fedf0f06d1b4

# build app
```flutter build apk --release```

# adb
* https://www.guidingtech.com/how-to-install-apks-on-wear-os-smartwatches/

```
# connect to watch
adb.exe connect 172.16.2.68:5555
adb.exe devices

# install
adb.exe -s 172.16.2.68:5555 install app.apk

```