import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_booking/features/onboarding/domain/usecase/get_onboarding_data.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final GetOnboardingData getOnboardingData;

  OnboardingBloc({required this.getOnboardingData}) : super(OnboardingInitial()) {
    on<FetchOnboardingData>(_onFetchOnboardingData);
  }

  Future<void> _onFetchOnboardingData(FetchOnboardingData event, Emitter<OnboardingState> emit) async {
    emit(OnboardingLoading());
    try {
      final data = await getOnboardingData();
      emit(OnboardingLoaded(data));
    } catch (e) {
      emit(OnboardingError(e.toString()));
    }
  }
}