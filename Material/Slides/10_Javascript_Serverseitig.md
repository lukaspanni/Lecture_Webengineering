---
title: "Vorlesung Webengineering 1 - Dynamische Webseiten Serverseitig"
topic: "Webengineering_1_10"
author: "Lukas Panni"
theme: "Berlin"
colortheme: "dove"
fonttheme: "structurebold"
fontsize: 12pt
urlcolor: olive
linkstyle: boldslanted
aspectratio: 169
lang: de-DE
section-titles: true
plantuml-format: svg
...

# Node.js

## Node.js

- Open Source (MIT) JavaScript Runtime
  - Ausführung von JavaScript außerhalb des Browsers
  - \rightarrow{} z.B. Webserver, Desktop
- Basiert auf V8-Engine des Chromium-Projekts
- Gut geeignet für Webanwendungen
  - Eventbasiert
  - Non-Blocking I/O, insbesondere Netzwerk
  - \rightarrow{} Kann mit wenigen Ressourcen (insbesondere RAM) viele Anfragen bearbeiten

[Node.js](https://nodejs.org/en/)

## Node.js Installation (1)

- Node.js kann über Installer oder Paketmanager installiert werden
  - [Windows Installer](https://nodejs.org/en/download/)
  - [Windows chocolatey](https://chocolatey.org/packages/nodejs) `choco install nodejs.install`
  - [macOS Installer](https://nodejs.org/en/download/)
  - [macOS Homebrew](https://formulae.brew.sh/formula/node) `brew install node`
  - [Linux Package Manager](https://nodejs.org/en/download/package-manager/)

## Node.js Non-Blocking I/O (1)

```javascript
const fs = require("fs");

console.log("Start");

fs.readFile("./test.txt", (error, data) => {
  console.log("Daten gelesen: ");
  console.log(data.toString());
});

console.log("Ende");
```

## Node.js Non-Blocking I/O (2)

### Ausgabe

```text
Start
Ende
Daten gelesen:
Test-File Line 1
Test-File Line 2
```

## Node.js Non-Blocking I/O (3)

### Erklärung

- Modul `fs` (File System) wird über require eingebunden und ist über Variable `fs` verfügbar
- Ausgabe `console.log("Start")` wird sofort ausgeführt
- `fs.readFile` wird mit einer Callback-Funktion aufgerufen
  - Datei lesen ist aufwändig, daher standardmäßig asynchron
  - Aufgabe wird an Betriebssystem übergeben \rightarrow{} Node.js kann nächste Aufgaben bearbeiten!
  - Sobald Betriebssystem fertig ist, wird Callback-Funktion mit den Ergebnissen aufgerufen
- Ausgabe `console.log("Ende")` wird sofort ausgeführt

## Node.js Non-Blocking I/O (4)

- Standard-Module für File System, Netzwerk, Timer, ... sind asynchron
  - Ähnliche API wie bei `readFile` gezeigt
  - Beim Aufruf wird eine Callback-Funktion übergeben
  - Callback-Funktion wird aufgerufen, sobald die Aufgabe erledigt ist
- Meist zusätzlich auch synchroner Aufruf möglich
  - z.B. `fs.readFileSync` statt `fs.readFile`
  - \rightarrow{} Blockiert Node.js bis Aufgabe erledigt ist
  - \rightarrow{} Am besten vermeiden!

## Node.js Blocking I/O (1)

### Beispiel Synchron

```javascript
const fs = require("fs");

console.log("Start synchron");

const data = fs.readFileSync("./test.txt");
console.log("Daten synchron gelesen: ");
console.log(data.toString());

console.log("Ende synchron");
```

## Node.js Blocking I/O (2)

### Ausgabe

```text
Start synchron
Daten synchron gelesen:
Test-File Line 1
Test-File Line 2
Ende synchron
```

## Node.js Non-Blocking I/O mit Promises (1)

- Callbacks sind nicht ideal
  - Verschachtelete Callbacks sind schwer zu lesen
  - Fehlerbehandlung ist schwierig
  - \rightarrow{} Promises sind eine bessere Alternative
- Ab Node.js 10 ist für `fs` auch eine Promise-basierte API verfügbar
  - Import über `const fs = require("fs").promises;`
  - Um `await` zu nutzen, muss der Code in einem `async`-Block stehen oder in der `package.json`, `{"type": "module"}` gesetzt werden (dann import über `import { promises } from "fs";`)

## Node.js Non-Blocking I/O mit Promises (2)

```javascript
import { promises as fs } from "fs";
// Alternativ: Promise-basierte API
console.log("Start Promise");

const readPromise = fs.readFile("./test.txt");
const data = await readPromise;
console.log("Daten mit Promise gelesen: ");
console.log(data.toString());

console.log("Ende Promise");
```

## Node.js Non-Blocking I/O mit Promises (3)

### Ausgabe

```text
Start Promise
Daten mit Promise gelesen:
Test-File Line 1
Test-File Line 2
Ende Promise
```

## Node.js HTTP-Server

```javascript
import createServer from "http";

createServer((request, response) => {
  response.writeHead(200, {
    "Content-Type": "text/html",
  });
  response.write(
    "<!DOCTYPE html>\n<html>\n<head>\n<title>Test</title>\
    \n</head>\n<body>\n<h1>Test</h1>\n</body>\n</html>\n"
  );
  response.end();
}).listen(80);
```

## Praxisaufgabe

Schreibt einen einfachen HTTP-Server, der HTML, CSS und JavaScript-Dateien ausliefern kann.
Der Server soll auf Port 80 laufen und bei einem Aufruf der URL `http://localhost/` oder `http://localhost/index.html` die Datei `index.html` ausliefern.
Bei einem Aufruf der URL `http://localhost/style.css` soll die Datei `style.css` ausgeliefert werden.
Analog auch für `/script.js`.
Bei allen anderen Anfragen soll ein Fehler ausgegeben werden.

Achtet auf die richtigen Content-Types und Status-Codes!

Argumente von `createServer`: `request`: [http.IncomingMessage](https://nodejs.org/api/http.html#class-httpincomingmessage), `response`: [http.ServerResponse](https://nodejs.org/api/http.html#class-httpserverresponse)

# Modules und Pakckages

## Modules in Node.js

- Einige Standard-Module sind in Node.js integriert: `fs`, `http`, `os`, `net` ...
- Ein Modul ist eine abgeschlossene Einheit mit **wiederverwendbarer Funktionalität**
  - Bessere Strukturierung von Code
  - Wird inzwischen auch in Browsern unterstützt
- 2 Modulsysteme für Node.js:
  - CommonJS (CJS)
  - ECMAScript Modules (ESM)

## CommonJS vs. ECMAScript Modules (1)

**CJS**: Standard in Node.js (bei Extension `.js`)

- Import über `require()` Funktion
  - Import zur Laufzeit möglich (dynamisch)
- Export über `module.exports` Objekt

## CommonJS vs. ECMAScript Modules (2)

**ESM**: In Node.js über Extension `.mjs` oder `package.json`-Einstellung `{"type": "module"}` aktivierbar

- Import über `import XY` Statement
  - Kein dynamischer Import
  - Import einzelner Elemente möglich (z.B. `import { readFileSync } from "fs";`)
- Export über `export` Statement
  - Benannter Export möglich (z.B. `export function XY ...`)
- Moderner und heute empfohlen

## CommonJS vs. ECMAScript Modules (3)

```javascript
// CJS
const fs = require("fs");
const data = fs.readFileSync("./test.txt");
module.exports = data;
```

```javascript
// ESM
import { readFileSync } from "fs";
const data = readFileSync("./test.txt");
export default data;
```

## Eigene Module

- Wiederverwendbare Komponenten über `module.exports` (CJS) oder `export` (ESM) exportieren
  - Funktion, Klasse, Objekt, ...
  - Auch zur reinen Strukturierung von Code möglich
- In anderen Dateien über die jeweiligen Import-Mechanismen einbinden
  - In der Regel über relativen Pfad
    - `import XY from "./xy.js";` (ESM)
    - `const XY = require("./xy.js");` (CJS)


## Packages in Node.js

- **Modul** = eine JavaScript-Datei
- **Package** = "A package is a folder tree described by a `package.json` file." ([Node.js Dokumentation](https://nodejs.org/api/packages.html))
  - Enthält mindestens ein Modul
  - Wird über Konfigurationsdatei `package.json` beschrieben
  - Umfasst alle Unterordner, die kein `package.json` oder einen Unterordner `node_modules` enthalten

## Package-Manager npm

- Node.js bringt einen **Package-Manager** mit: `npm`
- Installation von vorgefertigten Packages aus dem Internet
  - Standard-Registry: [npmjs.com](https://www.npmjs.com/)
  - Installation in `node_modules`-Ordner und Eintrag in `package.json`
  - Installation aller Abhängigkeiten
- Funktionen von Packages können über `require()` (CJS) oder `import` (ESM) importiert werden
 
## Arbeit mit npm

- Projekt initialisieren: `npm init`
  - Erstellt `package.json` mit Basisinformationen
- Package installieren: `npm install <package>` (kurz `npm i <package>`)
  - `--save-prod (-P)`: Package in `package.json` unter `dependencies` eintragen (default)
  - `--save-dev (-D)`: Package in `package.json` unter `devDependencies` eintragen
  - `--global (-g)`: Package global (nicht im aktuellen Projekt) installieren
- Package entfernen: `npm uninstall <package>`

