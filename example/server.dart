// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:jaguar/jaguar.dart';
import 'package:jaguar/interceptors.dart';
import 'package:jaguar_mux/jaguar_mux.dart';

main() async {
  final muxer = new MuxBuilder();

  muxer.get('/api/version', () => 0.1);

  muxer
      .get(
          '/api/info',
          () => {
                'name': 'jaguar',
                'motto': 'Speed. Simplicity. Extensiblity.',
                'degree of awesomeness': 'infinity!',
              })
      .wrap(new WrapEncodeMapToJson());

  Mux mux = muxer.build();

  Jaguar configuration = new Jaguar();
  configuration.addApi(mux);

  await configuration.serve();
}
