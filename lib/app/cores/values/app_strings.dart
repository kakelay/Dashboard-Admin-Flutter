// ignore_for_file: non_constant_identifier_names

import 'package:admin_dashboard/app/cores/utils/asset_helper.dart';
 
class APIPath {
  static String LOGIN_ANNONYMOUSLY = 'verify/login-anonymously';
  static String LOGIN = 'verify/login-phone-number';

  static String REFRESH_TOKEN = 'verify/refresh/';
  static String ZONE = 'zone/customer/find-zones';
  static String USER_PROFILE = 'profiles';
  static String ACTIVE_PARKING = 'parking/user-active-parkings?take=15&skip=0';
  static String LISTEN_QR_CHECKIN = 'parking/customer/parking-events';

  static String CHECK_PHONE_AVAILABILITY =
      'verify/check-phone-number-availability';
}

class AppStrings {}

class LocalStorageKey {
  static String RECENT = 'recent';
  static String ACCESS_TOKEN = '__access_token__';
  static String ACCESS_TOKEN_EXPIRE = '__access_token_expire__';
  static String REFRESH_TOKEN = '__refresh_token__';
  static String REFRESH_TOKEN_EXPIRE = '__refresh_token_expire__';
  static String USER_INFO = 'user_info';
  static String LOCALE_CODE = 'locale_code';
  static String DEVICE_ID = 'device_id';
  static String ONBOARD_STATUS = 'onboard';
  static String LOGIN_STATUS = 'login_page';
}

class ImagePath {
  static String homeNoParking = _getPngPath('home_no_parking.png');
  static String login = _getPngPath('login.png');
  static String noVehicle = _getPngPath('no_vehicle.png');
  static String vehicleAppbarIcon = _getPngPath('vehicle_appbar_icon.png');
  static String emptyImage = _getPngPath('empty_image.png');
  static String vehicel = _getPngPath('empty_image.png');
  static String map = _getPngPath('map.png');
  static String qrcode = _getPngPath('qrcode.png');
  static String time = _getPngPath('time.png');
  static String phone = _getPngPath('phone.png');
  static String vehicelImages = _getPngPath('vehicel.png');
  static String login_bg = _getPngPath('login_bg.png');
  static String monkey = _getPngPath('monkey.png');
  static String monkey_back = _getPngPath('monkey_back.png');

  static String MealMonkeyLogo = _getPngPath('MealMonkeyLogo.png');

  static String _getPngPath(String pngName) => AssetHelper.imagePath(pngName);
}

class SvgAsset {
  static final RiHistiryFill = _getSvgPath('ri_history_fill.svg');
  static final EditFill = _getSvgPath('edit_fill.svg');
  static String eye_close = _getSvgPath('eye_close.svg');
  static String eye_open = _getSvgPath('eye_open.svg');
   static final arrow_left = _getSvgPath('arrow_left.svg');
  static final gallary = _getSvgPath('gallary.svg');
  static final pdf = _getSvgPath('pdf.svg');
  static final excel = _getSvgPath('excel.svg');
  static final next = _getSvgPath('next.svg');
  static final comment = _getSvgPath('comment.svg');
  static final camera = _getSvgPath('camera.svg');
  static final camera_outline = _getSvgPath('camera_outline.svg');
  static final warming = _getSvgPath('warming.svg');
  static final reject = _getSvgPath('reject.svg');
  static final assign = _getSvgPath('assign.svg');
  static final rating = _getSvgPath('rating.svg');
  static final language = _getSvgPath('language.svg');
  static final notifications = _getSvgPath('notifications.svg');
  static final information = _getSvgPath('information.svg');
  static final check_language = _getSvgPath('check_language.svg');
  static final info = _getSvgPath('info.svg');
  static final link = _getSvgPath('link.svg');
  static final folder = _getSvgPath('folder.svg');
  static final login_folder = _getSvgPath('login_folder.svg');
  static final logout = _getSvgPath('logout.svg');
  static final input_number = _getSvgPath('input_number.svg');
  static final forgot_password = _getSvgPath('forgot_password.svg');
  static final success = _getSvgPath('success.svg');
  static final more = _getSvgPath('more.svg');
  static final tick_circle = _getSvgPath('tick_circle.svg');
  static final blue_tick_circle = _getSvgPath('blue_tick_circle.svg');
  static final untick_circle = _getSvgPath('untick_circle.svg');
  static final select = _getSvgPath('select.svg');
  static final unselect = _getSvgPath('unselect.svg');
  static final call_back = _getSvgPath('call_back.svg');
  static final feedback = _getSvgPath('feedback.svg');
  static final user_feedback = _getSvgPath('user_feedback.svg');

  static final back = _getSvgPath('back.svg');
  static final filter = _getSvgPath('filter.svg');
  static final search = _getSvgPath('search.svg');
  static final drop_down = _getSvgPath('drop_down.svg');
  static final view_more = _getSvgPath('view_more.svg');
  static final less_more = _getSvgPath('less_more.svg');
  static final calendaSearch = _getSvgPath('calendar_search.svg');
  static final document_upload = _getSvgPath('document_upload.svg');
  static final upload_document = _getSvgPath('upload_document.svg');
  static final download = _getSvgPath('download.svg');
  static final change_password = _getSvgPath('change_password.svg');
  static final delete = _getSvgPath('delete.svg');
  static final delete_files = _getSvgPath('delete_files.svg');
  static final eye_watch = _getSvgPath('eye_watch.svg');
  static final history = _getSvgPath('history.svg');
  static final edit = _getSvgPath('edit.svg');
  static final calender = _getSvgPath('calender.svg');
  static final close = _getSvgPath('close.svg');
  static final logoTeam = _getSvgPath('logo_team.svg');
  static final home = _getSvgPath('home.svg');
  static final workflow = _getSvgPath('workflow.svg');
  static final notification = _getSvgPath('notification.svg');
  static final profile = _getSvgPath('profile.svg');
  static final create_flow = _getSvgPath('create_flow.svg');
  static final word = _getSvgPath('word.svg');
  static final powerpoint = _getSvgPath('powerpoint.svg');
  static final closeWithBackground = _getSvgPath('close_with_background.svg');
  static final tickWithBackground = _getSvgPath('tick_with_background.svg');
  static final achive = _getSvgPath('achive.svg');
  static final editFill = _getSvgPath('edit_fill.svg');
  static final about_app = _getSvgPath('about_app.svg');


  static String _getSvgPath(String svgName) => AssetHelper.SvgAsset(svgName);
}

class LottiPath {
  static final arrowback = _getLottiPath('arrowback.json');
  static final notifications = _getLottiPath('empty-notifications.json');

  static String _getLottiPath(String lottiName) =>
      AssetHelper.lottiPath(lottiName);
}

 