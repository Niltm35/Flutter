import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';

class Dog {
  final String name;
  final String location;
  final String description;
  String imageUrl;
  String photocharacter;

  int rating = 5;

  Dog(this.name, this.location, this.description, this.photocharacter);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    try {
      imageUrl = photocharacter;
    } catch (exception) {
      print(exception);
    }
  }
}
