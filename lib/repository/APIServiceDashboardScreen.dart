// import 'package:dio/dio.dart';
// import 'package:first_task/repository/user.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// final userNotifierProvider = StateNotifierProvider<Dashboard,List<User>>((ref) => Dashboard());
//
// class Dashboard extends StateNotifier<List<User>> {
//   Dashboard() : super([]);
//
//   void updateUsersFromJson(List<dynamic> jsonList){
//     final users = jsonList.map((e) => User.fromJson(e)).toList();
//     state = users;
//   }
//
// }
//
// class APIService extends ConsumerWidget {
//   final Dio dio = Dio();
//
//   Future<void> _fetchData(WidgetRef ref) async {
//     var response = await dio.get("https://reqres.in/api/users?page=2");
//     print(response.data);
//     final List<dynamic> list = response.data['data'];
//
//     final userNotifier = ref.read(userNotifierProvider.notifier);
//     userNotifier.updateUsersFromJson(list);
//   }
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     _fetchData(ref); // Fetch data when building the widget
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("List"),
//       ),
//       body: Consumer(
//         builder: (context, ref, child) {
//           final userNotifier = ref.watch(userNotifierProvider);
//
//           return ListView.builder(
//             itemCount: userNotifier.length,
//             itemBuilder: (context, index) {
//               final user = userNotifier[index];
//               return Card(
//                 elevation: 6,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(22),
//                 ),
//                 child: ListTile(
//                   leading: ClipRRect(
//                     borderRadius: BorderRadius.circular(22),
//                     child: Image.network(
//                       user.avatar,
//                       fit: BoxFit.fill,
//                       height: 45,
//                       width: 45,
//                     ),
//                   ),
//                   title: Text("${user.firstName} ${user.lastName}"),
//                   subtitle: Text(user.email),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
