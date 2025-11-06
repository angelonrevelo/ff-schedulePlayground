# schedulePlayground

A new Flutter project.

## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.

## Scheduling with sms_scheduler

This project depends on the [`sms_scheduler`](https://github.com/CelestialBrain/sms-scheduler) package to provide SMS scheduling capabilities.

FlutterFlow Custom Action **TestScheduleSms** wraps the helper at `lib/custom_code/actions/test_schedule_sms.dart`.

Parameters accepted by the action:
- `apiKey` (`String`)
- `phone` (`String`)
- `message` (`String`)
- `scheduledAt` (`DateTime`, optional)

**Security note:** Do **not** hardcode API keys. Pass them through FlutterFlow action parameters or retrieve them securely from a backend service.
