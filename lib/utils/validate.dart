part of "utils.dart";
///VALIDATION CLASS
class Validate{
  // validate empty of string
  static String? notNull(val, {String? label}) {
    if (val.isEmpty) return (label != null ? label + " " : "") + 'can_not_be_empty'.tr;
  }

  //validate indonesia phone number
  static String? phone(val, {String? label}) {
    String pattern = r"^(^08)(\d{3,4}){2}\d{3,4}$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(val)) return 'invalid_phone_number'.tr;
  }

  // validate not null indonesia phone number
  static String? phoneNotNull(val, {String? label}) {
    String? nullCheck = Validate.notNull(val, label: label);
    if(nullCheck != null) return nullCheck;
    String? phoneCheck = Validate.phone(val, label: label);
    if(phoneCheck != null) return phoneCheck;
  }

  static String? dateValidate(datetime, {String? label}) {
    if (datetime == null) return (label != null ? label + " " : "") + 'can_not_be_empty'.tr;
  }

  static String? dropdown(val, {String? label}) {
    // if (val.isEmpty) return 'please_select_option'.tr;
    return val == null ? (label != null ? label + " " : "") + 'please_select_option'.tr : null;
  }

  static String? select(int id)
  {
    if (id == 0) return 'please_select_hobi'.tr;
  }
}