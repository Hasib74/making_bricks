enum AppStateEnum {
  TESTING,
  NORMAL,
}

class AppState {


  AppStateEnum? appStateEnum;

  //set and get appStateEnum
  AppStateEnum? get getAppStateEnum => appStateEnum;

  set setAppStateEnum(AppStateEnum? appStateEnum) {
    this.appStateEnum = appStateEnum;
  }
}
