import 'package:dcli/dcli.dart';

main() async {
  runMason();
}

runMason() {
  var name = ask('name:', required: true, validator: Ask.alpha);

  "mason make my_feature featchers --name ${name} -o ./lib/featchers".run;

  "cd core".run;
  "cd dependencyInjection".run;
  "nano app_dependency_injections.dart".run;
  "love".run;
}
