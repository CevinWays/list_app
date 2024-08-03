import 'package:get/get.dart';
import 'package:list_app/src/features/auth/presentation/get/login_binding.dart';
import 'package:list_app/src/features/auth/presentation/pages/login_page.dart';
import 'package:list_app/src/features/detail/presentation/get/detail_list_binding.dart';
import 'package:list_app/src/features/detail/presentation/pages/detail_list_page.dart';
import 'package:list_app/src/features/list/presentation/get/list_binding.dart';
import 'package:list_app/src/features/list/presentation/pages/list_page.dart';

const initialPageRoute = LoginPage.routeName;

final pageRoutes = [
  GetPage(
      name: ListPage.routeName,
      page: () => const ListPage(),
      binding: ListBinding()),
  GetPage(
    name: DetailListPage.routeName,
    page: () => const DetailListPage(),
    binding: DetailListBinding(),
  ),
  GetPage(
    name: LoginPage.routeName,
    page: () => const LoginPage(),
    binding: LoginBinding(),
  ),
];
