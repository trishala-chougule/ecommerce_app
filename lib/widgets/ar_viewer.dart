import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/src/webview_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  late WebViewController _controller;
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
    return  ModelViewer(
        src:  widget.modelPath,
        iosSrc: UniversalPlatform.isIOS ? widget.modelPath : null,
        //seamlessPoster: true,
        environmentImage: 'neutral',
        exposure: 1.0,
        interactionPromptThreshold: 0,
        shadowIntensity: 1,
        ar: true,
        arScale: ArScale.fixed,
        autoPlay: true,
        arModes: ["scene-viewer", "quick-look", "webxr"],
        arPlacement: ArPlacement.floor,
        autoRotate: true,
        cameraControls: true,
        disableZoom: true,
        cameraOrbit: '0deg 45deg auto',
        alt: '3D model',
        

        disablePan: true,
        disableTap: true,
      );
    
   /* if (UniversalPlatform.isWeb) {
      return ModelViewer(
        src: widget.modelPath,
        alt: "3D Model",
        ar: true,
        arModes: ["scene-viewer", "quick-look", "webxr"],
        autoRotate: true,
        loading: Loading.eager,
        cameraControls: true, //set to false
        autoPlay: false,  //set to false
        disableZoom: true,
        disableTap: true, // Prevents accidental movement
        arPlacement: /*widget.placement == "floor"*/ widget.placement.contains("floor") ? ArPlacement.floor : ArPlacement.wall,
        arScale: ArScale.fixed,
        iosSrc: UniversalPlatform.isIOS ? widget.modelPath : null,
        interactionPromptThreshold: 0,
        cameraOrbit: "0deg 45deg auto",
        shadowIntensity: 1,
        exposure: 1.0,
        backgroundColor: Colors.transparent,
      );
    } else if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {*/
     /* return ModelViewer(
        src: widget.modelPath,
        alt: "3D Model",
        ar: true,
        arModes: ["scene-viewer", "quick-look", "webxr"],
        autoRotate: true,
        loading: Loading.eager,
        cameraControls: false, 
      //  autoPlay: false,  //set to false
         disableZoom: true,
       // disableTap: true, // Prevents accidental movement
       // disablePan: true,
        arPlacement: widget.placement == "floor" ? ArPlacement.floor : ArPlacement.wall,
        arScale: ArScale.fixed,
        iosSrc: UniversalPlatform.isIOS ? widget.modelPath : null,
                backgroundColor: Colors.transparent,
        //interactionPromptThreshold: 0,
     //   cameraOrbit: "0deg 45deg auto",
      //  shadowIntensity: 1,
      //  exposure: 1.0,
        

      );*/
  
    
  /* } else {
      return const Center(child: Text('Platform not supported'));
    }*/
  }

}



