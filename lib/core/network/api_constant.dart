class ApiConstant {
  static const String baseurl = 'https://ac59-34-175-243-170.ngrok-free.app';
  static const String signUp = '$baseurl/signup';
  static const String login = '$baseurl/login';
  static const String userData = '$baseurl/users';
  static const String uploadPatientData = '$baseurl/predict';
  static const String getProfileData = '$baseurl/profile';
  static const String getHistoryData = '$baseurl/history';
  static const String getPdf = '$baseurl/generate_pdf';


  static const headers = {'Content-Type': 'application/json'};
}
