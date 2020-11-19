import 'package:mobile_number/mobile_number.dart';

class GetNumber {
  var hasPermission;
  Future<List<String>> checkPermission() async {
    hasPermission = await MobileNumber.hasPhonePermission;
    if (hasPermission) {
      List<String> mobileNumbers = [];
      final List<SimCard> simCardInfo = await MobileNumber.getSimCards;
      mobileNumbers.add(simCardInfo[0].number);
      mobileNumbers.add(simCardInfo[1].number);
      print(mobileNumbers);
      return mobileNumbers;
    } else {
      await MobileNumber.requestPhonePermission;
      return null;
    }
  }
}
