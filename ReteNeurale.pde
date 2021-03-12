class ReteNeurale {
  
  int neuroniInput; //Numero di neuroni di input
  int neuroniNascosti; //Numero di neuroni nascosti
  int neuroniOutput; //Numero di neuroni in output
  
  Matrice weightsInputNascosti; //Matrice contenente i weights tra i neuroni in input e quelli nascosti 
  Matrice weightsNascostiNascosti; //Matrice contenente i weights tra i neuroni nascosti del primo, e del secondo strato (nascosto) 
  Matrice weightsNascostiOutput; //Matrice contenente i weights tra il secondo strato di neuroni nascosti e i neuroni in output 
  
//-------------- Costruttore -------
  ReteNeurale(int neuroniI, int neuroniN, int neuroniO){

    //Imposta le dimensioni dai parametri
    neuroniInput = neuroniI;
    neuroniOutput = neuroniO;
    neuroniNascosti = neuroniN;

    //Crea i weights del primo strato
    weightsInputNascosti = new Matrice(neuroniNascosti, neuroniInput +1);

    //Crea i weights del secondo strato
    weightsNascostiNascosti = new Matrice(neuroniNascosti, neuroniNascosti +1);

    //Crea i weights del terzo strato
    weightsNascostiOutput = new Matrice(neuroniOutput, neuroniNascosti +1);  

    //Setta le matrici con valori randomici
    weightsInputNascosti.weightRandomizer();
    weightsNascostiNascosti.weightRandomizer();
    weightsNascostiOutput.weightRandomizer();
  }
  
//-------------- Funzione della mutazione per l'algoritmo genetico ------- 
  void muta(float rateoMutazione){
    //Muta le matrici contenenti i weights col rateo mutazione
    weightsInputNascosti.muta(rateoMutazione);
    weightsNascostiNascosti.muta(rateoMutazione);
    weightsNascostiOutput.muta(rateoMutazione);
  }
  
//-------- Calcola i valori di output ----
  float[] outputReteNeurale(float[] arrayInput){
    //Converte l'array in matrice
    Matrice primoLayer = weightsNascostiOutput.matriceSingolaColonnaDaArray(arrayInput);
    //Aggiunge bias 
    Matrice primoLayerBias = primoLayer.aggiungiBias();
    //Applica i weights del primo layer agli input (Passa dal primo layer al secondo) 
    Matrice secondoLayer = weightsInputNascosti.dot(primoLayerBias);
    //Applica la funzione sigmoidea
    Matrice secondoLayerSigmoidea = secondoLayer.applicaSigmoidea();
    //Aggiunge il bias
    Matrice secondoLayerBias = secondoLayerSigmoidea.aggiungiBias();

    //Stessi passaggi per il secondo strato
    Matrice terzoLayer = weightsNascostiNascosti.dot(secondoLayerBias);
    Matrice terzoLayerSigmoidea = terzoLayer.applicaSigmoidea();
    Matrice terzoLayerBias = terzoLayerSigmoidea.aggiungiBias();

    //Applica i pesi del terzo strato
    Matrice output = weightsNascostiOutput.dot(terzoLayerBias);
    //Attiva il risultato finale
    Matrice outputSigmoidea = output.applicaSigmoidea();

    //Converte in array e restituisce
    return outputSigmoidea.arrayDaMatrice();
  }

//-------------- Funzione di crossover dell'algoritmo genetico -------
  ReteNeurale crossover(ReteNeurale partner){
    //Crea una nuova rete neurale fondendo le due reti neurali 
    ReteNeurale reteNeuraleFiglio = new ReteNeurale(neuroniInput, neuroniNascosti, neuroniOutput);
    reteNeuraleFiglio.weightsInputNascosti = weightsInputNascosti.crossover(partner.weightsInputNascosti);
    reteNeuraleFiglio.weightsNascostiNascosti = weightsNascostiNascosti.crossover(partner.weightsNascostiNascosti);
    reteNeuraleFiglio.weightsNascostiOutput = weightsNascostiOutput.crossover(partner.weightsNascostiOutput);
    return reteNeuraleFiglio;
  }
  
//-------------- Restituisce il clone della rete neurale -------
  ReteNeurale clonaRN(){
    ReteNeurale clone = new ReteNeurale(neuroniInput, neuroniNascosti, neuroniOutput); 
    clone.weightsInputNascosti = weightsInputNascosti.clonaMatrice();
    clone.weightsNascostiNascosti = weightsNascostiNascosti.clonaMatrice();
    clone.weightsNascostiOutput = weightsNascostiOutput.clonaMatrice();
    return clone;
  }  
  
//-------------- Converte le Matrici contenenti i wheights in una tabella; Utilizzata per salvare le reti neurali del sudoku in un file csv -------    
  Table reteNeuraleInTabella(){
    
    Table tabella = new Table(); //Crea la tabella
    
    //Converte le Matrici in array
    float[] arrayWeightsInputNascosti = weightsInputNascosti.arrayDaMatrice();
    float[] arrayWeightsNascostiNascosti = weightsNascostiNascosti.arrayDaMatrice();
    float[] arrayWeightsNascostiOutput = weightsNascostiOutput.arrayDaMatrice();

    //Imposta la quantità di colonne nella tabella
    for (int i = 0; i < max(arrayWeightsInputNascosti.length, arrayWeightsNascostiNascosti.length, arrayWeightsNascostiOutput.length); i++){
      tabella.addColumn();
    }
    
    //Imposta la prima riga come weightsInputNascosti
    TableRow rigaTabella = tabella.addRow(); //Contenitore i dati che vengono salvati nelle righe create per la tabella
    for (int i = 0; i < arrayWeightsInputNascosti.length; i++){
      rigaTabella.setFloat(i, arrayWeightsInputNascosti[i]);
    }

    //Imposta la seconda riga come weightsNascostiNascosti
    rigaTabella = tabella.addRow(); //Aggiunge una nuova riga
    for (int i = 0; i< arrayWeightsNascostiNascosti.length; i++){
      rigaTabella.setFloat(i, arrayWeightsNascostiNascosti[i]);
    }

    //Imposta la terza riga come weightsNascostiOutput
    rigaTabella = tabella.addRow(); //Aggiunge una nuova riga
    for (int i = 0; i< arrayWeightsNascostiOutput.length; i++){
      rigaTabella.setFloat(i, arrayWeightsNascostiOutput[i]);
    }

    //Restituisce la tabella
    return tabella;
  }
  
//-------------- Prende il file csv e lo trasforma in rete neurale -------
  void reteNeuraleDaTabella(Table tabella){
    //Array temporanei per salvare i dati di ogni matrice
    float[] arrayWeightsInputNascosti = new float[weightsInputNascosti.righe * weightsInputNascosti.colonne];
    float[] arrayWeightsNascostiNascosti = new float[weightsNascostiNascosti.righe * weightsNascostiNascosti.colonne];
    float[] arrayWeightsNascostiOutput = new float[weightsNascostiOutput.righe * weightsNascostiOutput.colonne];

    //Imposta l'array weightsInputNascosti come prima riga della tabella
    TableRow rigaTabella = tabella.getRow(0);
    for (int i = 0; i< arrayWeightsInputNascosti.length; i++){
      arrayWeightsInputNascosti[i] = rigaTabella.getFloat(i);
    }

    //Imposta l'array weightsNascostiNascosti come seconda riga della tabella
    rigaTabella = tabella.getRow(1);
    for (int i = 0; i< arrayWeightsNascostiNascosti.length; i++){
      arrayWeightsNascostiNascosti[i] = rigaTabella.getFloat(i);
    }

    //Imposta l'array who come tera riga della tabella
    rigaTabella = tabella.getRow(2);
    for (int i = 0; i< arrayWeightsNascostiOutput.length; i++){
      arrayWeightsNascostiOutput[i] = rigaTabella.getFloat(i);
    }

    //Converte gli array in matrici 
    weightsInputNascosti.matriceDaArray(arrayWeightsInputNascosti);
    weightsNascostiNascosti.matriceDaArray(arrayWeightsNascostiNascosti);
    weightsNascostiOutput.matriceDaArray(arrayWeightsNascostiOutput);
  }
  
}
