# pageable_page_view

`pageable_page_view` is a Flutter package developed to facilitate pagination operations in Flutter applications. This package provides a customizable and efficient way to paginate lists of data, enhancing the user experience with smooth scrolling and flexible options.

## Features

- **list**: List of items to paginate.
- **itemPerPage**: Number of items per page.
- **initialPage**: Index of the page to show initially.
- **child**: Widget that contains another Widget.
- **shrinkWrap**: Whether the ListView should shrink-wrap its content.
- **scrollDirection**: The scrolling direction of the ListView.
- **physics**: The physics of the ListView.
- **titleDisplay**: Function that returns the text to display for the title.
- **subTitleDisplay**: Function that returns the text to display for the subtitle.
- **prefixIcon**: Leading icon.
- **suffixIcon**: Trailing icon.
- **listTileOnTap**: Function that will be called when ListTile is tapped.

![pageable](https://github.com/iremtasci/pageable_page_view/blob/main/assets/pageable_page_view.png)

## Getting Started

### Installation

Add the following line to your `pubspec.yaml` file to include the package in your project:

```yaml
dependencies:
  pageable_page_view: ^latest_version
``` 
## Getting started

```dart
import 'package:pageable_page_view/pageable_page_view.dart';
```
## Usage

```dart
import 'package:flutter/material.dart';
import 'package:pageable_page_view/pageable_page_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<dynamic> itemList = [
    // List items will be defined here.
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pageable Page View Example'),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageablePageView<dynamic>(
                list: itemList,
                itemPerPage: 10,
                initialPage: 0,
                titleDisplay: (item) => item.title,
                subTitleDisplay: (item) => item.subtitle,
                itemDisplay: (item) => item.displayText,
                prefixIcon: Icon(Icons.arrow_back),
                suffixIcon: Icon(Icons.arrow_forward),
                listTileOnTap: () {
                  // Function to be called when ListTile is tapped.
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Additional information
If you have any questions or feedback, please feel free to contact us. Enjoy using it!
Contact
Email: iremtasci0629@gmail.com
