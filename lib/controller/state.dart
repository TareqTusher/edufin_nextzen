class EdufinState{

 final bool isProgress;
 EdufinState({this.isProgress=false});


EdufinState copyWith(bool? isProgress){
  return EdufinState(isProgress: isProgress??this.isProgress);
}

}