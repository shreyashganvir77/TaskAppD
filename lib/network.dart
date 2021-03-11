import 'package:http/http.dart' as http;
import 'package:task/apiData.dart';

class Network {
  Future<HomePageData> postRequest() async {
    var url = 'my-notary-app.herokuapp.com';
    var body = {
      "notary": "60280100a063a42fb456c252",
      "today12am": "2021-03-01 00:00:00 GMT+0530",
      "order":"603768d4c54c430015c9bdb7"
    };
    try{
      var response = await http.post(Uri.https(url, '/getNotaryHomepage'),
          body: body
      );
      if(response.statusCode == 200){
        print("completed");
        print(response.body);
        var result = response.body;
        HomePageData homePageData = homePageDataFromJson(result);
        return homePageData;
      } else{
        return null;
      }
    }catch(e){
      return e;
    }
  }
}
