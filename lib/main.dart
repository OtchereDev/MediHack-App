import 'package:emergency_alert/Provider/Ambulance/ampbulance_provider.dart';
import 'package:emergency_alert/Provider/Utils/util_provider.dart';
import 'package:emergency_alert/Views/Intro/init_screen.dart';
import 'package:emergency_alert/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'Emergency', options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UtilPovider()),
        ChangeNotifierProvider(create: (_) => AmbulanceStatusProvider()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              textTheme:
                  GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme)),
          home: const InitScreen()),
    );
  }
}
