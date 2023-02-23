import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../common/app_router.dart';
import '../common/widgets/request_quote_row.dart';

class EstimatesView extends ConsumerStatefulWidget {
  const EstimatesView({Key? key}) : super(key: key);

  @override
  EstimatesViewState createState() => EstimatesViewState();
}

class EstimatesViewState extends ConsumerState<EstimatesView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        elevation: 2.0,
        title: const Text(
          'Estimates list',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            confirmDismiss: (_) => Future.value(false),
            onDismissed: (direction) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Estimate deleted successfully!'),
                ),
              );
            },
            child: const RequestQuoteRow(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.pushNamed(AppRoutes.submitRequest.name),
        label: Row(
          children: const [
            Icon(Icons.pending_actions),
            SizedBox(width: 8),
            Text(
              'Request estimate',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}
