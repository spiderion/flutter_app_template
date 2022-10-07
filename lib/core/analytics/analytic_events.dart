import 'package:package_info_plus/package_info_plus.dart';

class SuperEvent {
  static const String PLATFORM = "Platform";
  static const String NAME = "Name";
  static const String AVATAR = "Avatar";
  static const String EMAIL = "Email";
  static const String USERNAME = "Username";
  static const String BUILD_NUMBER = "App Build Number";
  static const String APP_VERSION = "App Version";
  static const String USER_SIGHT_RADIUS = "User Sight Radius";
  static const String USER_PHONE_NUMBER = "User Phone Number";
  static const String PACKAGE_NAME = "Package Name";
  static const String SCREEN_NAME = "Screen Name";
  static const String SCREEN_VARIANT = "Screen Variant";
  static const String DATE_TIME = "Date Time";
}

class AnalyticEventNames {
  static const String SIGN_UP = "Signup";
  static const String LOG_IN = "Login";
  static const String CHECKOUT_TAP = "Checkout Tap";
  static const String PRODUCT_VIEWED = "Product Viewed";
  static const String MATCH_CREATED = "Match Created";
  static const String MATCH_STARTED = "Match Started";
  static const String INVITATION = "Invitation";
  static const String USER_NAVIGATION = "User Navigation";
  static const String FILTER_HOME_TREATMENTS_SELECTED = "Filter Home Treatments Selected";
  static const String COMMENT = "Comment";
  static const String USER_FEEDBACK = "User Feedback";
  static const String SYNC_UP_SUCCESS_FREELANCER = "Sync Up Freelancer Success";
  static const String SYNC_UP_SUCCESS_CLIENT = "Sync Up Client Success";

  static const String REQUEST_LOCATION_PERMISSIONS = "Request Location Permissions";
  static const String LOCATION_PERMISSION_GRANTED = "Location Permission Granted";
  static const String LOCATION_PERMISSION_DENIED = "Location Permission Denied";
  static const String OPEN_POST_FROM_HOME_PAGE = "Open Post From Home Page";
  static const String LOCATION_PERMISSION_PERMANENTLY_DENIED = "Location Permission Permanently Denied";
  static const String LOCATION_PERMISSION_PAGE = "Location Permission Page";
  static const String OPEN_LOGIN_PAGE = "Open Login Page";
  static const String CLOSE_LOGIN_PAGE = "Close Login Page";
  static const String COMMENTED_ON_POST = "Commented On Post";
  static const String POST_UPLOADED = "Post Uploaded";
  static const String APP_LAUNCHED = "App Launched";
  static const String APP_CLOSED = "App Closed";
  static const String STORE_INFO_CLICK = "Store Info Click";
  static const String LOGIN_FAILED = "Login Failed";
  static const String LOGIN_SUCCESS = "Login Success";
  static const String SIGN_UP_SUCCESS = "SignUp Success";
  static const String INPUT_PHONE_NUMBER_TAP = "Input Phone Number Tap";
  static const String APPOINTMENT_CONFIRMED = "Appointment Confirmed";
  static const String VISIT_BUSINESS_PROFILE = "Visit Business Profile";
  static const String OPEN_CHAT_PAGE = "Open Chat Page";
  static const String OPEN_SUMMARY_PAGE = "Open Summary Page";
  static const String CLIENT_BOOKINGS_CHECK = "Client Bookings Check";
  static const String CANCEL_BOOKING_BY_FREELANCER = "Cancel Booking By Freelancer";
  static const String RESCHEDULE_BOOKING_REQUEST = "Reschedule Booking Request";
  static const String CANCEL_BOOKING_BY_CLIENT = "Cancel Booking By Client";
  static const String DAY_CALENDAR_TAP = "Day Calendar Tap";
  static const String PERSONAL_BOOKINGS_CHECK = "Personal Bookings Check";
  static const String CHECK_WALLET_EVENT = "Check Wallet";
  static const String CHECK_ACTIVITIES = "Check Activities";
  static const String VISIT_BUSINESS_SERVICES = "Visit Business Services";
  static const String SEARCHED_MAP_RESULTS = "Searched Map Results";
  static const String MAP_INITIAL_RESULTS = "Initial Map Results";
  static const String VISIT_NON_BUSINESS_PROFILE = "Visit Non Business Profile";
  static const String OPEN_SEARCHED_USER_FROM_HOME_PAGE = "Open Searched User From Home Page";
  static const String BOOK_TAP_FROM_POST_PAGE = "Book Tap From Post Page";
  static const String BOOK_TAP_FROM_SERVICES_PAGE = "Book Tap From Services Page";
  static const String OPEN_SEARCH_MAP_PAGE = "Open Search Map Page";
  static const String APPLY_MAP_FILTER = "Apply Map Filter";
}

class UserProperties {
  static const String EMAIL = '\$email';
  static const String NAME = '\$name';
  static const String USERNAME = '\$username';
  static const String AVATAR = "\$avatar";
  static const String PHONE_NUMBER = "Phone Number";
  static const String TOTAL_STORES = "Total Stores";
  static const String IS_BUSINESS = "Is Business";
  static const String GENDER = "Gender";
  static const String PUSH_NOTIFICATIONS_TOKEN = "Push Notifications Token";
  static const String REGISTRATION_DATE = "Registration Date";
  static const String SIGHT_RADIUS_METERS = "Sight Radius Meters";
  static const String DISTINCT_ID = 'distinct_id';
  static const String CATEGORY = 'Category';
  static const String INSTAGRAM_SOCIAL_LINK = 'Instagram Social Link';
  static const String BUSINESS_OPERATING_LOCATION = 'Business Operating Location';
  static const String WORKING_TIME = 'Working Time';
  static const String BIO = 'Bio';
  static const String DATE_OF_BIRTH = 'Date Of Birth';
  static const String LAST_MATCH_CREATED = "Last Match Created";
  static const String PUSH_NOTIFICATIONS_ALERT_ON = "Push Notifications Alert On";
  static const String PUSH_NOTIFICATIONS_SOUND_ON = "Push Notifications Sound On";
  static const String PUSH_NOTIFICATIONS_BADGE_ON = "Push Notifications Badge On";
  static const String PUSH_NOTIFICATIONS_PROVISIONAL_ON = "Push Notifications Provisional On";
  static const String FUTURE_PAYMENTS = "Future Payments";
  static const String TOTAL_PENDING = "Total Pending";
  static const String TOTAL_EARNING = "Total Earnings";
  static const String SERVICES = "Services";
  static const String CLIENT_RATING = "Client Rating";
  static const String BUSINESS_RATING = "Business Rating";
  static const String RATING = "Rating";
}

class EventProperties {
  static const String CHOSEN_PERSON_RELATION_TYPE = "Chosen Person Relation Type";
  static const String PERSON_NAME = "Person Name";
  static const String RELATION_TYPE = "Relation Type";
  static const String AI_CARD_RESULT = "AI Card Result";
  static const String CHOSEN_PERSONALITIES = "Chosen Personalities";
}

class ScreenNames {
  static const String MAP_TAB = "Map_Tab";
  static const String HOME_TAB = "Home_Tab";
  static const String PROFILE_TAB = "Profile_Tab";
  static const String OVERVIEW_TAB = "Overview_Tab";
  static const String SIGNUP = "SignUp";
  static const String LOGIN_PAGE = "Login Page";
}

class InvitationProperty {
  static const String ACCEPTED = "Accepted";
  static const String REJECTED = "Rejected";

  static const String STATUS_UNKNOWN = "Unknown";
  static const String SHARED_LINK = "Shared Link";
  static const String RANDOM = "Random";
  static const String CONTACTS = "Contacts";
}

class ScreenVariants {
  static const String DEFAULT = "Default";
  static const String NEW_MATCH = "New Match";
  static const String REPLY_MATCH = "Reply Match";
  static const String PROFILE = "Profile";
}

class SuperAnalyticEvent {
  PackageInfo? _packageInfo;

  SuperAnalyticEvent();

  Future<PackageInfo?> _getPackageInfo() async {
    if (_packageInfo == null) {
      _packageInfo = await PackageInfo.fromPlatform();
    }
    return _packageInfo;
  }
}
