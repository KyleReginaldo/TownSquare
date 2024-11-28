import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../../widgets/widgets.dart';

class TsSearchDelegate extends SearchDelegate<String> {
  // Dummy list
  final List<String> searchList = [
    'All',
    'Sports',
    'Food',
    'Kids',
    'Creative',
    'Popular',
    'Calm',
  ];
  @override
  TextStyle get searchFieldStyle => const TextStyle(color: kBlack);

  // These methods are mandatory you cannot skip them.
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          // When pressed here the query will be cleared from the search bar.
        },
      ),
    ];
  }

  @override
  String get searchFieldLabel => 'Search category';

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> searchResults = searchList
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              close(context, searchResults[index]);
            },
            title: TsText(searchResults[index]),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestionList = query.isEmpty
        ? []
        : searchList
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            close(context, suggestionList[index]);

            query = suggestionList[index];
            // Show the search results based on the selected suggestion.
          },
        );
      },
    );
  }
}
