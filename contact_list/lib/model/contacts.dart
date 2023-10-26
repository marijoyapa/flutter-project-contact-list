import 'dart:io';

class ContactInfo {
  ContactInfo({
    required this.firstName,
    this.lastName,
    this.imageFile,
    required this.contactNumber,
    bool? emergencyContact,
  }) : emergencyContact = emergencyContact == null ? false : emergencyContact;


  final String firstName;
  final String? lastName;
  final File? imageFile;
  final String contactNumber;
  bool emergencyContact;
}
