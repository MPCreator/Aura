import 'package:aura/core/db/dao/journal_dao.dart';
import 'package:aura/core/db/dao/journal_file_dao.dart';
import 'package:aura/features/journal/data/datasources/journal_file_local_datasource.dart';
import 'package:aura/features/journal/data/datasources/journal_local_datasource.dart';
import 'package:aura/features/journal/data/repositories/journal_file_repository_impl.dart';
import 'package:aura/features/journal/data/repositories/journal_repository_impl.dart';
import 'package:aura/features/journal/domain/repositories/journal_file_repository.dart';
import 'package:aura/features/journal/domain/repositories/journal_repository.dart';
import 'package:aura/features/journal/domain/usercases/get_file_type.dart';
import 'package:aura/features/journal/domain/usercases/get_journal_by_id.dart';
import 'package:aura/features/journal/domain/usercases/get_journal_files.dart';
import 'package:aura/features/journal/domain/usercases/get_journals.dart';
import 'package:aura/features/journal/domain/usercases/insert_journal.dart';
import 'package:aura/features/journal/domain/usercases/insert_journal_file.dart';
import 'package:aura/features/journal/presentation/provider/journals_files_ui_provider.dart';
import 'package:aura/features/journal/presentation/provider/journals_ui_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> createJournalsProviders() {
  return [
    Provider<DiarioDao>(create: (_) => DiarioDao()),
    Provider<DiarioLocalDataSource>(
      create: (context) => DiarioLocalDataSourceImpl(
        diarioDao: Provider.of<DiarioDao>(context, listen: false),
      ),
    ),
    Provider<DiarioRepository>(
      create: (context) => DiarioRepositoryImpl(
        diarioLocalDataSource:
            Provider.of<DiarioLocalDataSource>(context, listen: false),
      ),
    ),

    Provider<ArchivoDiarioDao>(create: (_) => ArchivoDiarioDao()),
    Provider<ArchivoDiarioLocalDataSource>(
      create: (context) => ArchivoDiarioLocalDataSourceImpl(
        archivoDiarioDao: Provider.of<ArchivoDiarioDao>(context, listen: false),
      ),
    ),
    Provider<ArchivoDiarioRepository>(
      create: (context) => ArchivoDiarioRepositoryImpl(
        archivoDiarioLocalDataSource:
            Provider.of<ArchivoDiarioLocalDataSource>(context, listen: false),
      ),
    ),

    //Casos de uso
    Provider<GetDiarios>(
      create: (context) => GetDiarios(
        Provider.of<DiarioRepository>(context, listen: false),
      ),
    ),
    Provider<GetDiarioById>(
      create: (context) => GetDiarioById(
        Provider.of<DiarioRepository>(context, listen: false),
      ),
    ),
    Provider<InsertDiario>(
      create: (context) => InsertDiario(
        Provider.of<DiarioRepository>(context, listen: false),
      ),
    ),

    Provider<GetArchivosDiario>(
      create: (context) => GetArchivosDiario(
        Provider.of<ArchivoDiarioRepository>(context, listen: false),
      ),
    ),
    Provider<InsertArchivoDiario>(
      create: (context) => InsertArchivoDiario(
        Provider.of<ArchivoDiarioRepository>(context, listen: false),
      ),
    ),
    Provider<GetTipoArchivo>(
      create: (context) => GetTipoArchivo(),
    ),

    //Providers de UI
    ChangeNotifierProvider<DiarioProvider>(
      create: (context) => DiarioProvider(
        Provider.of<GetDiarios>(context, listen: false),
        Provider.of<InsertDiario>(context, listen: false),
      ),
    ),

    ChangeNotifierProvider<ArchivoDiarioProvider>(
      create: (context) => ArchivoDiarioProvider(
        Provider.of<GetArchivosDiario>(context, listen: false),
        Provider.of<InsertArchivoDiario>(context, listen: false),
        Provider.of<GetTipoArchivo>(context, listen: false),
      ),
    ),
  ];
}
