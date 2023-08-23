import 'package:first_task/repository/user.dart';
import 'package:first_task/ui/dashboard/provider/dashboard_provider.dart';
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
      body: Consumer(
        builder: (context, ref, child) {
          // final userNotifier = ref.watch(userNotifierProvider);

          AsyncValue<List<User>> users = ref.watch(dashboardProviderProvider);

          return users.when(
              data: (users){
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
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

        },
      ),
    );
  }
}

