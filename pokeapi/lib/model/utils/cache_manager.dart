
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// A class that manages caching of API responses.
class CacheManager {
  static final CacheManager _instance = CacheManager._internal();
  
  /// The default expiration time for cache entries (4 hours).
  static const Duration defaultExpiryDuration = Duration(hours: 4);
  
  /// Returns the singleton instance of [CacheManager].
  factory CacheManager() {
    return _instance;
  }
  
  CacheManager._internal();
  
  /// Stores data in the cache.
  /// 
  /// [key] is the unique identifier for the cached data.
  /// [data] is the data to be cached.
  /// [expiryDuration] is how long the data should be considered valid (defaults to 4 hours).
  Future<bool> setData(String key, dynamic data, {Duration? expiryDuration}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final now = DateTime.now();
      final expiryTime = now.add(expiryDuration ?? defaultExpiryDuration);
      
      final cacheEntry = {
        'data': data,
        'expiryTime': expiryTime.millisecondsSinceEpoch,
      };
      
      return await prefs.setString(key, jsonEncode(cacheEntry));
    } catch (e) {
      print('Cache error: $e');
      return false;
    }
  }

  /// Retrieves data from the cache.
  /// 
  /// Returns null if the data doesn't exist or has expired.
  /// [key] is the unique identifier for the cached data.
  Future<dynamic> getData(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final cacheEntryJson = prefs.getString(key);
      
      if (cacheEntryJson == null) {
        return null;
      }
      
      final cacheEntry = jsonDecode(cacheEntryJson);
      final expiryTime = DateTime.fromMillisecondsSinceEpoch(cacheEntry['expiryTime']);
      
      if (DateTime.now().isAfter(expiryTime)) {
        // Cache has expired, remove it
        await prefs.remove(key);
        return null;
      }
      
      return cacheEntry['data'];
    } catch (e) {
      print('Cache retrieval error: $e');
      return null;
    }
  }

  /// Removes a specific item from the cache.
  /// 
  /// [key] is the unique identifier for the cached data.
  Future<bool> removeData(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.remove(key);
    } catch (e) {
      print('Cache removal error: $e');
      return false;
    }
  }

  /// Clears all cached data.
  Future<bool> clearCache() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.clear();
    } catch (e) {
      print('Cache clearing error: $e');
      return false;
    }
  }

  /// Clears expired cache entries.
  Future<void> clearExpiredCache() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final now = DateTime.now().millisecondsSinceEpoch;
      
      final allKeys = prefs.getKeys();
      for (String key in allKeys) {
        final cacheEntryJson = prefs.getString(key);
        if (cacheEntryJson != null) {
          try {
            final cacheEntry = jsonDecode(cacheEntryJson);
            final expiryTime = cacheEntry['expiryTime'];
            
            if (expiryTime != null && expiryTime < now) {
              await prefs.remove(key);
            }
          } catch (e) {
            // If we can't parse the entry, remove it
            await prefs.remove(key);
          }
        }
      }
    } catch (e) {
      print('Expired cache clearing error: $e');
    }
  }
}
