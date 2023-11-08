import 'package:contact_list/model/contacts.dart';
import 'package:contact_list/providers/search_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contact_list/data/dummy_data.dart';

class SampleNotifier extends StateNotifier<bool> {
  SampleNotifier() : super(false);

  void onToggleRemove() {
    state = !state;
  }
}

final sampleNotifierProvider = StateNotifierProvider<SampleNotifier, bool>(
  (ref) => SampleNotifier(),
);
