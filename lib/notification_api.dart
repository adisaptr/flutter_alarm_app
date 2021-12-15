import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotification = BehaviorSubject<String?>();

  static Future init({bool initScheduled = false}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final ios = IOSInitializationSettings();
    final initializationSettings =
        InitializationSettings(android: android, iOS: ios);
    await _notifications.initialize(
      initializationSettings,
      onSelectNotification: (payload) async {
        onNotification.add(payload);
      },
    );
  }

  static Future showNotificationSchedule({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduleDate,
  }) async =>
      _notifications.zonedSchedule(
          id,
          title,
          body,
          tz.TZDateTime.from(scheduleDate, tz.local),
          await notificationDetails(),
          payload: payload,
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);

  static Future notificationDetails() async {
    const sound = 'soundalarm.wav';
    return NotificationDetails(
        android: AndroidNotificationDetails(
          'channel id 3',
          'channelName',
          channelDescription: 'your other channel description',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          sound: RawResourceAndroidNotificationSound('soundalarm'),
          enableVibration: true,
        ),
        iOS: IOSNotificationDetails(
          sound: sound,
        ));
  }

  static void cancel() => _notifications.cancelAll();
}
