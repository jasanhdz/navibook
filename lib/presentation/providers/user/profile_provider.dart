import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:navibook/domain/entities/user_profile.dart';

final userProfileProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfile?>(
  (ref) => UserProfileNotifier(),
);

class UserProfileNotifier extends StateNotifier<UserProfile?> {
  UserProfileNotifier() : super(null) {
    loadUserProfile();
  }

  Future<void> loadUserProfile() async {
    final preferences = await SharedPreferences.getInstance();
    final String? userProfileString = preferences.getString('userProfile');
    print('Cargando perfil de usuario: $userProfileString');
    if (userProfileString != null) {
      try {
        final Map<String, dynamic> jsonData = json.decode(userProfileString);
        state = UserProfile.fromJson(jsonData);
        print('Perfil de usuario cargado correctamente.');
      } catch (e) {
        print('Error al parsear el perfil de usuario: $e');
        // En caso de error, inicializa un perfil vacío
        state = UserProfile(
          firstName: '',
          lastName: '',
          phone: '',
          email: '',
          birthDate: DateTime(1990, 1, 1),
          age: 0,
          gender: 'Otro',
        );
      }
    } else {
      print('No se encontró perfil de usuario guardado.');
      // Inicializa un perfil vacío si no hay datos guardados
      state = UserProfile(
        firstName: '',
        lastName: '',
        phone: '',
        email: '',
        birthDate: DateTime(1990, 1, 1),
        age: 0,
        gender: 'Otro',
      );
    }
  }

  Future<void> saveUserProfile(UserProfile profile) async {
    final preferences = await SharedPreferences.getInstance();
    final String jsonString = json.encode(profile.toJson());
    print('Guardando perfil de usuario: $jsonString');
    final success = await preferences.setString('userProfile', jsonString);
    if (success) {
      state = profile;
      print('Perfil de usuario guardado correctamente.');
    } else {
      print('Error al guardar el perfil de usuario.');
    }
  }
}
