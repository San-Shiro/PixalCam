import 'filter_base.dart';
import 'retro_filter.dart';
import 'gameboy_filter.dart';
import 'cyberpunk_filter.dart';
import 'noir_filter.dart';
import 'sunset_filter.dart';
import 'clean_retro_filter.dart';
import 'warm_vibe_filter.dart';
import 'midnight_filter.dart';

/// Manages all available filters
class FilterManager {
  static final FilterManager _instance = FilterManager._internal();
  factory FilterManager() => _instance;
  FilterManager._internal();
  
  /// List of all available filters
  final List<PixelFilter> _filters = [
    RetroFilter(),
    GameBoyFilter(),
    CyberpunkFilter(),
    NoirFilter(),
    SunsetFilter(),
    CleanRetroFilter(),
    WarmVibeFilter(),
    MidnightFilter(),
  ];
  
  /// Get all available filters
  List<PixelFilter> get filters => _filters;
  
  /// Get filter by index
  PixelFilter getFilter(int index) {
    if (index < 0 || index >= _filters.length) {
      return _filters[0]; // Return default filter
    }
    return _filters[index];
  }
  
  /// Get filter by name
  PixelFilter? getFilterByName(String name) {
    try {
      return _filters.firstWhere((filter) => filter.name == name);
    } catch (e) {
      return null;
    }
  }
}
