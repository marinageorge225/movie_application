import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:graduation_movie_app/ui/home_screen/tabs/profile/watch_list/cubit/watch_list_states.dart';
import 'package:shared_preferences/shared_preferences.dart';
 import '../../../../../../model/MovieDetailsResponse.dart';
import 'cubit/watch_list_view_model.dart';

class WatchListScreen extends StatelessWidget {
  final String token;
  const WatchListScreen({Key? key, required this.token}) : super(key: key);
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Watchlist"),
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<WatchListCubit, WatchListState>(
        builder: (context, state) {
          if (state is WatchListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WatchListError) {
            return Center(child: Text("Error: ${state.message}"));
          } else if (state is WatchListLoaded) {
            final movies = state.movies;

            if (movies.isEmpty) {
              return const Center(child: Text("No movies in watchlist."));
            }

            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final MovieDetailsResponse movie = movies[index];

                return ListTile(
                  leading: Image.network(
                    movie.data?.movie?.smallCoverImage ?? "Unknown",
                    width: 50,
                    height: 75,
                    fit: BoxFit.cover,
                  ),
                  title: Text(movie.data?.movie?.title ?? "Unknown"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      context.read<WatchListCubit>().removeMovieFromWatchlist(
                        movie.data!.movie!.id.toString(),
                        token,
                      );
                    },
                  ),
                );
              },
            );
          }
          return const Center(child: Text("Something went wrong."));
        },
      ),
    );
  }
}
