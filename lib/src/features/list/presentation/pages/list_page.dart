import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_app/src/app/utils/data_wrapper.dart';
import 'package:list_app/src/features/list/presentation/get/list_controller.dart';

import '../../../settings/settings_view.dart';
import '../../../widgets/item_widget.dart';
import '../../../detail/presentation/pages/sample_item_details_view.dart';

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
    return ListView.builder(
      restorationId: 'sampleItemListView',
      itemCount: controller.list.data?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final item = controller.list.data?[index];

        return ItemWidget(
            name: 'sample item-${item?.title}',
            onTap: () {
              Navigator.restorablePushNamed(
                context,
                SampleItemDetailsView.routeName,
              );
            });
      },
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Lilist App'),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.restorablePushNamed(context, SettingsView.routeName);
          },
        ),
      ],
    );
  }

  Widget buildLoading(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}
