import 'package:flutter_application_1/currency/models/ratesmodel.dart';
import 'package:http/http.dart' as http;

String apiKey = 'cur_live_LFTwcfaz3TgV0dfCARcqcnVXMeybvyURZm52GjVh';
Future<RatesModel> fetchrates() async {
  var response = await http
      .get(Uri.parse('https://api.currencyapi.com/v3/latest?apikey=$apiKey'));
  final result = ratesModelFromJson(response.body);
  return result;
}
