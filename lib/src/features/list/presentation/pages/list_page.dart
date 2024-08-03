import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/src/app/utils/data_wrapper.dart';
import 'package:list_app/src/features/list/presentation/get/list_controller.dart';

import '../../../widgets/item_widget.dart';
import '../../../detail/presentation/pages/detail_list_page.dart';

/// Displays a list of SampleItems.
class ListPage extends GetView<ListController> {
  const ListPage({
    super.key,
  });
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Obx(() {
        switch (controller.list.status) {
          case Status.success:
            return buildBody(context);
          case Status.error:
            return buildError(context);
          default:
            return buildLoading(context);
        }
      }),
    );
  }

  Center buildError(BuildContext context) {
    return const Center(
      child: Text('Something went wrong!'),
    );
  }

  Widget buildBody(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: controller.list.data?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final item = controller.list.data?[index];

        return ItemWidget(
          name: item?.title ?? '',
          onTap: () => Get.toNamed(
            DetailListPage.routeName,
            arguments: item,
          ),
        );
      },
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: TextField(
        onChanged: (value) {
          controller.onMatchIds(inputText: value);
        },
        decoration: const InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.person_2_sharp),
          onPressed: () {
            // Navigator.restorablePushNamed(context, SettingsView.routeName);
          },
        ),
      ],
    );
  }

  Widget buildLoading(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}
