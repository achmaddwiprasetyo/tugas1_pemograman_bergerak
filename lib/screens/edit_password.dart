import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/password_model.dart';

class EditPasswordPage extends StatefulWidget {
  final PasswordModel password;

  const EditPasswordPage({super.key, required this.password});

  @override
  State<EditPasswordPage> createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> {
  late TextEditingController _accountController;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late String _selectedCategory;

  final _categories = ['Email', 'Sosial', 'Game', 'Bank', 'Lainnya'];

  @override
  void initState() {
    super.initState();
    _accountController = TextEditingController(text: widget.password.account);
    _usernameController = TextEditingController(text: widget.password.username);
    _passwordController = TextEditingController(text: widget.password.password);
    _selectedCategory = widget.password.category;
  }

  void _update() async {
    if (_accountController.text.isEmpty ||
        _usernameController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Semua kolom harus diisi')));
      return;
    }

    final db = DatabaseHelper();
    await db.updatePassword(
      PasswordModel(
        id: widget.password.id,
        account: _accountController.text,
        username: _usernameController.text,
        password: _passwordController.text,
        category: _selectedCategory,
      ),
    );

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Password')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: _accountController,
              decoration: const InputDecoration(
                labelText: 'Nama Akun',
                prefixIcon: Icon(Icons.account_circle_outlined),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              items: _categories
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (v) => setState(() => _selectedCategory = v!),
              decoration: const InputDecoration(
                labelText: 'Kategori',
                prefixIcon: Icon(Icons.category_outlined),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.save_outlined),
              label: const Text('Perbarui'),
              onPressed: _update,
            ),
          ],
        ),
      ),
    );
  }
}
