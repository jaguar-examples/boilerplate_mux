/// A simple example showing how to add routes to Jaguar. Also shows how to
/// use serve JSON responses.
import 'package:jaguar/jaguar.dart';

main() async {
  final server = Jaguar(port: 10000);

  // A simple get route
  server.get('/api/version', (_) => 0.1);

  // A simple post route
  server.post('/api/add',
      (Context ctx) => ctx.query.getInt('a') + ctx.query.getInt('b'));

  // A simple get JSON route
  server.getJson(
      '/api/info',
      (_) => {
            'server': 'Jaguar',
            'motto': 'Simple. Fast. Flexible. Extensible.',
          });

  server.log.onRecord.listen(print);

  await server.serve(logRequests: true);
}
