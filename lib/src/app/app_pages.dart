

import 'package:get/get.dart';
import 'package:list_app/src/features/list/presentation/get/list_binding.dart';
import 'package:list_app/src/features/list/presentation/pages/list_page.dart';

const initialPageRoute = ListPage.routeName;

final pageRoutes = [
  GetPage(
      name: ListPage.routeName,
      page: () => const ListPage(),
      binding: ListBinding()),
];
