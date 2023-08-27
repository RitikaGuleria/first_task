import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_provider.g.dart';

@riverpod
class SearchProvider extends _$SearchProvider{
  @override
  String build(){
    return '';
  }

  String _searchQuery = '';

  StateProvider<String> get searchQuery => StateProvider((ref) => _searchQuery);

  String updateSearchQuery(String query) {
    _searchQuery = query;
    state = _searchQuery;
    return query;
  }

}


