import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io' show Platform;

void lambdaHandler(Function callback) async {
  final api = Platform.environment['AWS_LAMBDA_RUNTIME_API'];

  while (true) {
    final response =
        await http.get('http://${api}/2018-06-01/runtime/invocation/next');

    final event_data = json.decode(utf8.decode(response.bodyBytes));
    final request_id = response.headers['lambda-runtime-aws-request-id'];

    final result = await callback(event_data);

    http.post(
        'http://${api}/2018-06-01/runtime/invocation/${request_id}/response',
        body: json.encode(result));
  }
}
