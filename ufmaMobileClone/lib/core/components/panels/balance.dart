import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../utils/Tag.dart';
import 'package:http/http.dart' as http;

const baseUrl = " http://localhost:3000/history";

Future<List<Tag>> fetchTags(http.Client client) async {
  final response = await client.get(baseUrl);

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseTags, response.body);
}

List<Tag> parseTags(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Tag>((json) => Tag.fromJson(json)).toList();
}
