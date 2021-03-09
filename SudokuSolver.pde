//
//

//Variabili run-time
int frameRate = 60;
int numeroMiglioreReteNeurale; //La migliore selezionata tra le 5
float rateoMutazione = 0.01; //Mantenere tra 0.1 e 0.005. Consigliato 0.01
boolean trainingManuale = false; //[True]: Training tramite una persona che gioca
boolean mostraTutti = false; //[True]: Mostra tutte le partite di sudoku in esecuzione; [False]: Mostra un solo campo di gioco casuale
boolean superSudoku = false; //[True]: Fase di testing della rete neurale unione delle 5 migliori; [False]: Fase normale
boolean mostraMiglioriSudoku = false; //[True]: Mostra la partita di sudoku tra una delle 5 migliori; [False]: Fase normale
boolean trainingMiglioriSudoku = false; //[True]: Fase di training delle 5 reti neurali migliori; [False]:Fase normale

//-------------- Setup Finestra -------
void setup() { 
  frameRate(frameRate); 
  size(800, 400); //Dimensione finestra
  //TODO menu e campo da gioco
}

//-------------- Settings Finestra -------
void draw() {
  background(40); //Colore sfondo
  mostraDati();
  
  //TODO impostare le fasi o il menu
}

//-------------- Gestione comandi da tastiera -------
void keyPressed() {
  switch(key) {
  case ' ': //Disattiva/Attiva "Mostra tutti"
    mostraTutti = !mostraTutti;
    break;
  case '+': //Aumenta fps 
    frameRate += 10;
    frameRate(frameRate);
    break;
  case '-': //Diminuisce fps 
    if (frameRate > 10) {
      frameRate -= 10;
      frameRate(frameRate);
    }
    break;
  case 'f': //Avvia sessione superSudoku
    superSudoku = !superSudoku;
    //TODO creare funzione per gestirlo
    break;
  case '5': //Test rete neurale migliore 0
    //TODO creare funzione per gestirlo
    numeroMiglioreReteNeurale = 5;
    mostraMiglioriSudoku = !mostraMiglioriSudoku;
    break;
  case '1': //Test rete neurale migliore 1
    //TODO creare funzione per gestirlo
    numeroMiglioreReteNeurale = 1;
    mostraMiglioriSudoku = !mostraMiglioriSudoku;
    break;
  case '2': //Test rete neurale migliore 2
    //TODO creare funzione per gestirlo
    numeroMiglioreReteNeurale = 2;
    mostraMiglioriSudoku = !mostraMiglioriSudoku;
    break;
  case '3': //Test rete neurale migliore 3
    //TODO creare funzione per gestirlo
    numeroMiglioreReteNeurale = 3;
    mostraMiglioriSudoku = !mostraMiglioriSudoku;
    break;
  case '4': //Test rete neurale migliore 4
    //TODO creare funzione per gestirlo
    numeroMiglioreReteNeurale = 4;
    mostraMiglioriSudoku = !mostraMiglioriSudoku;
    break;
  case 's': //Segnala una delle reti neurali migliori nel caso sia di bassa qualità
    //TODO creare funzione per gestirlo
    break;
  case 'd': //Dimezza il rateo di mutazione
    rateoMutazione /=2;
    break;
  case 'r'://Raddoppia il rateo di mutazione
    rateoMutazione *= 2;
    break;
  case 'l': //Allena le 5 reti neurali migliori
    trainingMiglioriSudoku = !trainingMiglioriSudoku;
    //Carica le 5 reti neurali migliori dal file e inizializza la sessione
    if (trainingMiglioriSudoku == true) { 
      //TODO creare funzione per gestirlo
    }
  case 'm' : //Fase manuale di training; Comandi per imparare da un giocatore
    //TODO creare funzione per gestirlo
  } 
}

//-------------- Mostra Dati -------
void mostraDati() {
    //TODO
}
