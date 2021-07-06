import 'dart:math';

class Password{
  static const lowercaseLetters = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
  static const uppercaseLetters = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
  static const numbers = ['0','1','2','3','4','5','6','7','8','9'];
  static const specialCharacters = ['!','\\','#','%','&','(',')','*','+',',','-','.','/',':',';','<','=','>','?','@','[',']','^','_','`','{','|','}','~'];
  static const latin1Characters = ['¡','¢','£','¤','¥','¦','§','¨','©','ª','«','¬','®','¯','°','±','²','³','´','µ','¶','·','¸','¹','º','»','¼','½','¾','¿','À','Á','Â','Ã','Ä','Å','Æ','Ç','È','É','Ê','Ë','Ì','Í','Î','Ï','Ð','Ñ','Ò','Ó','Ô','Õ','Ö','×','Ø','Ù','Ú','Û','Ü','Ý','Þ','ß','à','á','â','ã','ä','å','æ','ç','è','é','ê','ë','ì','í','î','ï','ð','ñ','ò','ó','ô','õ','ö','÷','ø','ù','ú','û','ü','ý','þ','ÿ'];

  static String generate({
    int length = 20,
    bool includeLowercaseLetters = true,
    bool includeUppercaseLetters = true,
    bool includeNumbers = true,
    bool includeSpecialCharacters = true,
    bool includeLatin1Characters = true,
  }){
    List<String> chars = [];
    if(includeLowercaseLetters) chars.addAll(lowercaseLetters);
    if(includeUppercaseLetters) chars.addAll(uppercaseLetters);
    if(includeNumbers) chars.addAll(numbers);
    if(includeSpecialCharacters) chars.addAll(specialCharacters);
    if(includeLatin1Characters) chars.addAll(latin1Characters);

    return List.generate(
      length,
          (index) => chars.elementAt(
        Random.secure().nextInt(
          chars.length,
        ),
      ),
    ).join('');
  }
}
