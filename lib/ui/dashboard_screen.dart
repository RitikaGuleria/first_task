import 'package:first_task/models/user.dart';
import 'package:first_task/project/routes/app_route_config.dart';
import 'package:first_task/project/routes/app_route_constants.dart';
import 'package:first_task/providers/dashboardList.dart';
import 'package:first_task/providers/search.dart';
import 'package:first_task/ui/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {

  final List<String> surnames = ['Bluth', 'Wong', 'Morris', 'Edwards'];
  final List<String> selectedSurnames = [];

  List<User> filterUsersBySurnames(
      List<User> users, List<String> selectedSurnames) {
    if (selectedSurnames.isEmpty) {
      return users;
    }
    return users
        .where((user) => selectedSurnames.contains(user.lastName))
        .toList();
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

    ref.watch(BottomNav().goRouter);

    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
        actions:  [
          IconButton(onPressed:() {
            context.go(BottomNav.loginPath);
            // context.pushNamed(BottomNav.login);
                // context.pushNamed(MyAppRouteConstants.loginRouteName);
                }, icon:  const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: SearchWidget(ref: ref),
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
                final users = ref.watch(dashboardProvider);
                print("Ritika data: ${users.value}");

                final searchQuery = ref.watch(searchProvider);

                return users.when(data: (users) {
                      if (users == null) {
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      final searchUsersByName = users.data
                          .where((user) =>
                              user.firstName.contains(searchQuery) ||
                              user.lastName.contains(searchQuery) ||
                              user.email.contains(searchQuery))
                          .toList();

                      print("Ritika data: $searchUsersByName");

                      // final filteredUser = filterUsersBySurnames(
                      //     searchUsersByName!, selectedSurnames);

                      return ListView.builder(
                        itemCount: searchUsersByName.isEmpty ? users.data.length : searchUsersByName.length,
                        itemBuilder: (context, index) {
                          final user = searchUsersByName.isEmpty ? users.data[index] : searchUsersByName[index];

                          return UserDataCardWidget(user: user);
                        },
                      );
                    },
                    error: (err, stack) => Text("error is : $err"),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()));
              },
            ),
          )
        ],
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    ref.invalidate(searchProvider);
    ref.invalidate(dashboardProvider);
    ref.invalidate(BottomNav().goRouter);
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (query) {
        final ans =
            ref.read(searchProvider.notifier).updateSearchQuery(query);
        print("Search: $ans");
      },
      decoration: InputDecoration(
        labelText: 'Search',
        hintText: 'Search by name or email',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.0)),
        suffixIcon: const Icon(Icons.search),
      ),
    );
  }
}

class UserDataCardWidget extends StatelessWidget {
  const UserDataCardWidget({
    super.key,
    required this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
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
        title: Text("${user!.firstName} ${user!.lastName}"),
        subtitle: Text(user!.email),
      ),
    );
  }
}

