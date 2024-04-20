import 'package:flutter/material.dart';
import 'package:timers/di/provider_manager.dart';
import 'package:timers/presentation/create_timer/create_timer.dart';
import 'package:timers/presentation/timer_details/timer_details.dart';
import 'package:timers/presentation/timers/timers.dart';
import 'package:timers/themes/app_colors.dart';
import 'package:timers/themes/app_text_styles.dart';

void main() {
  ProviderManager().configureDependencies(getIt);
  getIt.allReady();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: colorSheme,
        textTheme: textTheme,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/create-timer': (context) => CreateTimerScreen(),
        '/details': (context) => const TimerDetailsScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: customGradient,
          ),
          child: SafeArea(
            child: TimersListScreen(),
          ),
        ),
      ),
    );
  }
}
