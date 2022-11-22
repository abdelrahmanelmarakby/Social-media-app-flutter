String authUserID = '';
String getAgoreTokenGeneratorLink(
    {required String channelName, required String uid}) {
  return "https://agora-token-service-production-30ed.up.railway.app/rtc/$channelName/1/$uid/1/?expiry=300";
}
