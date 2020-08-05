import firebase from 'firebase/app'
import 'firebase/firestore'

var firebaseConfig = {
    apiKey: "AIzaSyCnqdEa0o4Jxk80F_UcrWqhfrNUilTUMtg",
    authDomain: "newsapp-9afc9.firebaseapp.com",
    databaseURL: "https://newsapp-9afc9.firebaseio.com",
    projectId: "newsapp-9afc9",
    storageBucket: "newsapp-9afc9.appspot.com",
    messagingSenderId: "522632842361",
    appId: "1:522632842361:web:c23ef7534f583ff75258a8"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
export default firebase;
