import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class FacebookWebView extends StatefulWidget {
  final String url;

  const FacebookWebView({Key key, this.url}) : super(key: key);

  @override
  _FacebookWebViewState createState() => _FacebookWebViewState();
}

class _FacebookWebViewState extends State<FacebookWebView> {
  final flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (url.contains("#access_token")) {
        succeed(url);
      }

      if (url.contains(
          "https://www.facebook.com/connect/login_success.html?error=access_denied&error_code=200&error_description=Permissions+error&error_reason=user_denied")) {
        denied();
      }
    });
    super.initState();
  }

  denied() {
    Navigator.pop(context, '');
  }

  succeed(String url) {
    var params = url.split("access_token=");

    var endparam = params[1].split("&");

    Navigator.pop(context, endparam[0]);
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      appBar: AppBar(
        title: Text('Facebook auth'),
      ),
    );
  }
}
