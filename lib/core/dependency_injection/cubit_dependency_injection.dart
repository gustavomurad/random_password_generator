import 'package:random_password_generator/features/password_generator/data/repositories/password_generator_repository_impl.dart';
import 'package:random_password_generator/features/password_generator/domain/usecases/password_generator_usecase_impl.dart';
import 'package:random_password_generator/features/password_generator/presentation/business_components/password_generator_cubit.dart';

class CubitFactory {
  static get passwordGeneratorCubit => PasswordGeneratorCubit(
        usecase: PasswordGeneratorUsecaseImpl(
          repository: PasswordGeneratorRepositoryImpl(),
        ),
      );
}
