# Pixel Camera - Flutter Camera App with Pixel Art Filters

A Flutter camera application for Android that applies pixel art style filters to photos. Converted from Python implementations to Dart for optimal mobile performance.

## Features

- **8 Pixel Art Filters**: Retro, GameBoy, Cyberpunk, Noir, Sunset, Clean Retro, Warm Vibe, and Midnight
- **Real-time Preview Toggle**: Choose to see filtered preview in real-time or apply filter only on capture
- **Easy Filter Selection**: Horizontal carousel to browse and select filters
- **High-Quality Output**: Saves filtered images at 95% JPEG quality

## Filters

1. **Retro**: Adaptive 6-color quantization with high dither
2. **GameBoy**: Classic olive green 4-color palette
3. **Cyberpunk**: Neon pinks and blues  with 5-color palette
4. **Noir**: High contrast monochrome (3 colors: black, gray, white)
5. **Sunset**: Warm vintage 5-color palette
6. **Clean Retro**: Median-filtered adaptive 7-color quantization
7. **Warm Vibe**: Reddish/peach tones with median filtering
8. **Midnight**: Dark bluish tones with median filtering

## Setup

### Prerequisites

- Flutter SDK (latest version)
- Android Studio or VS Code
- Android device or emulator

### Installation

1. Navigate to the project directory:
   ```bash
   cd "c:\PS\Camera App"
   ```

2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Usage

1. **Grant Permissions**: Allow camera and storage permissions when prompted
2. **Select a Filter**: Swipe through the filter carousel at the bottom
3. **Toggle Preview**: 
   - **ON**: See the filtered camera feed in real-time
   - **OFF**: Normal preview, filter applied when capturing
4. **Capture Photo**: Tap the large circular button
5. **View Saved Photos**: Images are saved to the app's documents directory

## Project Structure

```
lib/
├── main.dart                          # App entry point
├── screens/
│   └── camera_screen.dart            # Main camera interface
└── filters/
    ├── filter_base.dart              # Base filter class with utilities
    ├── filter_manager.dart           # Central filter management
    ├── retro_filter.dart            # Retro filter
    ├── gameboy_filter.dart          # GameBoy filter
    ├── cyberpunk_filter.dart        # Cyberpunk filter
    ├── noir_filter.dart             # Noir filter
    ├── sunset_filter.dart           # Sunset filter
    ├── clean_retro_filter.dart      # Clean Retro filter
    ├── warm_vibe_filter.dart        # Warm Vibe filter
    └── midnight_filter.dart         # Midnight filter
```

## Adding New Filters

To add a new filter:

1. Create a new file in `lib/filters/` (e.g., `my_filter.dart`)
2. Extend the `PixelFilter` base class:
   ```dart
   import 'filter_base.dart';
   
   class MyFilter extends PixelFilter {
     @override
     String get name => 'My Filter';
     
     @override
     String get description => 'My custom filter';
     
     @override
     int get targetWidth => 150;
     
     @override
     List<String>? get palette => ['#ff0000', '#00ff00', '#0000ff'];
     
     @override
     int get colorCount => 3;
     
     @override
     bool get useMedianFilter => false;
     
     @override
     int get medianFilterSize => 0;
   }
   ```
3. Add it to `filter_manager.dart`:
   ```dart
   import 'my_filter.dart';
   
   final List<PixelFilter> _filters = [
     // ... existing filters
     MyFilter(),
   ];
   ```

## Technical Details

- **Image Processing**: Uses the `image` package for pixel manipulation
- **Camera**: Uses `camera` package for camera access
- **Algorithms**: 
  - Color quantization for palette reduction
  - Median filtering for smoothing (on select filters)
  - Nearest-neighbor upscaling for sharp pixels
  - Euclidean distance for nearest color matching

## Performance

- Median filtering is computationally intensive - used only on "Clean" filters
- Real-time preview may impact performance on lower-end devices
- Post-capture processing ensures best quality without frame rate concerns

## License

For personal use only.
