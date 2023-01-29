import 'package:dcli/dcli.dart';

main() async {
  runMason();
}

runMason() {
  "mason make my_feature featchers -o ./lib/featchers".run;
  "mason make add_dependancy core -o ./lib/core".run;

}
