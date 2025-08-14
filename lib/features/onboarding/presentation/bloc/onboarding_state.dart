import '../../domain/entities/onboarding_entity.dart';

abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingLoading extends OnboardingState {}

class OnboardingLoaded extends OnboardingState {
  final List<OnboardingEntity> data;
  OnboardingLoaded(this.data);
}

class OnboardingError extends OnboardingState {
  final String message;
  OnboardingError(this.message);
}