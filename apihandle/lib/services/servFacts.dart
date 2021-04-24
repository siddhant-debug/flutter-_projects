import 'dart:convert';

import 'package:apihandle/models/factsrespo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServFacts {
  Future<FactsResponse> getData() async {
    http.Response response;
    response = await http
        .get(Uri.parse('https://thegrowingdeveloper.org/apiview?id=2'));
    if (response.statusCode == 200) {
      FactsResponse factsResponse =
          FactsResponse.fromJson(json.decode(response.body));
      return factsResponse;
    } else {
      return null;
    }
  }
}
