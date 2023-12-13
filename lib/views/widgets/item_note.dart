import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../note_edit_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return NoteEditView();
          }),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffFFCC80), borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 16,
            bottom: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  "HeadLine Note",
                  style: TextStyle(
                      color: Colors.black.withOpacity(.7), fontSize: 26),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "Desc for the Note and other words to fill the space",
                    style: TextStyle(
                        color: Colors.black.withOpacity(.7), fontSize: 16),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, top: 16),
                child: Text("May 21, 2021",
                    style: TextStyle(color: Colors.black.withOpacity(.7))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
