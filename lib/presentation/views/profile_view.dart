import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:navibook/domain/entities/user_profile.dart';
import 'package:navibook/presentation/providers/providers.dart';
import 'package:navibook/presentation/widgets/profile_form_fields.dart';

class ProfileView extends ConsumerStatefulWidget {
  static const name = 'profile-screen';

  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  final _formKey = GlobalKey<FormState>();

  // Controladores de texto
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String _gender = 'Otro';

  bool _isEditing = false; // Inicialmente en modo lectura

  @override
  void initState() {
    super.initState();
    // No leemos el proveedor aquí
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _birthDateController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _onBirthDateChanged(DateTime selectedDate) {
    final currentDate = DateTime.now();
    int age = currentDate.year - selectedDate.year;
    if (currentDate.month < selectedDate.month ||
        (currentDate.month == selectedDate.month &&
            currentDate.day < selectedDate.day)) {
      age--;
    }
    _ageController.text = age.toString();
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState?.validate() ?? false) {
      final userProfile = UserProfile(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        phone: _phoneController.text.trim(),
        email: _emailController.text.trim(),
        birthDate: DateTime.parse(_birthDateController.text),
        age: int.parse(_ageController.text),
        gender: _gender,
      );

      await ref.read(userProfileProvider.notifier).saveUserProfile(userProfile);

      setState(() {
        _isEditing = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Perfil guardado exitosamente')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Por favor, corrige los errores en el formulario')),
      );
    }
  }

  void _editProfile() {
    setState(() {
      _isEditing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Escuchar los cambios en el proveedor
    ref.listen<UserProfile?>(userProfileProvider, (previous, next) {
      if (next != null && !_isEditing) {
        _firstNameController.text = next.firstName;
        _lastNameController.text = next.lastName;
        _phoneController.text = next.phone;
        _emailController.text = next.email;
        _birthDateController.text =
            DateFormat('yyyy-MM-dd').format(next.birthDate);
        _ageController.text = next.age.toString();
        _gender = next.gender;
      }
    });

    final userProfile = ref.watch(userProfileProvider);

    // Si el perfil está vacío, habilita el modo edición automáticamente
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (userProfile != null && userProfile.firstName.isEmpty && !_isEditing) {
        setState(() {
          _isEditing = true;
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        actions: [
          _isEditing
              ? IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: _saveProfile,
                )
              : IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: _editProfile,
                ),
        ],
      ),
      body: userProfile == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ProfileFormFields(
                formKey: _formKey,
                firstNameController: _firstNameController,
                lastNameController: _lastNameController,
                phoneController: _phoneController,
                emailController: _emailController,
                birthDateController: _birthDateController,
                ageController: _ageController,
                gender: _gender,
                isEditing: _isEditing,
                onBirthDateChanged: _isEditing
                    ? _onBirthDateChanged
                    : (DateTime selectedDate) {},
                onGenderChanged: _isEditing
                    ? (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _gender = newValue;
                          });
                        }
                      }
                    : null,
              ),
            ),
    );
  }
}
