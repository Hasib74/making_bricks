import 'dart:io';

import 'package:dcli/dcli.dart' as dcli;
import 'package:args/args.dart';
import 'package:dcli/dcli.dart';

main(List<String> arguments) async {
  exitCode = 0;
  final parser = ArgParser();
  var _createParser = parser.addCommand("create", ArgParser());
  _createParser.addOption("name",
      abbr: "n", help: "name of the project", allowed: ["gdn_health"]);

  final results = parser.parse(arguments);
  if (results.command == null) {
    printerr(red("No command specified"));
    printerr(parser.usage);
    exit(1);
  } else if (results.command!.name == "create") {
    results.command!.options.toList().forEach((element) {
      print("element: ${element}");
    });
    // final projectName = results.command!.arguments.last;
    // print("Creating project $projectName");
  }

  // runMason();
}

runMason() async {
  var name = dcli.ask("name: ", required: true, validator: dcli.Ask.alpha);
  //
  print(dcli.green('Name of your features is: $name'));

//  "mason make my_feature featchers --name $name -o ./lib/featchers".run;

  _dependancyInjection(name);
}

_dependancyInjection(String name) {
  var _file = "./lib/core/dependencyInjection/app_dependency_injections.dart";

  var _data = dcli.read(_file);

  List<String> _splitedList = _data.toParagraph().split("}");

  String _writeData = "";

  _splitedList.forEach((element) {
    if (_splitedList.indexOf(element) == _splitedList.length - 1) {
      element.replaceAll("\n", "");
      element.replaceAll(" ", "");

      _writeData += element.replaceAll("}", "").replaceAll(" ", "") +
          "//function \n sl.registerLazySingleton(() => ${capitalize(name)}Functions()); \n";

      _writeData += element.replaceAll("}", "").replaceAll(" ", "") +
          "//DataSource \n sl.registerLazySingleton<${capitalize(name)}RemoteDataSource>(() => ${capitalize(name)}RemoteDataSourceImpl()); \n";

      _writeData += element.replaceAll("}", "").replaceAll(" ", "") +
          "//repository \n   sl.registerLazySingleton<${capitalize(name)}Repository>(() => ${capitalize(name)}RepositoryImpl(${name.toLowerCase()}RemoteDataSource: sl()));\n";

      _writeData += element.replaceAll("}", "").replaceAll(" ", "") +
          "//usecase \n   sl.registerLazySingleton<${capitalize(name)}UseCase>(() => ${capitalize(name)}UseCase(eRepository: sl()));\n }";
    } else {
      if (_splitedList.indexOf(element) == _splitedList.length - 2) {
        _writeData += element + " \n";
      } else {
        _writeData += element + " \n}";
      }
    }
  });

  String imports =
      ''' import '../../featchers/${name.toLowerCase()}/data/remoteDataSource/${name.toLowerCase()}_data_source.dart'; 
  import '../../featchers/${name.toLowerCase()}/data/respository/${name.toLowerCase()}_repository_impl.dart'; 
  import '../../featchers/${name.toLowerCase()}/domain/repository/${name.toLowerCase()}_repository.dart'; \n
  import '../../featchers/${name.toLowerCase()}/domain/useCase/${name.toLowerCase()}_use_case.dart'; \n
  import '../../featchers/${name.toLowerCase()}/presentation/functions/${name.toLowerCase()}_functions.dart'; \n  
  ''';

  _file.write(imports + _writeData);
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
