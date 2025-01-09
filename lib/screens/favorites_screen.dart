import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/view_models/favorites/favorites_provider.dart';

import '../constants/my_app_icons.dart';
import '../widgets/movies/movies_widget.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Movies"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(favoritesProvider.notifier).clearAllFavs();
            },
            icon: const Icon(
              MyAppIcons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: Consumer(builder: (context, ref, child) {
        final favoriteState = ref.watch(favoritesProvider);
        if (favoriteState.favoritesList.isEmpty) {
          return const Center(
              child: Text("No favorite movies found")); // const SizedBox()
        }
        return ListView.builder(
          itemCount: favoriteState.favoritesList.length,
          itemBuilder: (context, index) {
            return MoviesWidget(
              movieModel: favoriteState.favoritesList.reversed.toList()[index],
            ); //const Text("data");
          },
        );
      }),
    );
  }
}
