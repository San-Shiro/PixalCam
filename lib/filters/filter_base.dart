import 'dart:typed_data';
import 'package:image/image.dart' as img;

/// Base class for all pixel art filters
abstract class PixelFilter {
  /// Name of the filter displayed to user
  String get name;
  
  /// Description of the filter
  String get description;
  
  /// Target width for downscaling (in pixels)
  int get targetWidth;
  
  /// Color palette for the filter (null for adaptive)
  List<String>? get palette;
  
  /// Number of colors  for adaptive quantization
  int get colorCount;
  
  /// Whether to apply median filter preprocessing
  bool get useMedianFilter;
  
  /// Median filter size (e.g., 7 means 7x7 kernel)
  int get medianFilterSize;
  
  /// Apply the filter to an image
  img.Image apply(img.Image image) {
    // Step 1: Apply median filter if needed (smoothing)
    if (useMedianFilter) {
      image = applyMedianFilter(image, medianFilterSize);
    }
    
    // Step 2: Downscale
    final originalWidth = image.width;
    final originalHeight = image.height;
    final aspectRatio = originalHeight / originalWidth;
    final scaledHeight = (targetWidth * aspectRatio).round();
    
    img.Image downscaled = img.copyResize(
      image,
      width: targetWidth,
      height: scaledHeight,
      interpolation: useMedianFilter ? img.Interpolation.linear : img.Interpolation.cubic,
    );
    
    // Step 3: Apply color quantization
    img.Image quantized;
    if (palette != null) {
      quantized = applyPalette(downscaled, palette!);
    } else {
      quantized = img.quantize(downscaled, numberOfColors: colorCount);
    }
    
    // Step 4: Upscale back to original size with nearest neighbor
    img.Image upscaled = img.copyResize(
      quantized,
      width: originalWidth,
      height: originalHeight,
      interpolation: img.Interpolation.nearest,
    );
    
    return upscaled;
  }
  
  /// Apply a specific color palette to an image
  img.Image applyPalette(img.Image image, List<String> hexColors) {
    // Convert hex colors to RGB
    final colors = hexColors.map((hex) => hexToColor(hex)).toList();
    
    // Create new image
    final result = img.Image(width: image.width, height: image.height);
    
    // For each pixel, find nearest color in palette
    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final pixel = image.getPixel(x, y);
        final r = pixel.r.toInt();
        final g = pixel.g.toInt();
        final b = pixel.b.toInt();
        
        // Find nearest color in palette
        int nearestColor = findNearestColor(r, g, b, colors);
        result.setPixel(x, y, img.ColorRgb8(
          colors[nearestColor][0],
          colors[nearestColor][1],
          colors[nearestColor][2],
        ));
      }
    }
    
    return result;
  }
  
  /// Convert hex color to RGB list
  List<int> hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    return [
      int.parse(hex.substring(0, 2), radix: 16),
      int.parse(hex.substring(2, 4), radix: 16),
      int.parse(hex.substring(4, 6), radix: 16),
    ];
  }
  
  /// Find nearest color in palette using Euclidean distance
  int findNearestColor(int r, int g, int b, List<List<int>> palette) {
    int nearestIndex = 0;
    double minDistance = double.infinity;
    
    for (int i = 0; i < palette.length; i++) {
      final dr = r - palette[i][0];
      final dg = g - palette[i][1];
      final db = b - palette[i][2];
      final distance = (dr * dr + dg * dg + db * db).toDouble();
      
      if (distance < minDistance) {
        minDistance = distance;
        nearestIndex = i;
      }
    }
    
    return nearestIndex;
  }
  
  /// Apply median filter for smoothing
  img.Image applyMedianFilter(img.Image image, int size) {
    final result = img.Image(width: image.width, height: image.height);
    final halfSize = size ~/ 2;
    
    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        List<int> reds = [];
        List<int> greens = [];
        List<int> blues = [];
        
        // Collect neighborhood pixels
        for (int dy = -halfSize; dy <= halfSize; dy++) {
          for (int dx = -halfSize; dx <= halfSize; dx++) {
            final nx = (x + dx).clamp(0, image.width - 1);
            final ny = (y + dy).clamp(0, image.height - 1);
            final pixel = image.getPixel(nx, ny);
            reds.add(pixel.r.toInt());
            greens.add(pixel.g.toInt());
            blues.add(pixel.b.toInt());
          }
        }
        
        // Sort and get median
        reds.sort();
        greens.sort();
        blues.sort();
        final medianIndex = reds.length ~/ 2;
        
        result.setPixel(x, y, img.ColorRgb8(
          reds[medianIndex],
          greens[medianIndex],
          blues[medianIndex],
        ));
      }
    }
    
    return result;
  }
}
