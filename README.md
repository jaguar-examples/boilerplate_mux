# boilerplate_mux

Boilerplate for jaguar_mux

## Usage

A simple usage example:

```dart
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
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/jaguar-examples/boilerplate_reflect/issues
