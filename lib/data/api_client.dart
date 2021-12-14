import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:investintrust/data/models/social_media_links.dart';

class ApiClient{
  static const _baseUrl = 'https://investintrust.nit.com.pk:8443/AssetConnectMobilePortal/UserService/';
  static const _epSocialMediaLinks = _baseUrl + 'socialMediaLinks';

  Future<SocialMediaLink> socialMediaLinks() async {
    try {
      final response = await http.post(
          Uri.parse(_epSocialMediaLinks));
      if (response.statusCode == 200) {
        SocialMediaLink socialMediaLink = SocialMediaLink.fromJson(
            jsonDecode(response.body));
        if (socialMediaLink.meta!.code.toString() == 200.toString()) {
          return socialMediaLink;
        } else {
          throw Exception(socialMediaLink.meta!.message);
        }
      } else {
        throw Exception('No Internet');
      }
    } catch(e) {
      throw Exception('No Internet');
    }
  }


}