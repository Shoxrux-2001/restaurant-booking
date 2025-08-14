import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_booking/core/errors/failures.dart';
import '../models/onboarding_model.dart';

class OnboardingRemoteDatasource {
  final FirebaseFirestore firestore;

  OnboardingRemoteDatasource({required this.firestore});

  Future<List<OnboardingModel>> getOnboardingData() async {
    try {
      final snapshot = await firestore.collection('onboarding_pages').get();
      return snapshot.docs.map((doc) => OnboardingModel.fromJson(doc.data())).toList();
    } catch (e) {
      throw ServerFailure('Firestore xatosi: $e');
    }
  }
}