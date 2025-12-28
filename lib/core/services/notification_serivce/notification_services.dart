// import 'dart:convert';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:googleapis_auth/auth_io.dart';
// import '../../../firebase_options.dart';

// /// ****************************************************************
// /// 🔵 TOP-LEVEL BACKGROUND HANDLER
// /// هذا الجزء يعمل عند وصول إشعار عندما التطبيق بالخلفية أو مغلق
// /// ⚠️ لا يُعرض إشعار محلي هنا لتجنب التكرار على iOS
// /// ****************************************************************
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   // هنا يمكن معالجة البيانات فقط
// }

// /// ****************************************************************
// /// 🔵 NOTIFICATION SERVICE SINGLETON CLASS
// /// ****************************************************************
// class NotificationService {
//   static final NotificationService _instance = NotificationService._internal();
//   factory NotificationService() => _instance;
//   NotificationService._internal();

//   final FirebaseMessaging _messaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _local =
//       FlutterLocalNotificationsPlugin();

//   bool _isInitialized = false;

//   /// ****************************************************************
//   /// 🔵 INITIALIZATION (Call once in main)
//   /// ****************************************************************
//   Future<void> init() async {
//     if (_isInitialized) return;
//     _isInitialized = true;

//     await Firebase.initializeApp(
//         options: DefaultFirebaseOptions.currentPlatform);

//     await _initializeLocalNotifications();
//     await _requestPermissions();

//     // Foreground notifications
//     FirebaseMessaging.onMessage.listen(_onForegroundMessage);

//     // Background handler
//     FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

//     // Notification tap handler
//     FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);

//     // Check if app opened from terminated state via notification
//     await _checkTerminatedMessage();

//     // Print FCM token
//     final token = await _messaging.getToken();
//   }

//   get myToken => _messaging.getToken();

//   /// ****************************************************************
//   /// 🔵 INITIALIZE LOCAL NOTIFICATIONS
//   /// ****************************************************************
//   Future<void> _initializeLocalNotifications() async {
//     const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
//     const iosInit = DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//     );

//     const initSettings =
//         InitializationSettings(android: androidInit, iOS: iosInit);

//     await _local.initialize(initSettings,
//         onDidReceiveNotificationResponse: (NotificationResponse response) {});

//     // إنشاء قناة واحدة للأندرويد
//     const channel = AndroidNotificationChannel(
//       'high_importance_channel',
//       'High Importance Notifications',
//       description: 'Used for important notifications',
//       importance: Importance.high,
//     );

//     await _local
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);

//     // iOS foreground display options
//     await _messaging.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }

//   /// ****************************************************************
//   /// 🔵 REQUEST PERMISSION FOR iOS
//   /// ****************************************************************
//   Future<void> _requestPermissions() async {
//     final settings = await _messaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }

//   /// ****************************************************************
//   /// 🔵 FOREGROUND MESSAGE HANDLER
//   /// ****************************************************************
//   Future<void> _onForegroundMessage(RemoteMessage message) async {
//     if (kDebugMode)

//     // استخدم البيانات فقط لعرض إشعار محلي
//     if (message.data.isNotEmpty) {
//       const androidDetails = AndroidNotificationDetails(
//         'high_importance_channel',
//         'High Importance Notifications',
//         channelDescription: 'Used for important notifications',
//         importance: Importance.high,
//         priority: Priority.high,
//       );

//       const details = NotificationDetails(
//         android: androidDetails,
//         iOS: DarwinNotificationDetails(),
//       );

//       await _local.show(
//         message.hashCode,
//         message.data['title'],
//         message.data['body'],
//         details,
//       );
//     }
//   }

//   /// ****************************************************************
//   /// 🔵 WHEN USER TAPS NOTIFICATION (BACKGROUND)
//   /// ****************************************************************
//   void _onMessageOpenedApp(RemoteMessage message) {}

//   /// ****************************************************************
//   /// 🔵 WHEN APP IS TERMINATED AND OPENED BY NOTIFICATION
//   /// ****************************************************************
//   Future<void> _checkTerminatedMessage() async {
//     final message = await FirebaseMessaging.instance.getInitialMessage();
//     if (message == null) return;

//     if (kDebugMode) if (message.data.isNotEmpty) {
//       await _local.show(
//         message.hashCode,
//         message.data['title'],
//         message.data['body'],
//         const NotificationDetails(
//           android: AndroidNotificationDetails(
//             'high_importance_channel',
//             'High Importance Notifications',
//             channelDescription: 'Used for important notifications',
//             importance: Importance.high,
//             priority: Priority.high,
//           ),
//           iOS: DarwinNotificationDetails(),
//         ),
//       );
//     }
//   }
// }
