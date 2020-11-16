import 'package:flutter/material.dart';

import '../../data/network/repositories/tenant_repository.dart';
import '../../widgets/custom_circular_progress_indicator.dart';
import '../../models/Tenant.dart';
import './widgets/TenantCard.dart';
import '../../widgets/flutter_bottom_navigator.dart';

class TenantsPage extends StatefulWidget {
  TenantsPage({Key key}) : super(key: key);

  @override
  _TenantsPageState createState() => _TenantsPageState();
}

class _TenantsPageState extends State<TenantsPage> {
  List<Tenant> _tenants = [];
  bool isLoding = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getTenants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurantes'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: isLoding
          ? CustomCircularProgressIndicator(
              textLabel: 'Carregando as lojas',
            )
          : _buildTenants(context),
      bottomNavigationBar: FlutterBottomNavigator(0),
    );
  }

  Widget _buildTenants(context) {
    return Container(
      child: ListView.builder(
        itemCount: _tenants.length,
        itemBuilder: (context, index) {
          final Tenant tenant = _tenants[index];
          return TenantCard(tenant: tenant);
        },
      ),
    );
  }

  void getTenants() async {
    setState(() => isLoding = true);

    final tenants = await TenantRepository().getTenants();

    setState(() {
      _tenants.addAll(tenants);
    });

    setState(() => isLoding = false);
  }
}
