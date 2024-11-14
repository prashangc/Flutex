import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutex/core/services/firebase/firebase_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mock_firebase_firestore.mocks.dart';

@GenerateMocks([
  FirebaseFirestore,
  CollectionReference,
  QuerySnapshot,
  QueryDocumentSnapshot
])
void main() {
  group('FirebaseQueryHelper.getCollectionsAsStream', () {
    late MockFirebaseFirestore mockFirestore;
    late MockCollectionReference<Map<String, dynamic>> mockCollectionRef;
    late MockQuerySnapshot<Map<String, dynamic>> mockQuerySnapshot;
    late MockQueryDocumentSnapshot<Map<String, dynamic>>
        mockQueryDocumentSnapshot;

    setUp(() {
      mockFirestore = MockFirebaseFirestore();
      mockCollectionRef = MockCollectionReference();
      mockQuerySnapshot = MockQuerySnapshot();
      mockQueryDocumentSnapshot = MockQueryDocumentSnapshot();
    });

    test('should return a stream of data from Firestore collection', () async {
      // Mock the Firestore collection reference and snapshots
      when(mockFirestore.collection(any)).thenReturn(mockCollectionRef);
      when(mockCollectionRef.snapshots()).thenAnswer(
        (_) => Stream.value(mockQuerySnapshot),
      );

      // Mock document data
      when(mockQuerySnapshot.docs).thenReturn([mockQueryDocumentSnapshot]);
      when(mockQueryDocumentSnapshot.data())
          .thenReturn({'field_name': 'test data'});

      // Call the function and collect results
      final stream = FirebaseQueryHelper.getCollectionsAsStream(
        collectionPath: 'test_collection',
      );

      expect(stream, isNotNull);

      await expectLater(
        stream,
        emits([
          {'field_name': 'test data'}
        ]),
      );
    });
  });
}
