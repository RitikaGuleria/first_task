import 'package:first_task/models/user.dart';
import 'package:first_task/models/user_list_response.dart';
import 'package:first_task/providers/dashboard.dart';
import 'package:first_task/providers/search.dart';
import 'package:first_task/repository/user_list_repository.dart';
import 'package:first_task/repository/user_list_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {


  final List<String> surnames = ['Bluth', 'Wong', 'Morris', 'Edwards'];
  final List<String> selectedSurnames = [];

  List<User> filterUsersBySurnames(List<User> users, List<String> selectedSurnames) {
    if (selectedSurnames.isEmpty) {
      return users;
    }
    return users.where((user) => selectedSurnames.contains(user.lastName)).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dashboardProvider.notifier).fetchUserDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: TextField(
              onChanged: (query) {
                final ans=ref.watch(searchProvider.notifier).updateSearchQuery(query);
                print("Search: $ans");
              },
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Search by name or email',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                suffixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: surnames
                  .map((category) => FilterChip(
                      label: Text(category),
                      selected: selectedSurnames.contains(category),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            selectedSurnames.add(category);
                          } else {
                            selectedSurnames.remove(category);
                          }
                        });
                      }))
                  .toList(),
            ),
          ),

          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                // final userNotifier = ref.watch(userNotifierProvider);

                // AsyncValue<List<User>> users = ref.read(dashboardProvider);
                final users = ref.watch(dashboardProvider);
                print("Ritika data: ${users.value}");

                final searchQuery = ref.watch(searchProvider);
                // final searchQueryLower = searchQuery?.toLowerCase() ?? '';

                return users.when(
                    data: (users) {

                      if (users == null) {
                          return const Center(child: CircularProgressIndicator(),);
                        }

                        final searchUsersByName = users?.data.where((user) =>
                        user.firstName.contains(searchQuery) ||
                        user.lastName.contains(searchQuery) ||
                        user.email.contains(searchQuery))
                            .toList();



                     print("Ritika data: $searchUsersByName");

                      final filteredUser = filterUsersBySurnames(searchUsersByName!, selectedSurnames);

                      return ListView.builder(
                        itemCount: searchUsersByName.isEmpty ? users?.data.length : searchUsersByName.length ,
                        itemBuilder: (context, index) {
                          final user = searchUsersByName.isEmpty ? users?.data[index] : searchUsersByName[index];
                          return Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(22),
                                child: Image.network(
                                  user!.avatar,
                                  fit: BoxFit.fill,
                                  height: 45,
                                  width: 45,
                                ),
                              ),
                              title: Text("${user.firstName} ${user.lastName}"),
                              subtitle: Text(user.email),
                            ),
                          );
                        },
                      );
                    },
                    error: (err, stack) => Text("error is : $err"),
                    loading: () => const Center(child: CircularProgressIndicator()));
              },
            ),
          )
        ],
      ),
    );
  }
}
