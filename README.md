# Vergleich imperativ - funktional

## Kriterien

- Wahrung von Konsistenz/Invarianten
- Vermeidung von Race Conditions (race conditions sind ein durch multithreading ermöglichter Sonderfall von Verletzung von Konsistenz/Invarianten)

## State

### Imperativ

Imperative Sprachen kodieren State explizit im Speicher:
- im Stackframe
- auf dem Heap
- im shared memory

Z.B. wenn man über eine List iteriert, gibt es entweder einen Pointer auf das aktuelle Listenelement (oder Null-Pointer wenn zu Ende), oder es gibt einen Pointer auf den Listen-Anfang und einen Zähler.

Infolge dessen können Methoden im imperativen Code sehr leicht sehr gross werden.
Infolge dessen sind Code und State im imperativen Code häufig entkoppelt (Heap, shared memory), und dieser alleinstehende State ist potentiell anfällig für race conditions.

Imperative Sprachen wie C unterstüzten häufig keine Reflektion, d.h., können häufig Datentypen zur Laufzeit nicht mehr unterscheiden.

### Funktional

Funktionale Sprachen kodieren State implizit:
- im Stacktrace
- in Datentypen

Z.B. wenn man über eine Liste iteriert (rekursiv), spiegelt sich das im Stacktrace wieder; ohne tail-call-optimization stapelt sich die Rekursions-Fortschritt auf dem Stack, mit tail-call-optimization ändert sich ein pointer im stack frame.

Z.B. hat eine Haskell-Liste zwei Datentypen, Cons für ein besetztes Listen-Element mit Nachfolger, Nil für ein leeres Listen-Element ohne Nachfolger.

Infolge dessen verwendet funktionaler Code häufig mehr Datentypen und mehr Unterfunktionen als impliziter Code.

### Objektorientiert

Objektorientiert ist ein Spezialfall von Imperativ mit der Möglichkeit, Daten zu kapseln, um Invarianten zu schützen.

Daten auf dem Heap bleiben dennoch potentiell anfällig für thread-bedingte race conditions. (Schwierigkeit: Schmaler Pfad zw. race conditions und dead locks.)
