import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/api/network.dart';

class LikeApi {

  // final Map<String, dynamic> body;
  // LikeApi(this.body);
  // Future meapi() async {
  //   ServiceWithHeader service = ServiceWithHeader(APIURL.ME);
  //   var data = await service.datame();
  //   return data;
  // }

  Future fevalbum(String id) async {
    var url = APIURL.FEVBYUSER + '/$id';
    ServiceWithHeader service = ServiceWithHeader(url);
    var data = await service.data();
    return data;
  }

  Future disfav(String id) async {
    var url = APIURL.DeleteFav + '/$id';
    ServiceWithDelete service = ServiceWithDelete(url);
    var data = await service.data();
    return data;
  }
  
  // Future like(String id) async {
  //   var url = APIURL.LIKE + '/$id';
  //   ServiceWithHeader service = ServiceWithHeader(url);
  //   var data = await service.data();
  //   return data;
  // }
  // Future dislike(String id) async {
  //   print(id);
  //   var url = APIURL.DeleteLike + '/$id';
  //   ServiceWithDelete service = ServiceWithDelete(url);
  //   var data = await service.data();
  //   return data;
  // }

}
