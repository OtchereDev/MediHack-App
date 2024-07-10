import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
  'channel id',
  'channel name',
  icon: 'app_icon',
  importance: Importance.max,
  priority: Priority.high,
  largeIcon: DrawableResourceAndroidBitmap('app_icon'),
);
// var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
var platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  Future<void> init() async {
    androidNotificationChannel() => const AndroidNotificationChannel(
          'high_importance_channel', // id
          'High Importance Notifications', // title
          // 'This channel is used for important notifications.', // description
          importance: Importance.max,
        );

    AndroidNotificationChannel channel = androidNotificationChannel();
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
   var androidSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    var initSetttings = InitializationSettings(
        android: androidSettings, iOS: initializationSettingsDarwin);

    await flutterLocalNotificationsPlugin.initialize(initSetttings,
        onDidReceiveNotificationResponse: ((details) {
      // print(details.payload);
    }));

  }


  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // print("--------------------------------------------$id-------------------");
  }

  Future selectNotification(String payload) async {
    //Handle notification tapped logic here
  }
}
