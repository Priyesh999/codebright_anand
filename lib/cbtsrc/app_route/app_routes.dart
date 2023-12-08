part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const WEBSITE = _Paths.WEBSITE;
  static const HOME_MOBILE = _Paths.HOME_MOBILE;
  static const LOGIN = _Paths.LOGIN;
  static const SPLASH=_Paths.SPLASH;
  static const REGISTER=_Paths.REGISTER;
  static const NEW_PASSWORD = _Paths.NEW_PASSWORD;
  static const SYNCMASTER = _Paths.SYNCMASTER;
  static const PROFILE = _Paths.PROFILE;
  static const UPDATE_POFILE = _Paths.UPDATE_POFILE;
  static const DETAIL_PRESENCE = _Paths.DETAIL_PRESENCE;
  static const ADD_EMPLOYEE = _Paths.ADD_EMPLOYEE;
  static const CHANGE_PASSWORD = _Paths.CHANGE_PASSWORD;
  static const ALL_PRESENCE = _Paths.ALL_PRESENCE;
  static const PIN = _Paths.PIN;
  static const BOTTOM_NAVIGATION = _Paths.BOTTOM_NAVIGATION;



  static const HOME_ADMIN = _Paths.HOME_ADMIN;
  static const library = _Paths.library;
  static const updates = _Paths.updates;
  static const browse = _Paths.browse;
  static const downloads = _Paths.downloads;
  static const more = _Paths.more;
  static const about = _Paths.about;
  static const String appearance = _Paths.appearance;
  static const backup = _Paths.backup;
  static const settings = _Paths.settings;
  static const browseSettings = _Paths.browseSettings;
  static const readerSettings = _Paths.readerSettings;
  static const serverSettings = _Paths.serverSettings;
  static const editCategories = _Paths.editCategories;
  static const extensions = _Paths.extensions;
  static const sources = _Paths.sources;
  static const manga = _Paths.manga;
  static const sourceManga = _Paths.sourceManga;
  static const globalSearch = _Paths.globalSearch;
  static const COMPANY = _Paths.COMPANY;
  static const ITEM_VIEW = _Paths.ITEM_VIEW;
  static const CBT_LF_PAGE = _Paths.CBT_LF_PAGE;
  static const SYNC_SCREEN = _Paths.SYNC_SCREEN;
  static const DAY_PLAN = _Paths.DAY_PLAN;
  static const TEST = _Paths.TEST;

}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const REGISTER = '/register';
  static const PIN = '/pin';
  static const HOME = '/home';
  static const WEBSITE = '/home-website';
  static const HOME_MOBILE = '/home_mobile';
  static const LOGIN = '/login';
  static const TEST = '/tets';
  static const NEW_PASSWORD = '/new-password';
  static const SYNCMASTER = '/sync_master';
  static const PROFILE = '/profile';
  static const UPDATE_POFILE = '/update-pofile';
  static const DETAIL_PRESENCE = '/detail-presence';
  static const ADD_EMPLOYEE = '/add-employee';
  static const CHANGE_PASSWORD = '/change-password';
  static const ALL_PRESENCE = '/all-presence';
  static const BOTTOM_NAVIGATION = '/buttom_navigation';
  static const HOME_ADMIN = '/';
  static const library = '/library';
  static const updates = '/updates';
  static const browse = '/master';
  static const downloads = '/downloads';
  static const more = '/more';
  static const about = '/about';
  static const appearance = '/appearance';
  static const backup = '/backup';
  static const settings = '/settings';
  static const browseSettings = '/master-settings';
  static const readerSettings = '/reader-settings';
  static const serverSettings = '/server-settings';
  static const editCategories = '/edit-categories';
  static const extensions = '/extensions';
  static const sources = '/company';
  static const manga = '/manga';
  static const sourceManga = '/source';
  static const globalSearch = '/global-search';
  static const COMPANY = '/company';
  static const ITEM_VIEW = '/item_view';
  static const CBT_LF_PAGE = '/cbt_lf_view';
  static const SYNC_SCREEN = '/sync_screen';
  static const DAY_PLAN = '/dwr-plan';

}
