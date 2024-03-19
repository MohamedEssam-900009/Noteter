import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/add_note_cubit/add_note_cubit.dart';
import '../../cubits/add_note_cubit/add_note_state.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';

import 'add_note_form.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFailure) {
              debugPrint('Failed to add note ${state.errorMessage}');
            }
            if (state is AddNoteSuccess) {
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 16.0,
                  left: 16.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const SingleChildScrollView(child: AddNoteForm()),
              ),
            );
          },
        ),
      ),
    );
  }
}
