import 'package:client_app/app.dart';
import 'package:client_app/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
