Il documento (‘chronicle’) relativo a ciascuno SPRINT deve contenere:

    Un link al testo dei requisiti del committente

    Un link allo sprint precedente (se esiste)

    Una immagine della architettura al termine dello sprint precedente (se esiste) detta ARCHITETTURA INIZIALE DI RIFERIMENTO

    Un chiara definizione del GOAL dello Sprint

    Un piano di testing relativo al Testing (User Acceptance Test)

Nel caso di revisione del documento relativo ad uno SPRINT, occorre lasciare la versione precedente e dare al nuovo documento un numero di versione.



1. Link ai requisiti
* [Requisiti](TemaFinale25.html)

  
2. Goal dello sprint 0
    - Fornire una panoramica dei componenti già forniti dal committente e dei componenti da sviluppare. 
    - Produrre un piano di test preliminare da proporre e validare insieme al committente 
    - Chiarire eventuali dubbi relativi ai requisiti

________________________________________________________________________________________________________________


## Componenti forniti dal committente:

    - DDR robot
    - productservice
    - wvenv come hold della nave (ambiente dove il robot esiste e si muove)
    - products (database dei prodotti fornito dal committente)
    
## Componenti da sviluppare:

    - sistema per muovere il robot verso la IOport e gli slot di carico
    - Modulo per l'interazione con productservice
        Responsabilità:
            Interfacciarsi con il servizio per verificare requisiti di carico (peso).
            Ottenere e gestire il PID restituito.
    - Gestione slot nella stiva – SlotManager o HoldManager
        Responsabilità:
            Tenere traccia dello stato degli slot (libero/occupato).
            Assegnare lo slot disponibile al robot.
            Verificare che il prodotto sia posizionato correttamente.
    - Interfaccia utente o operatori (es. tramite GUI o CLI).

## Piano di testing
Il piano di testing preliminare è stato realizzato tramite diagrammi drawio, illustriamo i vari casi:
### Prodotto Disponibile - Flusso ideale
<img width="741" height="441" alt="Senza titolo" src="https://github.com/user-attachments/assets/7b771765-9988-483a-b5d9-eb24532135fc" />

### Edge case 1 - NEG1 - Prodotto illegale 
<img width="721" height="471" alt="immagine" src="https://github.com/user-attachments/assets/6f695aac-0242-40c1-9f4c-f21021639ee3" />

### Edge case 2 - NEG2 - Interrupt
<img width="811" height="481" alt="immagine" src="https://github.com/user-attachments/assets/970aed2f-2a57-4a97-8a12-dbce2bff214c" />

### Edge case 3 - NEG3 - Slot Occupati
<img width="731" height="471" alt="immagine" src="https://github.com/user-attachments/assets/abbc4fab-6680-4d1a-8434-bb3cbd19afa8" />


## Chiarire con il committente:

Da chi ricevo la RequestToLoad???
Il prodotto è presente SEMPRE nel productService? ambiguità nei requisiti
