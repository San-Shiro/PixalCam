# Camera & Image Processing Libraries

This document outlines the libraries used in the **Pixel Camera** app and provides recommendations for future expansion.

## Current Library Stack

The app is built using Flutter/Dart and leverages the following core libraries:

### 1. [camera](https://pub.dev/packages/camera) (v0.10.5+5)
- **Purpose**: Official Flutter plugin for camera access.
- **Usage**: Handles camera enumeration, preview stream, and photo capture.
- **Key Files**: `main.dart`, `camera_screen.dart`.

### 2. [image](https://pub.dev/packages/image) (v4.1.3)
- **Purpose**: CPU-based image processing in pure Dart.
- **Usage**: Applied for custom pixel-art filters (median filtering, quantization, upscaling).
- **Key Files**: `filter_base.dart` and individual filter implementations.

---

## Technical Architecture

The current architecture follows a clean separation of concerns:
- **`PixelFilter` Base**: Defines the interface for all image processing logic.
- **`FilterManager`**: A central registry for managing available filters.
- **Post-Capture Processing**: Filters are applied to the captured image for maximum quality.

---

## Future Recommendations

Depending on the desired features, the following libraries are recommended:

### Real-Time & GPU-Accelerated Filtering
If you want to apply filters to the live preview without lag:
- **[flutter_image_filters](https://pub.dev/packages/flutter_image_filters)**: Provides GPU-accelerated filters (blur, sketch, etc.) using GLSL shaders.
- **[gpu_image](https://pub.dev/packages/gpu_image)**: A Flutter port for standard GPUImage operations.

### Instagram-Style Color Effects
- **[photofilters](https://pub.dev/packages/photofilters)**: A large collection of pre-built preset filters (contrast, brightness, saturation).

### Advanced Image Editing
- **[image_editor](https://pub.dev/packages/image_editor)**: Native-speed cropping, rotation, and complex image composition.

### Computer Vision & AI
- **[opencv_dart](https://pub.dev/packages/opencv_dart)**: Integrate OpenCV for edge detection, object recognition, or advanced image math.
- **[google_ml_kit](https://pub.dev/packages/google_ml_kit)**: For face detection, barcode scanning, or text recognition.

### Custom Shaders (Advanced)
For absolute control, you can write custom **GLSL Fragment Shaders** to process the `CameraPreview` texture directly using Flutter's `FragmentProgram` API.
