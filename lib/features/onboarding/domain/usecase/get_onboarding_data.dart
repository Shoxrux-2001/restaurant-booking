import '../entities/onboarding_entity.dart';
import '../repositories/onboarding_repository.dart';

class GetOnboardingData {
  final OnboardingRepository repository;

  GetOnboardingData(this.repository);

  Future<List<OnboardingEntity>> call() async {
    return await repository.getOnboardingData();
  }
}