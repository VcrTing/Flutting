Map txt = {
  'cn': {
    'warning': '警告',
    'setting': '设置',
    'checkInternet': '检查网络',
    'noInternet': '无网络连接。'
  },
  'en': {
    'warning': 'Warning',
    'setting': 'Setting',
    'checkInternet': 'Check Net',
    'noInternet': 'No Internet.'
  }
};

class Lang {
  String lang;
  Lang(lang) {
    this.lang = lang;
  }

  String getTxt(word) => txt[lang][word];
}
