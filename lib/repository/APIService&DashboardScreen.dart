// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:first_task/repository/user.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// final APIUserProvider = Provider<APIService>((ref) => APIService());
//
// final userDataProvider = FutureProvider<void>((ref) async {
//   return ref.watch(APIUserProvider).fetchData();
// });
//
// class APIService extends ConsumerWidget {
//   final Dio dio=Dio();
//   List<User> _users=[];
//
//   // Future<List<dynamic>> fetchData() async{
//   Future<void> fetchData() async{
//
//     var response = await  dio.get("https://reqres.in/api/users?page=2");
//     print(response.data);
//     final List list = response.data;
//     // return response.data['data'];
//     _users = list.map((e) => User.fromJson(e)).toList();
//
//   }
//
//   @override
//   Widget build(BuildContext context,WidgetRef ref) {
//
//     final _data=ref.watch(userDataProvider);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("List"),
//       ),
//       body: ListView.builder(itemCount: _users.length,itemBuilder: (context,index){
//         final user = _users[index];
//         return Card(
//           elevation: 6,
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
//             child : ListTile(
//           leading: ClipRRect(borderRadius: BorderRadius.circular(22),child: Image.network(user.avatar,fit: BoxFit.fill,height: 45,width: 45,),),
//           title: Text("$user.firstName $user.lastname" ),
//           subtitle: Text(user.email),
//         ),
//         );
//       }),
//       // body: _data.when(
//       //     data: (_data){
//       //   return FutureBuilder<List<dynamic>>(
//       //     future: fetchData(),
//       //     builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
//       //       if(snapshot.hasData){
//       //         return ListView.builder(itemCount:snapshot.data!.length,itemBuilder: (BuildContext context,int index){
//       //           return Card(
//       //             elevation: 6,
//       //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)) ,
//       //             child: ListTile(
//       //               leading: ClipRRect(borderRadius: BorderRadius.circular(22),
//       //                   child: Image.network('${snapshot.data![index]['avatar']}',fit: BoxFit.fill,
//       //                     height: 45,
//       //                     width: 45,)
//       //               ),
//       //               title: Text('${snapshot.data![index]['first_name']}'),
//       //               subtitle: Text('${snapshot.data![index]['email']}'),
//       //             ),
//       //           );
//       //         });
//       //       }else{
//       //         return Center(child: CircularProgressIndicator(),);
//       //       }
//       //     },
//       //   );
//     //   }, error: (err,s) => Text(err.toString()),
//     //       loading: () => const Center(child: CircularProgressIndicator(),)),
//     );
//   }
// }
//
//
