class FlavorConfig {
  Flavor? flavor;

  FlavorConfig({ this.flavor});

   FlavorConfig? _flavorConfig;

   FlavorConfig? get flavorConfig => _flavorConfig;

    configure(FlavorConfig flavorConfig) {
    _flavorConfig = flavorConfig;
  }
}

enum Flavor { DEV, PROD, STAGING }
