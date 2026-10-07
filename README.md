![Flutter](https://img.shields.io/badge/Flutter-stable-02569B?logo=flutter&logoColor=white)
![FlutterFlow](https://img.shields.io/badge/built%20with-FlutterFlow-4B39EF)
![Dart](https://img.shields.io/badge/Dart-3-0175C2?logo=dart&logoColor=white)

# schedulePlayground

**A one-screen FlutterFlow test app for trying out SMS scheduling through the `sms_scheduler` package.**

This is a playground, not a product. It exists to check that the [`sms_scheduler`](https://github.com/angelonrevelo/sms-scheduler) package can be called from a FlutterFlow app. It ships a custom action that schedules a text through the Semaphore SMS provider (a Philippine SMS gateway) and reports the result and remaining credits.

The home page ("testing grounds for schedule!") has two text fields and a date-and-time picker, but they are not yet wired to the action — call the action from a FlutterFlow button to try it.

## Quick start

FlutterFlow projects are built to run on the Flutter **stable** release.

```bash
flutter pub get
flutter run
```

The default branch is `flutterflow` — FlutterFlow pushes generated code there.

## Configuration

There is no `.env`. The Semaphore API key is passed to the action as a parameter at runtime.

> **Do not hardcode API keys.** Pass them through FlutterFlow action parameters or fetch them from a backend you control.

## How it works

The FlutterFlow Custom Action **TestScheduleSms** wraps the helper in `lib/custom_code/actions/test_schedule_sms.dart`. It accepts:

- `apiKey` (`String`)
- `phone` (`String`)
- `message` (`String`)
- `scheduledAt` (`DateTime`, optional — defaults to two minutes from now)

```
button (FlutterFlow) ──▶ TestScheduleSms ──▶ sms_scheduler (Semaphore provider) ──▶ "Scheduled (<id>) at <time> | credits: <n>"
```

The rest of `lib/` (`flutter_flow/`, `pages/home_page/`) is FlutterFlow-generated.
