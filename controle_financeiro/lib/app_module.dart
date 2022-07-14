import 'package:controle_financeiro/app/expenses/domain/usecases/insert_expense_usecase.dart';
import 'package:controle_financeiro/app/expenses/external/datasources/firebase_datasource.dart';
import 'package:controle_financeiro/app/expenses/infra/repositories/expense_repository_impl.dart';
import 'package:controle_financeiro/app/expenses/presenter/views/expense_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
        Bind((i) => FirebaseDatasource()),
        Bind((i) => ExpenseRepositoryImpl(i())),
        Bind((i) => InsertExpenseUsecaseImpl(i()))
      ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => MyApp();

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => ExpensePage()),
      ];
}
