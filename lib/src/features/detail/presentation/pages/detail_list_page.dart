import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/src/features/detail/presentation/get/detail_list_controller.dart';

/// Displays detailed information about a SampleItem.
class DetailListPage extends GetView<DetailListController> {
  const DetailListPage({super.key});

  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: Obx(() => Text(controller.arguments.data?.title ?? '')),
    );
  }

  Widget buildBody(BuildContext context) {
    return Obx(() {
      return Container(
          margin: const EdgeInsets.all(16),
          child: Text(controller.arguments.data?.body ?? ''));
    });
  }
}
