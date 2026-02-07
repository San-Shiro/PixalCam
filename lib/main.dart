import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'screens/camera_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get available cameras
  final cameras = await availableCameras();

  runApp(PixelCameraApp(cameras: cameras));
}

class PixelCameraApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const PixelCameraApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixel Camera',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: cameras.isEmpty
          ? const Scaffold(
              body: Center(
                child: Text('No camera available'),
              ),
            )
          : CameraScreen(cameras: cameras),
      debugShowCheckedModeBanner: false,
    );
  }
}
