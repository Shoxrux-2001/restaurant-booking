import '../../domain/repositories/onboarding_repository.dart';
import '../../domain/entities/onboarding_entity.dart';
import '../datasources/onboarding_remote_datasource.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingRemoteDatasource remoteDatasource;

  OnboardingRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<OnboardingEntity>> getOnboardingData() async {
    final models = await remoteDatasource.getOnboardingData();
    return models; // Modeldan entity ga o'tkazish (extends bo'lgani uchun to'g'ridan)
  }
}