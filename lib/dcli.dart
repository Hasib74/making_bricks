import 'package:dcli/dcli.dart' as dcli;
import 'package:gdn_health/core/extension/string_extendion.dart';

main() async {
  runMason();
}

runMason() async {
  var name = dcli.ask("name: ", required: true, validator: dcli.Ask.alpha);
  //
  print(dcli.green('Name of your features is: $name'));

  "mason make my_feature featchers --name $name -o ./lib/featchers".run;

  _dependancyInjection(name);
}

_dependancyInjection(String name) {
  var _file = "./lib/core/dependencyInjection/app_dependency_injections.dart";

  var _data = dcli.read(_file);

  // _data.toParagraph().replaceAll("}}\$", "     Love this \n}");

  List<String> _splitedList = _data.toParagraph().split("}");

  //_splitedList[_splitedList.length].append("FK");

  String _writeData = "";

  _splitedList.forEach((element) {
    //  print("Index of ${_splitedList.indexOf(element)} $element  \n");
    if (_splitedList.indexOf(element) == _splitedList.length - 1) {
      //print("element : ${element}");

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
