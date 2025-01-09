import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/models/movies_genre.dart';
import 'package:movies_app/view_models/movies/movies_provider.dart';

class GenreUtils {
  static List<MoviesGenre> movieGenresNames(List<int> genreIds, WidgetRef ref) {
    //TODO: We need to get the correct cachedGenres
    final movieState = ref.watch(moviesProvider);
    final cachedGenres = movieState.genresList;
    List<MoviesGenre> genresNames = [];
    for (var genreId in genreIds) {
      var genre = cachedGenres.firstWhere(
        (g) => g.id == genreId,
        orElse: () => MoviesGenre(id: 5448484, name: 'Unknown'),
      );
      genresNames.add(genre);
    }
    return genresNames;
  }
}
