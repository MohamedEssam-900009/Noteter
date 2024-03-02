import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 32.0),
          CustomTextField(hintText: 'Title'),
          SizedBox(height: 16.0),
          CustomTextField(hintText: 'Content', maxLines: 5),
        ],
      ),
    );
  }
}
