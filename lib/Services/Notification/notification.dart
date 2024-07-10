// import 'dart:io';
// import 'dart:math';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import '../Local/shared_prefs_manager.dart';

// class PushNotificationService {
//   Random random = Random();
//   final _sharedPrefsManager = SharedPrefsManager();

//   // It is assumed that all messages contain a data field with the key 'type'
//   Future<void> setupInteractedMessage() async {
//     await Firebase.initializeApp();
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       // print("======================Remote=============${message.data}");
//       // Get.toNamed(NOTIFICATIOINS_ROUTE);
//     });
//     generateToken();
//     await enableIOSNotifications();
//     await registerNotificationListeners();
//   }

//   registerNotificationListeners() async {
//     AndroidNotificationChannel channel = androidNotificationChannel();

//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);

//     var androidSettings =
//         const AndroidInitializationSettings('@mipmap/ic_launcher');
//     final DarwinInitializationSettings initializationSettingsDarwin =
//         DarwinInitializationSettings(
//             onDidReceiveLocalNotification: onDidReceiveLocalNotification);

//     var initSetttings = InitializationSettings(
//         android: androidSettings, iOS: initializationSettingsDarwin);

//     await flutterLocalNotificationsPlugin.initialize(initSetttings,
//         onDidReceiveNotificationResponse: ((details) {
//       // print(details.payload);
//     }));
// // onMessage is called when the app is in foreground and a notification is received
//     FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
//       RemoteNotification? notification = message?.notification;
//       AndroidNotification? android = message?.notification?.android;
//       // Get.dialog(Dialog(
//       //   child: Container(
//       //     decoration: BoxDecoration(
//       //       borderRadius: BorderRadius.circular(10),
//       //       color: AppColors.WHITE,
//       //     ),
//       //     child: Column(
//       //       mainAxisSize: MainAxisSize.min,
//       //       children: [
//       //         Text(notification?.title ?? ""),
//       //         AppSpaces.height16,
//       //         Text(notification?.body ?? ""),
//       //       ],
//       //     ),
//       //   ),
//       // ));
// // If `onMessage` is triggered with a notification, construct our own
//       // local notification to show to users using the created channel.
//       if (notification != null && android != null && Platform.isAndroid) {
//         // print("================No otification =>${notification.body}");
//         showNotificationWithActions(
//             notification.body ?? "", notification.title ?? "");
//       } else {
//         // showNotificationWithActions(
//         //     notification?.body ?? "", notification?.title ?? "");
//       }
//     });
//   }

//   enableIOSNotifications() async {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true, // Required to display a heads up notification
//       badge: true,
//       sound: true,
//     );
//   }

//   androidNotificationChannel() => const AndroidNotificationChannel(
//         'high_importance_channel', // id
//         'High Importance Notifications', // title
//         // 'This channel is used for important notifications.', // description
//         importance: Importance.max,
//       );

//   Future<String?> generateToken() async {
//     await FirebaseMessaging.instance.requestPermission();
//     await Future.delayed(Duration(seconds: 1));
//     String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
//     String? token = await FirebaseMessaging.instance.getToken();

//     if (token != null || apnsToken != null) {
//       await _sharedPrefsManager.setPushNotificationToken(
//           // Platform.isIOS ? apnsToken ?? "" :
//           token ?? "");
//     } else {}
//     // print("====$apnsToken============Token =>$token");
//     return token;
//   }

//   void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) async {
//     // display a dialog with the notification details, tap ok to go to another page
//     // print("=======Close =========Notification =>${body}");
//   }

//   Future<void> cancelNotifications(int id) async {
//     // NOTIFICATION_ID should be integer
//     await flutterLocalNotificationsPlugin.cancel(id);
//   }

//   Future<void> cancelAllNotifications() async {
//     await flutterLocalNotificationsPlugin.cancelAll();
//   }

//   Future<void> showNotificationWithActions(String message, String title) async {
//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//       '...',
//       '...',
//       // actions: <AndroidNotificationAction>[
//       //   AndroidNotificationAction('id_1', 'Action 1'),
//       //   AndroidNotificationAction('id_2', 'Action 2'),
//       //   AndroidNotificationAction('id_3', 'Action 3'),
//       // ],
//       // largeIcon: DrawableResourceAndroidBitmap(_bitmap)
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     const NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);
//     await flutterLocalNotificationsPlugin.show(
//         0, title, message, notificationDetails);
//   }
// }
