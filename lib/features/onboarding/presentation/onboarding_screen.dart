import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_booking/features/onboarding/domain/entities/onboarding_entity.dart';
import 'bloc/onboarding_bloc.dart';
import 'bloc/onboarding_event.dart';
import 'bloc/onboarding_state.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_indicators.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    context.read<OnboardingBloc>().add(FetchOnboardingData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          List<OnboardingEntity> data = [];
          if (state is OnboardingLoaded) {
            data = state.data;
          } else if (state is OnboardingError) {
            data = [
              OnboardingEntity(
                title: "Nearby restaurants",
                description: "Default data loading failed.",
                svgAsset: "assets/svgs/location.svg",
              ),
              OnboardingEntity(
                title: "Select Favorites",
                description: "Default data.",
                svgAsset: "assets/svgs/order.svg",
              ),
              OnboardingEntity(
                title: "Good Food",
                description: "Default data.",
                svgAsset: "assets/svgs/food.svg",
              ),
            ];
          }
          return Stack(
            children: [
              PageView.builder(
                controller: _controller,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemCount: data.length,
                itemBuilder: (context, index) => OnboardingPage(
                  title: data[index].title,
                  description: data[index].description,
                  svgAsset: data[index].svgAsset,
                ),
                physics: const BouncingScrollPhysics(),
              ),
              Positioned(
                bottom: 50,
                left: 20,
                child: TextButton(
                  onPressed: () => context.go('/success'),
                  child: const Text('Skip'),
                ),
              ),
              Positioned(
                bottom: 50,
                right: 20,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward, color: Colors.green),
                  onPressed: () {
                    if (_currentPage < data.length - 1) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      context.go('/success');
                    }
                  },
                ),
              ),
              Positioned(
                bottom: 60,
                left: 0,
                right: 0,
                child: OnboardingIndicators(
                  currentPage: _currentPage,
                  pageCount: data.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
