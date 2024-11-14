import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutex/core/services/firebase/firebase_helper.dart';
import 'package:flutex/core/utils/snackbar/custom_snackbar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock_firebase_firestore.mocks.dart';

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

    test('should return data as a stream from Firestore collection', () async* {
      // Setup mock for Firestore collection
      when(mockFirestore.collection(any)).thenReturn(mockCollectionRef);
      when(mockCollectionRef.snapshots()).thenAnswer(
        (_) => Stream.value(mockQuerySnapshot), // Return a mock stream
      );

      // Setup mock document snapshot data
      when(mockQuerySnapshot.docs).thenReturn([mockQueryDocumentSnapshot]);
      when(mockQueryDocumentSnapshot.data())
          .thenReturn({'field_name': 'test data'});

      // Call the method you want to test
      final stream = FirebaseQueryHelper.getCollectionsAsStream(
        collectionPath: 'test_collection',
      );

      // Expect that the stream emits the correct data
      await expectLater(
        stream,
        emits([
          {'field_name': 'test data'},
        ]),
      );
    });

    test('should handle FirebaseException and show snack bar on error',
        () async* {
      // Simulate an error
      when(mockFirestore.collection(any)).thenThrow(FirebaseException(
        plugin: 'firebase_firestore',
        message: 'Custom error message',
      ));

      final stream = FirebaseQueryHelper.getCollectionsAsStream(
        collectionPath: 'error_collection',
      );

      // The stream should be null due to the error
      expect(stream, isNull);

      // Ensure CustomSnackBar.showSnackBar was called with the expected message
      verify(() => CustomSnackBar.showSnackBar(
            message: 'Custom error message',
          )).called(1);
    });
  });
}
