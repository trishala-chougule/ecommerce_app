import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/src/webview_controller.dart';

class ARViewerScreen extends StatefulWidget {
  final String modelPath;

  final String placement;

  const ARViewerScreen({
    super.key,
    required this.modelPath,
    required this.placement,
  });
  @override
  State<ARViewerScreen> createState() => _ARViewerScreenState();
}

class _ARViewerScreenState extends State<ARViewerScreen> {
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _checkARSupport();
  }

  Future<void> _checkARSupport() async {
    try {
      if (UniversalPlatform.isWeb) {
        // On web, we'll always show 3D viewer (no AR)
        setState(() {
          _isLoading = false;
        });
      } else if (UniversalPlatform.isAndroid) {
        // Check ARCore support on Android
        await _requestCameraPermission();
        // In a real app, you'd check ARCore availability
        // For demo purposes, we'll assume devices with Android 7.0+ support AR
        setState(() {
          _isLoading = false;
        });
      } else if (UniversalPlatform.isIOS) {
        // Check ARKit support on iOS
        await _requestCameraPermission();
        // For demo purposes, assume devices with iOS 11+ support AR
        setState(() {
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _errorMessage = 'AR not supported on this platform';
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error checking AR support: $e';
      });
    }
  }

  Future<void> _requestCameraPermission() async {
    if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
      final status = await Permission.camera.request();
      if (status.isDenied) {
        setState(() {
          _errorMessage = 'Camera permission denied. AR features unavailable.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return _buildLoadingScreen();
    }

    if (_errorMessage.isNotEmpty) {
      return _buildErrorScreen();
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildModelViewer(),
    );
  }

  Widget _buildLoadingScreen() {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Checking AR capabilities...'),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorScreen() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 60, color: Colors.red),
              const SizedBox(height: 20),
              Text(
                _errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModelViewer() {
    if (UniversalPlatform.isWeb) {
      return ModelViewer(
        src: widget.modelPath,
        alt: "3D Astronaut",
        ar: true,
        autoRotate: true,
        cameraControls: true,
        loading: Loading.eager,
        autoPlay: true,
        /*         shadowIntensity: 0, // Remove shadow effect
        environmentImage: "none", // Disable environmental lighting */
      );
    } else if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
      return ModelViewer(
        src: widget.modelPath,
        alt: "3D Model",
        ar: true,
        arModes: ["scene-viewer", "quick-look"],
        autoRotate: true,
        cameraControls: true,
        loading: Loading.eager,
        autoPlay: true,
        disableTap: true,
        disableZoom: true,
        arScale: ArScale.fixed,
        onWebViewCreated: (controller) {
          controller.evaluateJavascript("""
                const modelViewer = document.getElementById('modelViewer');
                modelViewer.addEventListener('load', () => {
                  modelViewer.cameraOrbit = '0deg 90deg auto';
                  modelViewer.disableZoom = true; // Disables pinch zooming
                });
              """);
        },
        iosSrc: UniversalPlatform.isIOS ? widget.modelPath : null,
      );
    } else {
      return const Center(child: Text('Platform not supported'));
    }
  }
}

extension on WebViewController {
  void evaluateJavascript(String s) {}
}
