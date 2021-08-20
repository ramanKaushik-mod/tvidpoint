import 'dart:io';

import 'package:tvidpoint/channelInfo.dart';
import 'package:tvidpoint/constants.dart';
import 'package:tvidpoint/videosList.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Services {
  String channelId;
  static const _baseUrl = 'www.googleapis.com';

  Services(this.channelId);

  Future<ChannelInfo> getChannelInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': channelId,
      'key': Constants.API_KEY
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(_baseUrl, '/youtube/v3/channels', parameters);

    Response response = await http.get(uri, headers: headers);
    ChannelInfo channelInfo = channelInfoFromJson(response.body);
    return channelInfo;
  }

  Future<VideosList> getVideosList(String playListId, String pageToken) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playListId,
      'maxResults': '8',
      'pageToken': pageToken,
      'key': Constants.API_KEY
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    VideosList videosList = videosListFromJson(response.body);
    return videosList;
  }
}
