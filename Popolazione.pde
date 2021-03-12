class Popolazione {
   
  Sudoku migliorSudoku; //Clone del sudoku migliore della popolazione attuale
  Sudoku[] sudoku; //Tutti i sudoku che "giocano" presenti nella popolazione
  
  int generazione = 1; //Numero della generazione
  int punteggioPopolazioneMigliore = 0; //Miglior punteggio effettuato dalle popolazioni
  int miglioreAttuale = 0; //Miglior punteggio della generazione corrente
  int posizioneMigliorSudoku = 0; //La posizione nell'array del sudoku migliore (Con punteggio migliore), della generazione corrente
  int idPopolazione = floor(random(10000)); //Numero randomico per identificare la popolazione (Utilizzato per salvare i sudoku su file)
  long migliorFitnessGlobale = 0; //Miglior fitness raggiunto dalle popolazioni
  
//------------------- Costruttore -------
   Popolazione(int grandezza){
      sudoku = new Sudoku[grandezza];
      
      //Inizzializzo tutti i sudoku
      for(int i = 0; i < grandezza; i++){
         sudoku[i] = new Sudoku();  
      }
      //
   }

//------------------- Costruttore utilizzato per training delle rn dei sudoku migliori -------
   Popolazione(int grandezza, Sudoku migliore){
      sudoku = new Sudoku[grandezza];
      
      //Imposta tutti i sudoku come cloni mutati dei sudoku migliori
      for(int i = 0; i < grandezza; i++){
         //
      }
      //
   }
   
//------------------- Aggiorna sudoku della popolazione che sono attualmente in vita -------
   void aggiornaSudoku(){
   // 
   }
   
//------------------- Controlla se tutti i sudoku della attuale popolazione sono in esecuzione -------
   boolean finitoSimulazione(){
      for(int i = 0; i < sudoku.length; i++){
         if(sudoku[i].statoSudoku)
            return false;
      }
      return true;
   }
  
}
