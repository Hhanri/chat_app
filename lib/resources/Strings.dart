class Strings {

  //General
  static const String titleApp = "Chat App";
  static const String email = "Email";
  static const String password = "Mot de passe";
  static const String name = "Nom";
  static const String birthday = "Date de Naissance";
  static const String ok = "OK";

  //Authentication
  static const String forgetPassword = "Mot de passe oublié ?";
  static const String noAccount = "Vous n’avez pas de compte ?";
  static const String alreadyAccount = "Vous avez déjà un compte ?";
  static const String signUp = "S’inscrire";
  static const String signUpTitle = "Inscription";
  static const String signIn = "Se connecter";
  static const String acceptConditions = "J’accepte les conditions d’utilisation";
  static const String signUpComplete = "Inscription terminée";

  //Messages
  static const String messagesTitle = "Messages";
  static const String tapMessage = "Tapez votre message…";
  static const String exampleDate = "13/05/21 - 18:50";
  static const String brandNewConv = "Nouvelle conversation avec ";

  //Search
  static const String searchContacts = "Rechercher un contact...";
  static const String search = "Rechercher...";
  static const String noContactFound = "Aucun contact trouvé";

  //Errors
  static const String error = "Erreur";
  static const String errorFirebaseInit = "Erreur d'initialisation Firebase";
  static const String errorAuthStream = "Erreur lors de la récupération des utilisateurs";

  //Form Errors
  static const String errorEmptyField = "Le champ de formulaire ne peut pas être vide";
  static const String errorPasswordLength = "Le mot de passe doit avoir au moins 8 caractères";
  static const String weakPassword = "Le mot de passe est trop faible";
  static const String emailAlreadyUsed = "L'email renseigné est déjà utilisé";
  static const String errorIsNotEmail = "L'email renseigné n'est pas valide";
  static const String errorIsNotDate = "Veuillez saisir une date valide";
  static const String errorTOSNotChecked = "Veuillez accepter les CGU";
  static const String errorUserNotFound = "L'utilisateur n'existe pas";
  static const String errorWrongPassword = "Le mot de passe ne correspond pas";
  static const String errorDisabledUser = "Ce compte est désactivé";
  static const String errorLogOut = "Erreur de déconnexion";
  static const String errorGetRoomMessages = "Erreur lors de la récupération des conversations";
  static const String errorGetUsers = "Erreur lors de la récupération des utilisateur";

  //Firebase error code
  static const String weakPasswordCode = "weak-password";
  static const String emailAlreadyUsedCode = "email-already-in-use";
  static const String errorAuthSignUp = "Erreur d'inscription";
  static const String userNotFoundCode = "user-not-found";
  static const String wrongPasswordCode = "wrong-password";
  static const String disabledUserCode = "user-disabled";

  //Auth Firebase
  static const String alertConfirmSignOut = "Vous êtes sur le point de vous déconnecter";

  //Firebase Queries and Models
  static const String usersCollection = "users";
  static const String userModelId = "userId";
  static const String userModelName= "username";
  static const String userModelImagePath = "userImagePath";
  static const String userModelBirthDate = "userBirthDate";
  static const String roomsCollection = "rooms";
  static const String messagesCollection = "messages";
  static const String messageModelTextMessage = "textMessage";
  static const String messageModelTimeStamp = "timeStamp";
  static const String idsArrayFirestore = "userIds";
  static const String roomIdFirestore = "roomId";
  static const String lastMessageFirestore = "lastMessage";
  static const String lastIdFirestore = "lastId";
  static const String lastDateMesageFirestore = "lastDateMessage";

  //Firestore errors
  static const String getMessageError = "Erreur lors de la récupération des messages";
  static const String getRoomError = "Errreur lors de l'ouverture de la conversation";


  //Null Safety
  static const String nullSafetyUnknownUser = "utilisateur inconnu";
}


class ImagesPath {

  static const String logo = "assets/images/Logo-App-Createur-Pro-sombre.png";
}