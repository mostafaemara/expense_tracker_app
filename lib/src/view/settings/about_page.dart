import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          """
Who We Are

Our dedicated team of [teams_list] are passionate about helping [audience_type], and [explained_service_action]. Since our founding in [founding_year], [company_name] has enabled [helped_audience_number]+ [audience_type] around the world to [last_service_action].

For further information, please visit our website at [website_url] or contact us at mostafa.saad.emara@gmail.com.""",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
