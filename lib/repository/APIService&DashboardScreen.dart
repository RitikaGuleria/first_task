import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final APIUserProvider = Provider<APIService>((ref) => APIService());

final userDataProvider = FutureProvider<List<dynamic>>((ref) async {
  return ref.watch(APIUserProvider).fetchData();
});

class APIService extends ConsumerWidget {

  Future<List<dynamic>> fetchData() async{
    Dio dio=Dio();
    var response = await  dio.get("https://reqres.in/api/users?page=2");
    // print(response.data.toString());
    return response.data['data'];

  }


  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final _data=ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("List"),
      ),
      body: _data.when(
          data: (_data){
        return FutureBuilder<List<dynamic>>(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if(snapshot.hasData){
              return ListView.builder(itemCount:snapshot.data!.length,itemBuilder: (BuildContext context,int index){
                return Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)) ,
                  child: ListTile(
                    leading: ClipRRect(borderRadius: BorderRadius.circular(22),
                        child: Image.network('${snapshot.data![index]['avatar']}',fit: BoxFit.fill,
                          height: 45,
                          width: 45,)
                    ),
                    title: Text('${snapshot.data![index]['first_name']}'),
                    subtitle: Text('${snapshot.data![index]['email']}'),
                  ),
                );
              });
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        );
      }, error: (err,s) => Text(err.toString()),
          loading: () => const Center(child: CircularProgressIndicator(),)),
    );

    // return FutureBuilder<List<dynamic>>(
    //   future: fetchData(),
    //   builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
    //     if(snapshot.hasData){
    //       return ListView.builder(itemCount:snapshot.data!.length,itemBuilder: (BuildContext context,int index){
    //         return Card(
    //           elevation: 6,
    //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)) ,
    //           child: ListTile(
    //             leading: ClipRRect(borderRadius: BorderRadius.circular(22),
    //             child: Image.network('${snapshot.data![index]['avatar']}',fit: BoxFit.fill,
    //               height: 45,
    //               width: 45,)
    //             ),
    //             title: Text('${snapshot.data![index]['first_name']}'),
    //             subtitle: Text('${snapshot.data![index]['email']}'),
    //           ),
    //         );
    //       });
    //     }else{
    //       return Center(child: CircularProgressIndicator(),);
    //     }
    //   },
    // );
  }
}


