

import 'package:investintrust/data/models/social_media_links.dart';

import 'api_client.dart';

class Repository {
  final _apiClient = ApiClient();

  Future<SocialMediaLink> socialMediaLinks()
  => _apiClient.socialMediaLinks();

}