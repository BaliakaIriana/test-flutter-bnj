import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:test_flutter_bnj/features/live_event/data/models/live_event_model.dart';
import 'package:test_flutter_bnj/features/live_event/data/models/chat_message_model.dart';
import 'package:test_flutter_bnj/features/auth/data/models/user_model.dart';
import '../models/product_model.dart';

abstract class LiveEventRemoteDataSource {
  Future<List<LiveEventModel>> getLiveEvents();
  Future<LiveEventModel> getLiveEventById(String id);
  Future<List<ProductModel>> getProducts();
  Future<List<ChatMessageModel>> getChatMessages(String eventId);
  Future<List<UserModel>> getUsers();
}

@LazySingleton(as: LiveEventRemoteDataSource)
class LiveEventRemoteDataSourceImpl implements LiveEventRemoteDataSource {
  AssetBundle? bundle;
  Map<String, dynamic>? _cachedData;

  LiveEventRemoteDataSourceImpl();

  Future<void> _loadData() async {
    if (_cachedData == null) {
      final assetBundle = bundle ?? rootBundle;
      final jsonString = await assetBundle.loadString('lib/assets/mock-api-data.json');
      _cachedData = json.decode(jsonString);
    }
  }

  @override
  Future<List<LiveEventModel>> getLiveEvents() async {
    await _loadData();
    await Future.delayed(Duration(milliseconds: 300)); // Simulate network

    final List<dynamic> eventsJson = _cachedData!['liveEvents'];
    return eventsJson.map((json) => LiveEventModel.fromJson(json)).toList();
  }

  @override
  Future<LiveEventModel> getLiveEventById(String id) async {
    await _loadData();
    await Future.delayed(Duration(milliseconds: 200));

    final events = await getLiveEvents();
    return events.firstWhere((event) => event.id == id);
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    await _loadData();
    final List<dynamic> productsJson = _cachedData!['products'];
    return productsJson.map((json) => ProductModel.fromJson(json)).toList();
  }

  @override
  Future<List<ChatMessageModel>> getChatMessages(String eventId) async {
    await _loadData();
    final Map<String, dynamic> chatMessagesJson = _cachedData!['chatMessages'];
    final List<dynamic> eventMessages = chatMessagesJson[eventId] ?? [];
    return eventMessages.map((json) => ChatMessageModel.fromJson(json)).toList();
  }

  @override
  Future<List<UserModel>> getUsers() async {
    await _loadData();
    final List<dynamic> usersJson = _cachedData!['users'];
    return usersJson.map((json) => UserModel.fromJson(json)).toList();
  }
}