import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String nom;
  String prenom;
  String pathPhoto;
  String email;
  String uid;

  User({
    required this.nom,
    required this.prenom,
    required this.email,
    required this.uid,
    required this.pathPhoto,
  });

  Map<String, dynamic> toJson() => {
        "nom": nom,
        "prenom": prenom,
        "pathPhoto": pathPhoto,
        "email": email,
        "uid": uid,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot['email'],
      nom: snapshot['name'],
      pathPhoto: snapshot['profilePhoto'],
      prenom: snapshot['prenom'],
      uid: snapshot['uid'],
    );
  }
}
