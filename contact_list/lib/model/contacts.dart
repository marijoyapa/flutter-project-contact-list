import 'dart:io';
import 'package:contact_list/model/number.dart';
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
  final List<NumberList> contactNumber;
  bool emergencyContact;
  final String id;

  ContactInfo copyWith({
    String? firstName,
    String? lastName,
    File? imageFile,
    List<NumberList>? contactNumber,
    bool? emergencyContact,
    String? id,
  }) {
    return ContactInfo(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      imageFile: imageFile ?? this.imageFile,
      contactNumber: contactNumber ?? this.contactNumber,
      emergencyContact: emergencyContact ?? this.emergencyContact,
      id: id?? this.id,
    );
  }
}
