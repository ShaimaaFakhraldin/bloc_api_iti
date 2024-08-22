import 'package:http/http.dart' as https;
class NetworkProvider{
  // url
  // header
  // body
static   Future<https.Response> getRequest(String url , [Map? headers] ) async {
      try{
        https.Response response = await  https.get(Uri.parse(url) , headers :{});
        // https.Response response1 = await https.post(url ,headers: {} , body: {} );
        // https.Response response2 =await https.put(url ,headers: {} , body: {} );
        // https.Response response3 = await  https.delete(url ,headers: {} , body: {} ) ;
        return response ;
      } catch (e){
        rethrow ;
      }

  }

}