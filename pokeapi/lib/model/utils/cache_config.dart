
/// Configuration for the caching system.
class CacheConfig {
  /// Whether caching is enabled.
  final bool enabled;
  
  /// How long items should remain in the cache before expiring.
  final Duration expiryDuration;
  
  /// Maximum number of items to store in memory cache (for faster access).
  final int maxMemoryCacheItems;
  
  /// Whether to try to use cached data when offline.
  final bool useWhenOffline;

  const CacheConfig({
    this.enabled = true,
    this.expiryDuration = const Duration(hours: 4),
    this.maxMemoryCacheItems = 100,
    this.useWhenOffline = true,
  });

  /// No caching at all.
  static const CacheConfig noCache = CacheConfig(enabled: false);
  
  /// Default caching configuration.
  static const CacheConfig defaultConfig = CacheConfig();
  
  /// Long-term caching configuration (30 days).
  static const CacheConfig longTerm = CacheConfig(
    expiryDuration: Duration(days: 30),
  );
  
  /// Short-term caching configuration (30 minutes).
  static const CacheConfig shortTerm = CacheConfig(
    expiryDuration: Duration(minutes: 30),
  );
}
