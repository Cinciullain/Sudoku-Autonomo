class Sudoku {
  
   //
   ReteNeurale reteNeurale; //RN del sudoku
   //
   
   int durataSudoku = 0; //Quanto dura la partita
   int mosseRestanti; //Mosse che può ancora effettuare, se = 0 interrompe
   int contatorePunti = 0; //Conta i punti in base alle regole del sudoku
   long fitness = 0; //Qualità del sudoku
   boolean statoSudoku = true; //[True]: in esecuzione
   boolean faseTesting = false; //[True]: Fase testing; [False]: Fase training
   //float[] vistaTabellone = new float[81]; //Gli input della rete neurale
   float[] decisioneReteNeurale; //Output della rn
   
//------------------- Costruttore sudoku -------
   Sudoku(){
      //
      //
      
      reteNeurale = new ReteNeurale(81, 18, 9); //Crea la rn con 81 input, 18 nascosti e 9 output, i numeri sono da rivedere durante la scrittura del codice perché sono al momento teorici
      mosseRestanti = 100; //Numero di azioni che può effettuare, per ora un numero arbitrario da rivedere più avanti
   }
   
//-------------------



//-------------------
   
}
