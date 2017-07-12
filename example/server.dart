// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:jaguar/jaguar.dart';

main() async {
  final server = new Jaguar();

  // Get version route
  server.get('/api/version', (Context ctx) => 0.1);

  // Get info route
  server.get(
      '/api/info',
      (Context ctx) => Response.json({
            'name': 'jaguar',
            'motto': 'Speed. Simplicity. Extensiblity.',
            'degree of awesomeness': 'infinity!',
          }));

  // Shows show to decode JSON body from the request
  server.post('/api/math', (Context ctx) async {
    /// [bodyAsJsonMap] method on [Request] object can be used to decode JSON
    /// body of the request into Dart built-in object
    final Map body = await ctx.req.bodyAsJsonMap();
    final int a = body['a'];
    final int b = body['b'];

    return Response.json({
      'addition': a + b,
      'subtraction': a - b,
      'multiplication': a * b,
      'division': a ~/ b,
    });
  });

  await server.serve();
}
