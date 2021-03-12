class Matrice {
  
  int righe;
  int colonne;
  float[][] matrice;
  
//-------------- Costruttore per scalari -------
  Matrice(int r, int c){ 
    righe = r;
    colonne = c;
    matrice = new float[righe][colonne];
  }
  
//-------------- Costruttore per Array -------
  Matrice(float[][] m){ 
    matrice = m;
    colonne = m.length;
    righe = m[0].length;
  }
  
//-------------- Imposta la matrice con int randomici tra -1 e 1 (Server per i pesi della rete neurale) -------
  void weightRandomizer(){
    for (int i = 0; i < righe; i++){
      for (int j = 0; j < colonne; j++){
        matrice[i][j] = random(-1, 1);
      }
    }
  }
  
//-------------- Crea e restituisce una matrice a singola colonna dall'array parametro (Non un vettore) -------
  Matrice matriceSingolaColonnaDaArray(float[] array){ 
    Matrice nuovaMatrice = new Matrice(array.length, 1);
    for (int i = 0; i < array.length; i++){
      nuovaMatrice.matrice[i][0] = array[i];
    }
    return nuovaMatrice;
  }
    
//-------------- Crea una Matrice dall'array parametro -------
  void matriceDaArray(float[] array){ 
    for (int i = 0; i < righe; i++){
      for (int j = 0; j < colonne; j++){
        matrice[i][j] = array[j + i * colonne];
      }
    }
  }
    
//-------------- Trasforma l'oggetto in array -------
  float[] arrayDaMatrice(){
    float[] nuovoArray = new float[righe * colonne];
    for (int i = 0; i < righe; i++){
      for (int j = 0; j < colonne; j++){
        nuovoArray[j + i * colonne] = matrice[i][j];
      }
    }
    return nuovoArray;
  }
  
//-------------- Crea un array col bias da utilizzare nella rete neurale -------
  Matrice aggiungiBias(){
    Matrice tmp = new Matrice((righe + 1), 1);
    for (int i = 0; i < righe; i++){
      tmp.matrice[i][0] = matrice[i][0];
    }
    tmp.matrice[righe][0] = 1;
    return tmp;
  }
  
//-------------- Funzione Sigmoidea -------
  float sigmoide(float x){
    float y = 1 / (1 + pow((float)Math.E, -x));
    return y;
  }
  
//-------------- Applica la funzione sigmoidea ad ogni elemento della matrice -------
  Matrice applicaSigmoidea(){
    Matrice nuovaMatrice = new Matrice(righe, colonne);
    for (int i = 0; i < righe; i++){
      for (int j = 0; j < colonne; j++){
        nuovaMatrice.matrice[i][j] = sigmoide(matrice[i][j]);
      }
    }
    return nuovaMatrice;
  }
 
//-------------- Mutazione secondo l'algoritmo genetico -------
  void muta(float rateoMutazione){ 
    for (int i = 0; i < righe; i++){  
      for (int j = 0; j < colonne; j++){
        float numeroRandom = random(1); //Tra 0,0 e 1,0
        if (numeroRandom < rateoMutazione){ //[True]: Scelto per essere mutato
          matrice[i][j] += randomGaussian()/5; //Aggiunge un valore random (randomGaussian() perché genera un numero senza floating point, che può essere negativo). Viene diviso per 5 per evitare un numero troppogrande
          
          //Imposta il limite tra 1 e -1 nel caso siano capitati numeri troppo grandi
          if (matrice[i][j] > 1) 
            matrice[i][j] = 1;
          
          if (matrice[i][j] < -1) 
            matrice[i][j] = -1;  
        }
      }
    }
  }
  
//-------------- Restituisce una matrice che risulterà una "fusione randomica" tra la matrice invocante e quella parametro -------
  Matrice crossover(Matrice partner){
    Matrice figlio = new Matrice(righe, colonne);
    
    //Prende un punto casuale nella matrice
    int colonnaRandom = floor(random(colonne));
    int rigaRandom = floor(random(righe));
    
    for (int i = 0; i < righe; i++){
      for (int j = 0; j < colonne; j++){
        //Se il punto in cui siamo arrivati col for è prima del punto random, allora copia la parte della matrice invocante
        if ((i < rigaRandom) || (i==rigaRandom && j <= colonnaRandom))  
          figlio.matrice[i][j] = matrice[i][j];
          //Se invece il for è arrivato al punto random, copia la parte della matrice parametro
          else  
          figlio.matrice[i][j] = partner.matrice[i][j];
      }
    }
    return figlio;
  }
  
//-------------- Restituisce un clone della matrice -------
  Matrice clonaMatrice(){ 
    Matrice clone = new  Matrice(righe, colonne);
    for (int i = 0; i < righe; i++){
      for (int j = 0; j < colonne; j++){
        clone.matrice[i][j] = matrice[i][j];
      }
    }
    return clone;
  }
  
//-------------- Restituisce il dot product tra la matrice e quella parametro -------
  Matrice dot(Matrice parametro){
    Matrice risultato = new Matrice(righe, parametro.colonne);
    float somma = 0; //Messa dichiarazione qua al posto di riga 146
    
    if (colonne == parametro.righe){
      for (int i = 0; i < righe; i++){
        for (int j = 0; j < parametro.colonne; j++){
          somma = 0;
          for (int k = 0; k < colonne; k++){
            somma+= matrice[i][k] * parametro.matrice[k][j];
          }
          risultato.matrice[i][j] = somma;
        }
      }
    }
    return risultato;
  }
  
}
