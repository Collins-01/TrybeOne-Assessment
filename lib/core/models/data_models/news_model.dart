import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class News {
  final String id;
  final String title;
  final String description;
  final DateTime timestamp;
  final List<String> tags;
  final String image;
  final String author;
  News({
    required this.id,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.tags,
    required this.image,
    required this.author,
  });

  News copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? timestamp,
    List<String>? tags,
    String? image,
    String? author,
  }) {
    return News(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      timestamp: timestamp ?? this.timestamp,
      tags: tags ?? this.tags,
      image: image ?? this.image,
      author: author ?? this.author,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'tags': tags,
      'image': image,
      'author': author,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
      tags: List<String>.from(
        (map['tags'] as List<String>),
      ),
      image: map['image'] as String,
      author: map['author'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) =>
      News.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'News(id: $id, title: $title, description: $description, timestamp: $timestamp, tags: $tags, image: $image, author: $author)';
  }

  @override
  bool operator ==(covariant News other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.timestamp == timestamp &&
        listEquals(other.tags, tags) &&
        other.image == image &&
        other.author == author;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        timestamp.hashCode ^
        tags.hashCode ^
        image.hashCode ^
        author.hashCode;
  }
}
