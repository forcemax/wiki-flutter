// TODO
// - cover image
//   - use the first image in section ?
//   - or use the cover image from parent entry ?

import 'package:flutter/material.dart';

import '../../shared/entries_helper.dart' as entriesHelper;

import '../../../models/entry.dart';

import '../../shared/drawer.dart';
import '../shared/section_outline_tiles.dart';

class EntriesSectionsShow extends StatelessWidget {
  final Entry entry;
  final Section section;

  EntriesSectionsShow({ Key key, this.entry, this.section }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // build content widgets
    List<Widget> contentWidgets = [];

    contentWidgets.add(
      new entriesHelper.SectionHtmlWrapper(entry: entry, sectionId: section.id,)
    );

    contentWidgets.add(const Divider());
    contentWidgets.addAll(sectionOutlineTiles(entry, rootSectionId: section.id));

    return new Scaffold(
      drawer: new WikiFlutterDrawer(currentEntry: entry, currentSectionId: section.id),
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 256.0,
            floating: true,
            // snap: true,
            flexibleSpace: new FlexibleSpaceBar(
              title: new Text(section.title),
              background: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  new Image.asset('assets/images/placeholder.jpg', fit: BoxFit.cover)
                ]
              )
            ),
          ),
          new SliverList(
            delegate: new SliverChildListDelegate( contentWidgets )
          )
        ]
      )
    );
  }
}