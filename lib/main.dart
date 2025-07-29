import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/age_gate_screen.dart';
import 'screens/home_screen.dart';
import 'screens/face_swap_screen.dart';
import 'screens/fake_call_screen.dart';
import 'screens/gallery_screen.dart';
import 'services/gallery_service.dart';

void main() {
  runApp(const FaceSwapPrankApp());
}

class FaceSwapPrankApp extends StatelessWidget {
  const FaceSwapPrankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GalleryService()),
      ],
      child: MaterialApp(
        title: 'Face Swap Prank',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/age-gate',
        routes: {
          '/age-gate': (context) => const AgeGateScreen(),
          '/home': (context) => const HomeScreen(),
          '/face-swap': (context) => const FaceSwapScreen(),
          '/fake-call': (context) => const FakeCallScreen(),
          '/gallery': (context) => const GalleryScreen(),
        },
      ),
    );
  }
}