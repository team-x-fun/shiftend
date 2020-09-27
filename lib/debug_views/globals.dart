library shiftend.debug_views.globals;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseauth;
import 'package:shiftend/repositories/interfaces/interfaces.dart';
import 'package:shiftend/repositories/organization_repository.dart';
import 'package:shiftend/repositories/shift_repository.dart';
import 'package:shiftend/repositories/shift_request_repository.dart';
import 'package:shiftend/repositories/user_repository.dart';

firebaseauth.User firebaseUser;
final firebaseauth.FirebaseAuth auth = firebaseauth.FirebaseAuth.instance;

final UserRepositoryInterface userRepo =
    UserRepository(auth: auth, firestore: FirebaseFirestore.instance);
final OrganizationRepositoryInterface orgRepo = OrganizationRepository(
    firestore: FirebaseFirestore.instance, userRepo: userRepo);
final ShiftRepositoryInterface shiftRepo =
    ShiftRepository(firestore: FirebaseFirestore.instance, userRepo: userRepo);
final ShiftRequestRepositoryInterface shiftReqRepo = ShiftRequestRepository(
    firestore: FirebaseFirestore.instance, userRepo: userRepo);
