import '../../domain/entities/onboarding_entity.dart';

class OnboardingModel extends OnboardingEntity {
  OnboardingModel({
    required super.title,
    required super.description,
    required super.svgAsset,
  });

  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      svgAsset: json['svg_asset'] ?? '',
    );
  }
}