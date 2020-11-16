import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../models/Tenant.dart';

class TenantCard extends StatelessWidget {
  final Tenant tenant;

  TenantCard({
    this.tenant,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/products', arguments: tenant);
      },
      child: Container(
        padding: EdgeInsets.only(top: 4, right: 1, left: 1),
        child: Card(
          elevation: 2.5,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[200]),
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 80,
                    child: ClipOval(
                      // child: Image.asset('a sets/images/logo_jaentrego_app.png'),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: tenant.image != ''
                              ? tenant.image
                              : 'https://jaentrego.com.br/image/logo_jaentrego_app.png',
                          placeholder: (context, url) => Container(
                            height: 80,
                            width: 80,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) => Center(
                            child: Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ),
                  VerticalDivider(color: Colors.black54),
                  Expanded(
                      child: Text(
                    tenant.name,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
