// lib/custom_code/actions/test_schedule_sms.dart
import 'package:sms_scheduler/sms_scheduler.dart';

/// One-shot helper used by a FlutterFlow Custom Action.
/// Call it with: apiKey, phone, message, and optional scheduledAt.
/// - Initializes the provider
/// - Schedules the SMS
/// - Returns a short result string
Future<String> testScheduleSms({
  required String apiKey,
  required String phone,
  required String message,
  DateTime? scheduledAt,
}) async {
  try {
    // 1) Initialize (web example uses Semaphore provider; adjust if another provider is needed)
    await SmsScheduler.initialize(
      provider: SmsSchedulerWebSemaphore(apiKey: apiKey),
    );

    // 2) Pick time (default to now + 2 minutes if none provided)
    final when = scheduledAt ?? DateTime.now().add(const Duration(minutes: 2));

    // 3) Schedule
    final result = await SmsScheduler.instance.schedule(
      phoneNumber: phone,
      message: message,
      scheduledFor: when,
    );

    // 4) Try to include credits if available (optional)
    String creditsText = '';
    try {
      final credits = await SmsScheduler.instance.checkCredits();
      creditsText = ' | credits: ${credits?.toString() ?? 'unknown'}';
    } catch (_) {
      // provider may not support this; ignore
    }

    final id = (result != null && result.id != null) ? result.id : 'OK';
    return 'Scheduled ($id) at $when$creditsText';
  } catch (e) {
    return 'Scheduling failed: $e';
  }
}
