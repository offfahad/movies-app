import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/models/movies_model.dart';
import 'package:movies_app/view_models/favorites/favorites_provider.dart';

import '../../constants/my_app_icons.dart';

class FavoriteBtnWidget extends ConsumerWidget {
  final MovieModel movieModel;
  const FavoriteBtnWidget({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //bad practice
    //final favoriteState = ref.read(favoritesProvider);
    final favoritesList =
        ref.watch(favoritesProvider.select((state) => state.favoritesList));
    final isFavorite = favoritesList.any((movie) => movie.id == movieModel.id);
    return IconButton(
      onPressed: () {
        // TODO: Implement the favorite logic
        ref
            .watch(favoritesProvider.notifier)
            .addOrRemoveFromFavorites(movieModel);
      },
      icon: Icon(
        isFavorite
            ? MyAppIcons.favoriteRounded
            : MyAppIcons.favoriteOutlineRounded,
        color: isFavorite ? Colors.red : null,
      ),
    );
  }
}
