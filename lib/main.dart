import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_booking/features/onboarding/domain/usecase/get_onboarding_data.dart';
import 'package:restaurant_booking/features/presentation/routers/app_router.dart';
import 'features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'features/onboarding/data/datasources/onboarding_remote_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'utils/onboarding_data_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await OnboardingDataInitializer.addOnboardingPages();

  final firestore = FirebaseFirestore.instance;
  final remoteDatasource = OnboardingRemoteDatasource(firestore: firestore);
  final repository = OnboardingRepositoryImpl(
    remoteDatasource: remoteDatasource,
  );
  final getOnboardingData = GetOnboardingData(repository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingBloc>(
          create: (_) => OnboardingBloc(getOnboardingData: getOnboardingData),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        theme: ThemeData(primaryColor: Colors.green),
      ),
    ),
  );
}
