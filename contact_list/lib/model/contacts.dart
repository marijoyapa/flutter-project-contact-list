import 'dart:io';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

class ContactInfo {
  ContactInfo({
    required this.firstName,
    this.lastName,
    this.imageFile,
    required this.contactNumber,
    bool? emergencyContact,
    String? id,
  })  : emergencyContact = emergencyContact ?? false,
        id = id ?? uuid.v4();

  final String firstName;
  final String? lastName;
  final File? imageFile;
  final String contactNumber;
  bool emergencyContact;
  final String id;
}
