import 'package:first_task/repository/user.dart';
import 'package:first_task/ui/dashboard/provider/dashboard_provider.dart';
import 'package:first_task/ui/dashboard/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final userNotifierProvider = StateNotifierProvider<Dashboard,List<User>>((ref) => Dashboard());
//
// class Dashboard extends StateNotifier<List<User>> {
//   Dashboard() : super([]);
// }

class DashboardScreeen extends ConsumerStatefulWidget {

  @override
  ConsumerState createState() => _APIServiceState();
}

class _APIServiceState extends ConsumerState<DashboardScreeen> {

  final List<String> surnames = ['Lawson','Funke','Fields','Edwards'];
  final List<String> selectedSurnames = [];

  List<User> filterUsersBySurnames(List<User> users, List<String> selectedSurnames)
  {
    if(selectedSurnames.isEmpty){
      return users;
    }
    return users.where((user) => selectedSurnames.contains(user.lastName)).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dashboardProviderProvider.notifier).fetchUsers();
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
          Padding(padding: const EdgeInsets.all(6),
          child: TextField(
                onChanged: (query){
                  ref.watch(searchProviderProvider.notifier).updateSearchQuery(query);
                },
                decoration:  InputDecoration(
                  labelText: 'Search',
                  hintText: 'Search by name or email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(22.0)),
                  suffixIcon: const Icon(Icons.search),
                ),
              ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            child: Expanded(child: Container(
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: surnames.map((category) => FilterChip(label: Text(category),
                    selected: selectedSurnames.contains(category),
                    onSelected: (selected){
                      setState(() {
                        if(selected){
                          selectedSurnames.add(category);
                        }else{
                          selectedSurnames.remove(category);
                        }
                      });
                })).toList(),
              ),

            )),
          ),
          Expanded(child: Consumer(
            builder: (context, ref, child) {
              // final userNotifier = ref.watch(userNotifierProvider);

              AsyncValue<List<User>> users = ref.watch(dashboardProviderProvider);
              final searchQuery = ref.watch(searchProviderProvider);

              return users.when(
                  data: (users){
                    final searchUsersbyName = users.where((user) => user.firstName.contains(searchQuery) ||
                        user.lastName.contains(searchQuery) || user.email.contains(searchQuery)).toList();

                    final filteredUser = filterUsersBySurnames(searchUsersbyName, selectedSurnames);

                    return ListView.builder(
                      itemCount: filteredUser.length,
                      itemBuilder: (context, index) {
                        final user = filteredUser[index];
                        return Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(22),
                              child: Image.network(
                                user.avatar,
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
                  error: (err,stack) => Text("error is : $err"),
                  loading:()=> Center(child : CircularProgressIndicator()));

            },),)
        ],

  ),
    );
  }
}

