# boilerplate_mux

Boilerplate for jaguar_mux.

Contains a server built with Jaguar. It exposes four routes for demonstration
purposes:

1. A simple GET route
2. A simple POST route that uses query parameters
3. A simple JSON GET route
4. A simple JSON POST route that has JSON body

It also includes a sample client to test these APIs.

```dart
/// A simple example showing how to add routes to Jaguar. Also shows how to
/// use serve JSON responses.
import 'package:jaguar/jaguar.dart';

main() async {
  final server = new Jaguar(port: 10000);

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

  // A simple post JSON route
  server.postJson('/api/sub', (Context ctx) async {
    Map body = await ctx.req.bodyAsJsonMap();
    return {'result': body['a'] - body['b']};
  });

  await server.serve();
}
```