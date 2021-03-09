class Matrice {
  
  int righe;
  int colonne;
  float[][] matrice;
  
//-------------- Costruttore per scalari -------
  Matrice(int r, int c) { 
    righe = r;
    colonne = c;
    matrice = new float[righe][colonne];
  }
  
//-------------- Costruttore per Array -------
  Matrice(float[][] m) { 
    matrice = m;
    colonne = m.length;
    righe = m[0].length;
  }
  
//-------------- Setta la Matrice con int randomici tra -1 e 1 (Server per i weight della rete neurale)
  void weightRandomizer() {
    for (int i = 0; i<righe; i++) {
      for (int j = 0; j<colonne; j++) {
        matrice[i][j] = random(-1, 1);
      }
    }
  }
}
