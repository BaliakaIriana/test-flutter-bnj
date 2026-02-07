import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_flutter_bnj/features/live_event/data/datasources/live_event_remote_datasource.dart';
import 'package:test_flutter_bnj/features/live_event/data/models/live_event_model.dart';
import 'package:test_flutter_bnj/features/live_event/data/models/product_model.dart';

class MockAssetBundle extends Mock implements AssetBundle {}

void main() {
  late LiveEventRemoteDataSourceImpl dataSource;
  late MockAssetBundle mockAssetBundle;

  setUp(() {
    mockAssetBundle = MockAssetBundle();
    dataSource = LiveEventRemoteDataSourceImpl()..bundle = mockAssetBundle;
  });

  const tLiveEventsJson = {
    "liveEvents": [
      {
        "id": "evt_001",
        "title": "Vente Flash",
        "description": "Desc",
        "startTime": "2024-01-15T10:00:00Z",
        "status": "live",
        "seller": {
          "id": "seller_001",
          "name": "Marie",
          "storeName": "Store",
          "avatar": "url"
        },
        "products": ["prod_001", "prod_002"],
        "viewerCount": 100
      }
    ],
    "products": [
      {
        "id": "prod_001",
        "name": "Product 1",
        "description": "Desc 1",
        "price": 10.0,
        "images": [],
        "thumbnail": "thumb",
        "stock": 10,
        "isFeatured": false,
        "category": "cat",
        "rating": 4.0,
        "reviewsCount": 5
      }
    ]
  };

  group('getLiveEvents', () {
    test('should return List<LiveEventModel> when the asset exists', () async {
      // arrange
      when(() => mockAssetBundle.loadString('lib/assets/mock-api-data.json'))
          .thenAnswer((_) async => json.encode(tLiveEventsJson));

      // act
      final result = await dataSource.getLiveEvents();

      // assert
      expect(result, isA<List<LiveEventModel>>());
      expect(result.length, 1);
      expect(result.first.id, 'evt_001');
      verify(() => mockAssetBundle.loadString('lib/assets/mock-api-data.json')).called(1);
    });
  });

  group('getLiveEventById', () {
    test('should return LiveEventModel when the event exists', () async {
      // arrange
      when(() => mockAssetBundle.loadString('lib/assets/mock-api-data.json'))
          .thenAnswer((_) async => json.encode(tLiveEventsJson));

      // act
      final result = await dataSource.getLiveEventById('evt_001');

      // assert
      expect(result, isA<LiveEventModel>());
      expect(result.id, 'evt_001');
    });

    test('should throw an exception when the event does not exist', () async {
      // arrange
      when(() => mockAssetBundle.loadString('lib/assets/mock-api-data.json'))
          .thenAnswer((_) async => json.encode(tLiveEventsJson));

      // act & assert
      expect(() => dataSource.getLiveEventById('non_existent'), throwsA(isA<StateError>()));
    });
  });

  group('getProducts', () {
    test('should return List<ProductModel> when the asset exists', () async {
      // arrange
      when(() => mockAssetBundle.loadString('lib/assets/mock-api-data.json'))
          .thenAnswer((_) async => json.encode(tLiveEventsJson));

      // act
      final result = await dataSource.getProducts();

      // assert
      expect(result, isA<List<ProductModel>>());
      expect(result.length, 1);
      expect(result.first.id, 'prod_001');
    });
  });
}
