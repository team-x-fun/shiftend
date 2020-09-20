library shiftend.debug_views.globals;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shiftend/repositories/organization_repository.dart';
import 'package:shiftend/repositories/shift_repository.dart';
import 'package:shiftend/repositories/user_repository.dart';

User firebaseUser;
final FirebaseAuth auth = FirebaseAuth.instance;

final UserRepository userRepo =
    UserRepository(auth: auth, firestore: FirebaseFirestore.instance);
final OrganizationRepository orgRepo = OrganizationRepository(
    firestore: FirebaseFirestore.instance, userRepo: userRepo);
final ShiftRepository shiftRepo =
    ShiftRepository(firestore: FirebaseFirestore.instance, userRepo: userRepo);
