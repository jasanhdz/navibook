import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileFormFields extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController birthDateController;
  final TextEditingController ageController;
  final String gender;
  final Function(DateTime) onBirthDateChanged;
  final Function(String?)? onGenderChanged;
  final bool isEditing;

  const ProfileFormFields({
    super.key,
    required this.formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.phoneController,
    required this.emailController,
    required this.birthDateController,
    required this.ageController,
    required this.gender,
    required this.onBirthDateChanged,
    this.onGenderChanged,
    this.isEditing = true,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        // Añadimos scroll para evitar overflow
        child: Column(
          children: [
            // Nombres
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(labelText: 'Nombres'),
              readOnly: !isEditing,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa tus nombres';
                }
                final regex = RegExp(r'^[a-zA-ZÀ-ÿ\s]+$');
                if (!regex.hasMatch(value)) {
                  return 'Solo se permiten letras';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            // Apellidos
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(labelText: 'Apellidos'),
              readOnly: !isEditing,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa tus apellidos';
                }
                final regex = RegExp(r'^[a-zA-ZÀ-ÿ\s]+$');
                if (!regex.hasMatch(value)) {
                  return 'Solo se permiten letras';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            // Teléfono
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Teléfono'),
              keyboardType: TextInputType.number,
              maxLength: 10,
              readOnly: !isEditing,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa tu teléfono';
                }
                final regex = RegExp(r'^\d{10}$');
                if (!regex.hasMatch(value)) {
                  return 'Debe contener exactamente 10 números';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            // Email
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              readOnly: !isEditing,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa tu email';
                }
                final regex = RegExp(
                    r'^[^@]+@[^@]+\.[^@]+'); // Expresión regular básica para email
                if (!regex.hasMatch(value)) {
                  return 'Ingresa un email válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            // Fecha de Nacimiento
            TextFormField(
              controller: birthDateController,
              decoration: const InputDecoration(
                labelText: 'Fecha de Nacimiento',
                hintText: 'Selecciona tu fecha de nacimiento',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: isEditing
                  ? () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime(1990),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        birthDateController.text =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        onBirthDateChanged(pickedDate);
                      }
                    }
                  : null,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, selecciona tu fecha de nacimiento';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            // Edad (solo lectura)
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Edad'),
              readOnly: true,
            ),
            const SizedBox(height: 10),
            // Género
            DropdownButtonFormField<String>(
              value: gender,
              decoration: const InputDecoration(labelText: 'Género'),
              items: ['Masculino', 'Femenino', 'Otro']
                  .map((label) => DropdownMenuItem(
                        child: Text(label),
                        value: label,
                      ))
                  .toList(),
              onChanged: isEditing ? onGenderChanged : null,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, selecciona tu género';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
