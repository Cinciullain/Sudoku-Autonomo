class SuperSudoku{
   
  //
  ReteNeurale[] reteNeurale; //Array della rete neurale che controlla il sudoku
  //
  //
  
  //int numeroDaInserire; //Numero da inserire in tabella
  //int caselleGiusteIniziali; //Guarda nella classe Sudoku
  int durataSudoku = 0; //Quanto a lungo è durato il sudoku
  int mosseRestanti = 100; //Numero di mosse restanti. Valutare in seguito se cambiare il numero
  //int contatoreMosseGiuste = 0; //Serve a capire quanti numeri inserisce correttamente
  int reteNeuraleDaSeguire = 0; //Quale stimolo seguire per la prossima mossa secondo i cloni utilizzati in background
  int mosseDaSeguire = 0; //Quante mosse fare seguendo il clone risultato più efficente
  boolean statoSudoku = true; //[True]: In esecuzione
  //
  float[] vistaSudoku = new float[81]; //Gli input della rn
  float[] decisioneReteNeurale; //Output della rn
  
//------------------- Costruttore -------
   SuperSudoku(ReteNeurale[] retiNeurali){
      //
      //
      
      reteNeurale = retiNeurali;
      //
   }
   
//------------------- Viene creato un clone per ogni rn, che va avanti finchè non trova il posizionamento
                   // di un numero, giusto, o termina se finisce le mosse. Così da capire cosa fare e quale seguire fra i sudoku in esecuzione in background -------
   void decisioneMigliore(){
      //Crea i cloni
      int i;
      for(i = 0; i < reteNeurale.length; i++){
         //  
      }
      
      //Se ogni clone ha terminato l'esecuzione, controlla quale sia il migliore da replicare (Meno mosse eseguite in meno tempo)
      int mosseMinime = 300; //Numero arbitrario da ricontrollare più avanti*****
      //int tempoMinimo = 100; //
      int cloneDaSeguire = -1;
      for(i = 0; i < reteNeurale.length; i++){
         //  
      }
      
      
      
   }

}
