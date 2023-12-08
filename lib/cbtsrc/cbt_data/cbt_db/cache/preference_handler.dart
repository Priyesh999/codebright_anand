import 'dart:convert';

import 'package:digigyan/cbtsrc/cbt_model/cbt_drop_down.dart';
import 'package:digigyan/cbtsrc/cbt_model/menu_model.dart';
import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/app_preferences.dart';

PreferenceHandler prefHandler = PreferenceHandler._();

class PreferenceHandler with _PrefKeys {
  PreferenceHandler._();

  Future<void> setLoginToken(String companyCode) async {
    await AppPrefrence().setString(_token, companyCode);
  }

  Future<String?> getLoginToken() async {
    return await AppPrefrence().getString(_token);
  }

  //============================================//

  Future<void> setUserId(String userId) async {
    await AppPrefrence().setString(_userId, userId);
  }

  Future<String?> getUserId() async {
    return AppPrefrence().getString(_userId);
  }

  Future<void> setCompanyID(String userId) async {
    await AppPrefrence().setString(_companyID, userId);
  }

  Future<String?> getCompanyID() async {
    return AppPrefrence().getString(_companyID);
  }

  Future<void> setDesignationId(String userId) async {
    await AppPrefrence().setString(_designation, userId);
  }

  Future<String?> getDesignationId() async {
    return AppPrefrence().getString(_designation);
  }

  Future<void> setDwrID(String userId) async {
    await AppPrefrence().setString(getDwrID_, userId);
  }

  Future<String?> getDwrID() async {
    return AppPrefrence().getString(getDwrID_);
  }

  //============================================//
  Future<void> setMoodId(String userId) async {
    await AppPrefrence().setString(_moodId, userId);
  }

  Future<String?> getMoodId() async {
    return AppPrefrence().getString(_moodId);
  }

  //============================================//
  Future<void> setOrganId(String userId) async {
    await AppPrefrence().setString(_organId, userId);
  }

  Future<String?> getOrganId() async {
    return AppPrefrence().getString(_organId);
  }

  Future<void> setCBTPICYN(String picYn) async {
    await AppPrefrence().setString(_pickyn, picYn);
  }

  Future<String?> getPICKYN() async {
    return AppPrefrence().getString(_pickyn);
  }

  Future<void> setCBTQRYN(String picYn) async {
    await AppPrefrence().setString(_qrYN, picYn);
  }

  Future<String?> getCBTQRYN() async {
    return AppPrefrence().getString(_qrYN);
  }

  Future<void> setCBTCL(String picYn) async {
    await AppPrefrence().setString(_cl, picYn);
  }

  Future<String?> getCBTCL() async {
    return AppPrefrence().getString(_cl);
  }

  Future<void> setCBTML(String picYn) async {
    await AppPrefrence().setString(_ml, picYn);
  }

  Future<String?> getCBTML() async {
    return AppPrefrence().getString(_ml);
  }

  Future<void> setCBTAL(String picYn) async {
    await AppPrefrence().setString(_al, picYn);
  }

  Future<String?> getCBTAL() async {
    return AppPrefrence().getString(_al);
  }

  Future<void> setCBTHalfDay(String picYn) async {
    await AppPrefrence().setString(_halfday, picYn);
  }

  Future<String?> getCBTHalfDay() async {
    return AppPrefrence().getString(_halfday);
  }

  Future<void> setCBTAbsentDay(String picYn) async {
    await AppPrefrence().setString(_absent, picYn);
  }

  Future<String?> getCBTAbsentDay() async {
    return AppPrefrence().getString(_absent);
  }

  Future<void> setPeresent(String picYn) async {
    await AppPrefrence().setString(_present, picYn);
  }

  Future<String?> getPeresent() async {
    return AppPrefrence().getString(_present);
  }

  Future<void> setCBTISOFLINEYN(String picYn) async {
    await AppPrefrence().setString(_isOflineyn, picYn);
  }

  Future<String?> getCBTISOFLINEYN() async {
    return AppPrefrence().getString(_isOflineyn);
  }

  Future<void> setCBTISRADIOUSYN(String picYn) async {
    await AppPrefrence().setString(_isRadious, picYn);
  }

  Future<String?> getCBTISRADIOUSYN() async {
    return AppPrefrence().getString(_isRadious);
  }

  Future<void> setCBTISLEAVETYPEYN(String picYn) async {
    await AppPrefrence().setString(_isLeaveType, picYn);
  }

  Future<String?> getCBTISLEAVETYPEYN() async {
    return AppPrefrence().getString(_isLeaveType);
  }

  Future<void> setCBTRADIOUSVALUE(String picYn) async {
    await AppPrefrence().setString(_attadenceRadiousValue, picYn);
  }

  Future<String?> getCBTRADIOUSVALUE() async {
    return AppPrefrence().getString(_attadenceRadiousValue);
  }

  //============================================//
  Future<void> setProblemId(String userId) async {
    await AppPrefrence().setString(_problemId, userId);
  }

  Future<String?> getProblemId() async {
    return AppPrefrence().getString(_problemId);
  }

  //============================================//
  Future<void> setProductId(String userId) async {
    await AppPrefrence().setString(_productId, userId);
  }

  Future<String?> getProductId() async {
    return AppPrefrence().getString(_productId);
  }

  //============================================//
  Future<void> setNewUserId(String userId) async {
    await AppPrefrence().setString(_newUSerId, userId);
  }

  Future<String?> getNewUsertId() async {
    return AppPrefrence().getString(_newUSerId);
  }

  Future<void> setLatLong(String latLong) async {
    await AppPrefrence().setString(_latLong, latLong);
  }

  Future<String?> getLatLong() async {
    return AppPrefrence().getString(_latLong);
  }

  Future<void> setDoctorName(String doctor) async {
    await AppPrefrence().setString(_doctor, doctor);
  }

  Future<String?> getDoctorName() async {
    return AppPrefrence().getString(_doctor);
  }

  Future<void> setSps(String sps) async {
    await AppPrefrence().setString(_specility, sps);
  }

  Future<String?> getSps() async {
    return AppPrefrence().getString(_specility);
  }

  //============================================//

  Future<void> setUserName(String userId) async {
    await AppPrefrence().setString(_userName, userId);
  }

  Future<String?> getUserName() async {
    return AppPrefrence().getString(_userName);
  }

  //=====================================================
  Future<void> setPincode(String langId) async {
    await AppPrefrence().setString(_pincode, langId);
  }

  Future<String?> getPincode() async {
    return AppPrefrence().getString(_pincode);
  }

  Future<void> setLoginPin(String langId) async {
    await AppPrefrence().setString(_login_pincode, langId);
  }

  Future<String?> getLoginPin() async {
    return AppPrefrence().getString(_login_pincode);
  }

  Future<void> setUserToken(String langId) async {
    await AppPrefrence().setString(_logon_token, langId);
  }

  Future<String?> getUserToken() async {
    return AppPrefrence().getString(_logon_token);
  }

  Future<void> setCompanyCode(String companyCode) async {
    await AppPrefrence().setString(_companyCode, companyCode);
  }

  Future<String> getCompanyCode() async {
    return AppPrefrence().getString(_companyCode);
  }

  Future<void> setCompanyName(String companyName) async {
    await AppPrefrence().setString(_companyName, companyName);
  }

  Future<String?> getCompanyName() async {
    return AppPrefrence().getString(_companyName);
  }

  Future<void> setEmployeeCode(String empCode) async {
    await AppPrefrence().setString(_empCode, empCode);
  }

  Future<String?> getEmployeeCode() async {
    return AppPrefrence().getString(_empCode);
  }

  //=====================================================
  Future<void> setMobile(String langId) async {
    await AppPrefrence().setString(_userMobile, langId);
  }

  Future<String?> getMobile() async {
    return AppPrefrence().getString(_userMobile);
  }

  //=====================================================
  Future<void> setAddress(String langId) async {
    await AppPrefrence().setString(_userAddress, langId);
  }

  Future<String?> getAddress() async {
    return AppPrefrence().getString(_userAddress);
  }

  //=====================================================
  Future<void> setAdharCard(String langId) async {
    await AppPrefrence().setString(_userAdharCard, langId);
  }

  Future<String?> getAdharCard() async {
    return AppPrefrence().getString(_userAdharCard);
  }

  //=====================================================
  Future<void> setUserImage(String langId) async {
    await AppPrefrence().setString(_userImg, langId);
  }

  Future<String?> getUserImage() async {
    return AppPrefrence().getString(_userImg);
  }

  //=====================================================

  Future<void> setPanCard(String langId) async {
    await AppPrefrence().setString(_userPanCard, langId);
  }

  Future<String?> getPanCard() async {
    return AppPrefrence().getString(_userPanCard);
  }

  //============================================//

  Future<void> setEmail(String userId) async {
    await AppPrefrence().setString(_userEmail, userId);
  }

  Future<String?> getEmail() async {
    return AppPrefrence().getString(_userEmail);
  }

  //============================================//

  Future<void> setPassword(String userId) async {
    await AppPrefrence().setString(_userPassword, userId);
  }

  Future<String?> getPassword() async {
    return AppPrefrence().getString(_userPassword);
  }

  //============================================//

  Future<void> setDob(String userId) async {
    await AppPrefrence().setString(_dob, userId);
  }

  Future<String?> getDob() async {
    return AppPrefrence().getString(_dob);
  }

  Future<void> setTrackingDistance(String distanceTracking) async {
    await AppPrefrence().setString(_distanceTracking, distanceTracking);
  }

  Future<String?> getTrackingDistance() async {
    return AppPrefrence().getString(_distanceTracking);
  }

  Future<void> setNotificationCompany(String notificationCompany) async {
    await AppPrefrence()
        .setString(_notificationComanyName, notificationCompany);
  }

  Future<String?> getNotificationCompany() async {
    return AppPrefrence().getString(_notificationComanyName);
  }

  Future<void> setCompanyLogo(String companyLogo) async {
    await AppPrefrence().setString(_companyLogo, companyLogo);
  }

  Future<String?> getCompanyLogo() async {
    return AppPrefrence().getString(_companyLogo);
  }

  Future<void> setNotificationMessage(String notificationMessage) async {
    await AppPrefrence().setString(_companyLogo, notificationMessage);
  }

  Future<String?> getNotificationMessage() async {
    return AppPrefrence().getString(_notificationMessage);
  }

  Future<void> setDistanceTrackingMeter(String distanceTrackingMeter) async {
    await AppPrefrence()
        .setString(_distanceTrackingMeter, distanceTrackingMeter);
  }

  Future<String?> getDistanceTrackingMeter() async {
    return AppPrefrence().getString(_distanceTrackingMeter);
  }

  Future<void> setISCheckInYN(String distanceTrackingMeter) async {
    await AppPrefrence().setString(_isCheckInYN, distanceTrackingMeter);
  }

  Future<String?> getISCheckInYN() async {
    return AppPrefrence().getString(_isCheckInYN);
  }

  Future<void> setISCheckOutYN(String distanceTrackingMeter) async {
    await AppPrefrence().setString(_isCheckOutYN, distanceTrackingMeter);
  }

  Future<String?> getISCheckOutYN() async {
    return AppPrefrence().getString(_isCheckOutYN);
  }

//=====================================================
  Future<void> setLogIn(bool isDownloaded) async {
    await AppPrefrence().setBoolean(_isDownloaded, isDownloaded);
  }

  Future<bool> isLogIn() async {
    return AppPrefrence().getBoolean(_isDownloaded);
  }

//=====================================================
  Future<void> setOtpVerify(bool isDownloaded) async {
    await AppPrefrence().setBoolean(_otpVerify, isDownloaded);
  }

  Future<bool> getOtpVerify() async {
    return AppPrefrence().getBoolean(_otpVerify);
  }

//=====================================================
  Future<void> setRememberMe(bool isDownloaded) async {
    await AppPrefrence().setBoolean(_remember, isDownloaded);
  }

  Future<bool> getRememberMe() async {
    return AppPrefrence().getBoolean(_remember);
  }

  Future<void> setMenuData(List<MenuModel?> menuModel) async {
    if (menuModel.isNotEmpty) {
      final _maps = List.generate(menuModel.length,
          (index) => menuModel[index]!.toMapForPreference()).toList();
      final _convertedString = jsonEncode(_maps);
      await AppPrefrence().setString(_menu_list_data, _convertedString);
    } else {
      await AppPrefrence().setString(_menu_list_data, "");
    }
  }

  List<MenuModel> getMenuData() {
    final _convertedString = AppPrefrence().getString(_menu_list_data);
    if (_convertedString.isEmpty) {
      return List.empty();
    }
    final _maps = jsonDecode(_convertedString) as List<dynamic>;
    final _menuData = List.generate(
            _maps.length, (index) => MenuModel.fromPreferenceMap(_maps[index]))
        .toList();
    return _menuData;
  }

  Future<void> setSubMenuData(MenuModel menuModel) async {
    if (menuModel != null) {
      final _maps = menuModel.toMapForPreference();
      final _convertedString = jsonEncode(_maps);
      await AppPrefrence().setString(_sub_menu_list_data, _convertedString);
    } else {
      await AppPrefrence().setString(_sub_menu_list_data, "");
    }
  }

  MenuModel getSubMenuData() {
    final _convertedString = AppPrefrence().getString(_sub_menu_list_data);
    if (_convertedString.isEmpty) {
      return MenuModel();
    }
    final _maps = jsonDecode(_convertedString);
    final _menuData = MenuModel.fromPreferenceMap(_maps);
    return _menuData;
  }

  Future<void> setCbtDrop(List<CbtDropDown?> menuModel) async {
    if (menuModel.isNotEmpty) {
      final _maps = List.generate(menuModel.length,
          (index) => menuModel[index]!.toMapForPreference()).toList();
      final _convertedString = jsonEncode(_maps);
      await AppPrefrence().setString(_drop_down, _convertedString);
    } else {
      await AppPrefrence().setString(_drop_down, "");
    }
  }

  List<CbtDropDown> getCbtDrop() {
    final _convertedString = AppPrefrence().getString(_drop_down);
    if (_convertedString.isEmpty) {
      return List.empty();
    }
    final _maps = jsonDecode(_convertedString) as List<dynamic>;
    final _menuData = List.generate(_maps.length,
        (index) => CbtDropDown.fromPreferenceMap(_maps[index])).toList();
    return _menuData;
  }


  // //----Mail Password --------------------------------------------------------------
  // Future<void> setMailPassword(String fcmToken) async {
  //   await AppPrefrence().setString(_mailPassword, fcmToken);
  // }
  //
  // Future<String> getMailPassword() async {
  //   return await AppPrefrence().getString(_mailPassword);
  // }

  //----initially sync status --------------------------------------------------------------
  Future<void> setInitiallySynced(bool synnnced) async {
    await AppPrefrence().setBoolean(_syncedInitially, synnnced);
  }

  Future<bool> getInitiallySynced() async {
    return await AppPrefrence().getBoolean(_syncedInitially);
  }

  //=====================================================

  Future<void> setIsMockedLocation(bool isMocked) async {
    await AppPrefrence().setBoolean(_isMockedLocation, isMocked);
  }

  Future<bool> getIsMockedLocation() async {
    return await AppPrefrence().getBoolean(_isMockedLocation);
  }

  //----FCM TOKEN --------------------------------------------------------------
  Future<void> setFCMToken(String fcmToken) async {
    await AppPrefrence().setString(_fcmToken, fcmToken);
  }

  Future<String?> getFCMToken() async {
    return await AppPrefrence().getString(_fcmToken);
  }

  //----IOS APN TOKEN --------------------------------------------------------------
  Future<void> setIosAPNToken(String apnToken) async {
    await AppPrefrence().setString(_apnToken, apnToken);
  }

  Future<String?> getIosAPNToken() async {
    return await AppPrefrence().getString(_apnToken);
  }

  void logout() {
    setLogIn(false);
    clearPref();
  }

  Future<void> clearPref() async {
    await AppPrefrence().clearPreference();
  }

  Future<void> setSalesStatus(String status) async {
    await AppPrefrence().setString(_salesStatus, status);
  }

  Future<String?> getSalesStatus() async {
    return await AppPrefrence().getString(_salesStatus);
  }


  Future<void> setCategoryId(String catId) async {
    await AppPrefrence().setString(_categoryID, catId);
  }

  Future<String?> getCategoryId() async {
    return await AppPrefrence().getString(_categoryID);
  }

  Future<void> setCategoryName(String categoryID) async {
    await AppPrefrence().setString(_categoryName, categoryID);
  }

  Future<String?> getCategoryName() async {
    return await AppPrefrence().getString(_categoryName);
  }

  Future<void> setClassId(String categoryID) async {
    await AppPrefrence().setString(_classId, categoryID);
  }

  Future<String?> getClassId() async {
    return await AppPrefrence().getString(_classId);
  }

  Future<void> setClassName(String categoryID) async {
    await AppPrefrence().setString(_className, categoryID);
  }

  Future<String?> getClassName() async {
    return await AppPrefrence().getString(_className);
  }
}

mixin _PrefKeys {
  // __();

  String get _localPin => '_localPin';

  String get _isDownloaded => '_isDownloaded';

  String get _userType => '_userType';

  String get _userId => '_userId';

  String get _companyID => '_company_id_';
  String get _designation => '_designation_';

  String get getDwrID_ => '_getDwrID';

  String get _moodId => '_moodId';

  String get _organId => '_organId';

  String get _pickyn => '_pickyn_';

  String get _qrYN => '_qrYN_';

  String get _cl => '_cl_';

  String get _ml => '_ml_';

  String get _al => '_al_';

  String get _absent => '_absent_';

  String get _halfday => '_halfday_';

  String get _present => '_present_';

  String get _isOflineyn => '_isOflineyn_';

  String get _isRadious => '_isRadious_';

  String get _isLeaveType => '_isLeaveType_';

  String get _attadenceRadiousValue => '_attadenceRadiousValue_';

  String get _problemId => '_problemId';

  String get _productId => '_productId';

  String get _newUSerId => 'newUSerId';

  String get _latLong => 'latLong';

  String get _doctor => 'doctor';

  String get _specility => 'specility';

  String get _cartLink => '_cart';

  String get _fbLink => '_fb';

  String get _instaLink => '_insta';

  String get _updateData => '_UpdateData ';

  String get _linkedInLink => '_linked';

  String get _twitterLink => '_twitter';

  String get _wishlistLink => '_wishlist';

  String get _otpVerify => '_otpVerify';

  String get _remember => '_remember';

  String get _syncedInitially => '_syncedInitially_';

  String get _isMockedLocation => '_isMockedLocation';

  String get _sideNavigation => '_SideNavigatio';

  String get _updates => '_uupdate';

  String get _userPassword => 'sideNavigation';

  String get _userName => '_userName';

  String get _pincode => '_pincode';

  String get _login_pincode => 'login_pin';
  String get _logon_token => 'login_token';

  String get _companyCode => 'comapny_code';

  String get _empCode => 'emp_code';

  String get _companyName => 'comapny_name';

  String get _dob => '_dob';

  String get _distanceTracking => '_distanceTracking_';

  String get _notificationComanyName => '_notificationComanyName_';

  String get _companyLogo => '_companyLogo_';

  String get _notificationMessage => '_notificationMessage_';

  String get _distanceTrackingMeter => '_distanceTrackingMeter_';

  String get _isCheckInYN => '_isCheckInYN_';

  String get _isCheckOutYN => '_isCheckOutYN_';

  String get _userFullName => '_userFullName';

  String get _userEmail => '_userEmail';

  String get _userMobile => '_userMobile';

  String get _userAddress => '_userAddress';

  String get _userCity => '_userCity';

  String get _userState => '_userState';

  String get _userAdharCard => '_userAdharCard';

  String get _userPanCard => '_userPanCard';

  String get _userImg => '_userImg';

  String get _token => '_companyCode';

  String get _drId => '_drId';

  String get _userProfilePic => '_userProfilePic';

  String get _localNotifStorage => '_localNotifStorage_';

  String get _keyDeviceToken_ => '_deviceToken_';

  String get _fcmToken => '_fcmToken_';

  String get _apnToken => '_apnToken_';

  String get _categoryID => '_category_';

  String get _categoryName => '_categoryName_';

  String get _classId => '_classId_';

  String get _className => '_className_';

  String get _salesStatus => '_salesStatus_';

  String get _menu_list_data => '_menu_list_data_';

  String get _drop_down => '_drop_down_';

  String get _customer_drop_down => '_customer_drop_down_';

  String get _sub_menu_list_data => '_sub_menu_list_data_';

  String get _sync_data => '_sync_data_';
}
