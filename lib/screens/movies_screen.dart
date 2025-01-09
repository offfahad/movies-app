import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/view_models/movies/movies_provider.dart';
import 'package:movies_app/view_models/movies/movies_state.dart';

import '../constants/my_app_icons.dart';
import '../enums/theme_enums.dart';
import '../service/init_getit.dart';
import '../service/navigation_service.dart';
import '../view_models/theme_provider.dart';
import '../widgets/movies/movies_widget.dart';
import 'favorites_screen.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
        actions: [
          IconButton(
            onPressed: () {
              // getIt<NavigationService>().showSnackbar();
              // getIt<NavigationService>().showDialog(MoviesWidget());
              getIt<NavigationService>().navigate(const FavoritesScreen());
            },
            icon: const Icon(
              MyAppIcons.favoriteRounded,
              color: Colors.red,
            ),
          ),
          Consumer(builder: (context, ref, child) {
            final themeState = ref.watch(themeProvider);
            return IconButton(
              onPressed: () async {
                await ref.read(themeProvider.notifier).toggleTheme();
              },
              icon: Icon(
                themeState == ThemeEnums.dark
                    ? MyAppIcons.darkMode
                    : MyAppIcons.lightMode,
              ),
            );
          })
        ],
      ),
      body: Consumer(builder: (context, ref, child) {
        final moviesState = ref.watch(moviesProvider);
        if (moviesState.isLoading && moviesState.moviesList.isEmpty) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (moviesState.fetchMoviesError.isNotEmpty) {
          return Center(
            child: Text(moviesState.fetchMoviesError),
          );
        }
        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent &&
                !moviesState.isLoading) {
              ref.read(moviesProvider.notifier).getMovies();
              return true;
            }
            return false;
          },
          child: ListView.builder(
            itemCount: moviesState.moviesList.length,
            itemBuilder: (context, index) {
              return MoviesWidget(movieModel: moviesState.moviesList[index]);
            },
          ),
        );
      }),
    );
  }
}
