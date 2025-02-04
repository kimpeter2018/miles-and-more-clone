import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miles_and_more_clone/data_models/points/points_history_model.dart';
import 'package:miles_and_more_clone/data_models/user/user_provider.dart';
import 'package:miles_and_more_clone/features/auth/auth_repository.dart';

class PointsEntryPage extends ConsumerStatefulWidget {
  const PointsEntryPage({super.key});

  @override
  ConsumerState<PointsEntryPage> createState() => _PointsEntryPageState();
}

class _PointsEntryPageState extends ConsumerState<PointsEntryPage> {
  UserRepository userRepository = UserRepository();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pointsController = TextEditingController();
  final TextEditingController _providerController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  String _selectedType = 'Miles'; // Default value

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final user = ref.watch(firebaseAuthProvider).currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User not logged in")),
        );
        return;
      }

      final userId = user.uid;

      try {
        userRepository.addPointsSubcollection(
            userId: userId,
            points: int.parse(_pointsController.text),
            provider: _providerController.text,
            type: _selectedType, // Use selected type
            title: _titleController.text,
            detail: _detailController.text);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Points added")),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error adding points")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enter Points")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _pointsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Points"),
                validator: (value) =>
                    (value == null || value.isEmpty) ? "Enter points" : null,
              ),
              TextFormField(
                controller: _providerController,
                decoration: const InputDecoration(labelText: "Provider"),
                validator: (value) =>
                    (value == null || value.isEmpty) ? "Enter provider" : null,
              ),
              DropdownButtonFormField<String>(
                value: _selectedType,
                decoration: const InputDecoration(labelText: "Type"),
                items: const [
                  DropdownMenuItem(value: 'Miles', child: Text('Miles')),
                  DropdownMenuItem(value: 'Points', child: Text('Points')),
                  DropdownMenuItem(
                      value: 'Qualifying Points',
                      child: Text('Qualifying Points')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedType = value!;
                  });
                },
                validator: (value) =>
                    (value == null || value.isEmpty) ? "Select type" : null,
              ),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Title"),
                validator: (value) =>
                    (value == null || value.isEmpty) ? "Enter title" : null,
              ),
              TextFormField(
                controller: _detailController,
                decoration: const InputDecoration(labelText: "Detail"),
                validator: (value) =>
                    (value == null || value.isEmpty) ? "Enter detail" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
