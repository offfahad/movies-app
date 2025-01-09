// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:movies_app/screens/movies_screen.dart';
// import 'package:movies_app/service/init_getit.dart';
// import 'package:movies_app/service/navigation_service.dart';
// import 'package:movies_app/view_models/movies/movies_provider.dart';

// import '../widgets/my_error_widget.dart';

// class SplashScreen extends ConsumerWidget {
//   const SplashScreen({super.key});

//   Future<void> _loadInitialData(WidgetRef ref) async {
//     await Future.microtask(() async {
//       await ref.read(moviesProvider.notifier).getMovies();
//     });
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: _loadInitialData(ref),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator.adaptive());
//           } else if (snapshot.hasError) {
//             if (ref.watch(moviesProvider).genresList.isNotEmpty) {
//               WidgetsBinding.instance.addPostFrameCallback((_) {
//                 getIt<NavigationService>()
//                     .navigateReplace(const MoviesScreen());
//               });
//             }
//             return MyErrorWidget(
//                 errorText: snapshot.error.toString(),
//                 retryFunction: () async {
//                   await _loadInitialData(ref);
//                 });
//           } else {
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               getIt<NavigationService>().navigateReplace(const MoviesScreen());
//             });
//           }
//           return const SizedBox.shrink();
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/view_models/favorites/favorites_provider.dart';

import '../service/init_getit.dart';
import '../service/navigation_service.dart';
import '../view_models/movies/movies_provider.dart';
import '../widgets/my_error_widget.dart';
import 'movies_screen.dart';

final intializationProvider = FutureProvider.autoDispose<void>((ref) async {
  ref.keepAlive();
  await Future.microtask(() async {
    await ref.read(favoritesProvider.notifier).loadFavorites();
    await ref.read(moviesProvider.notifier).getMovies();
  });
});

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initWatch = ref.watch(intializationProvider);
    return Scaffold(
      body: initWatch.when(data: (_) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          getIt<NavigationService>().navigateReplace(const MoviesScreen());
        });
        return const SizedBox.shrink();
      }, error: (error, _) {
        return MyErrorWidget(
          errorText: error.toString(),
          retryFunction: () => ref.refresh(intializationProvider),
        );
      }, loading: () {
        return const Center(child: CircularProgressIndicator.adaptive());
      }),
    );
  }
}
