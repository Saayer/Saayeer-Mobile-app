class EndPoints {
  static const String baseUrl = 'https://admintest.wannareach.com/api';
  static String register = '$baseUrl/users/register';
  static String login = '$baseUrl/users/login';
  static String getAreas = '$baseUrl/countries/1/districts';
  static String userAreas = '$baseUrl/users/interested-areas';
  static String getInterests = '$baseUrl/categories';
  static String userInterests = '$baseUrl/users/interested-activities';
  static String discoverCircles = "$baseUrl/circles/discover";
  static String myCircles = "$baseUrl/circles/my-circle";
  static String invitationsCircles = "$baseUrl/circles/invetations";
  static String joinCircle = "$baseUrl/circles/join-circle";
  static String unJoinCircle = "$baseUrl/circles/un-join-circle";
  static String approveCircleRequest = "$baseUrl/circles/approve-member";
  static String rejectCircleRequest = "$baseUrl/circles/reject-member";
  static String removeMember = "$baseUrl/circles/remove-member";
  static String showCircleUserProfile = "$baseUrl/circles/member-profile";
  static String withdrawCircleRequest = "$baseUrl/circles/withdrow-member";
  static String submitAnswers = "$baseUrl/circles/answers";
  static String userCircles = "$baseUrl/circles/requester_circles";
  static String getProfile = "$baseUrl/users/profile";
  static String getCircleAnswers = "$baseUrl/circles/get-answers";
  static String getCircleMemberships = "$baseUrl/circles/member-ships";
  static String finishJoiningCircle = "$baseUrl/circles/finish";
  static String selectCircleMemberships = "$baseUrl/circles/add-member-ship";

  static String circleDetails(String circleId) =>
      "$baseUrl/circles/circle/$circleId";

  static String getActivityFormatList(String circleId, String spaceId) =>
      "$baseUrl/activities/formats-method/$circleId/$spaceId";

  static String createActivity = "$baseUrl/activities/activity";
}
