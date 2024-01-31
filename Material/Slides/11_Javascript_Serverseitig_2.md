---
title: "Vorlesung Webengineering 1 - Dynamische Webseiten Serverseitig 2"
topic: "Webengineering_1_11"
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

# TypeScript - das bessere JavaScript

## Probleme von JavaScript

Dynamische Typisierung

- Variablen können jederzeit den Typ wechseln
- Typen werden erst zur Laufzeit geprüft
- Zusätzlich: **automatische** Typumwandlung (_type coercion_)

\rightarrow{} Eingabeabhängige Laufzeitfehler, schwer zu finden!

## Beispiel: Dynamische Typen

```javascript
let a = 1;
console.log(a, typeof a);
a = "1";
console.log(a, typeof a);
a = {};
console.log(a, typeof a);
```

## Beispiel: Type Coercion

```javascript
let a = 1;
let b = "1";
console.log(a == b);
let c = a + b;
console.log(c, typeof c);
let d = a - b;
console.log(d, typeof d);
console.log(++a, ++b);
```

## Beispiel: Dynamische Typen + Type Coercion bei Funktionsargumenten

```javascript
function add(a, b) {
  return a + b;
}

console.log(add(1, 2));
console.log(add("1", "2"));
console.log(add(undefined, 2));
console.log(add(null, 2));
```

## Lösung: Statische Typisierung

- Typprüfungen zur Entwicklungszeit \rightarrow{} Kompilationsschritt
- Keine Änderung von Typen zur Laufzeit

**Vorteil**: Typfehler werden frühzeitig erkannt und teilweise verhindert

## TypeScript

![TypeScript Homepage](./media/typescript_homepage.png){width=80%}

## TypeScript Vorteile

- Typsicherheit
  - Vermeidung/Früherkennung von Typfehlern
- Verbesserte Codequalität
  - Bessere Verständlichkeit
  - Bessere Dokumentation
- Verbesserte Toolunterstützung
  - Codevervollständigung
  - Refactoring


## TypeScript - Grundsätzliches

- Erweiterung (Superset) von JavaScript: jedes JavaScript ist auch gültiges TypeScript
  - Statische Typisierung
  - Klassenfeatures \rightarrow{} Teilweise in ECMAScript 6 (=2015) (JavaScript-Standard)
- Kompiliert zu JavaScript
  - Browser können TypeScript nicht interpretieren
  - TypeScript-Compiler (`tsc`) erzeugt JavaScript \rightarrow{} zusätzlicher Schritt!

## TypeScript - Quickstart

- Webseite: [typescriptlang.org](https://typescriptlang.org)
- Installation TypeScript-Compiler
  - `npm install -g typescript` (global) oder `npm install typescript` (lokal)
- Kompilieren von TypeScript-Dateien
  - `tsc <dateiname.ts>` \rightarrow{} Erzeugt JavaScript-Datei `<dateiname.js>`
- Ausführen von erzeugtem JavaScript
  - `node <dateiname.js>`

## TypeScript - Beispiel: Probleme von JavaScript

Kompilation der zuvor gezeigten Beispiele (gleicher Code, Dateiendung `.ts`):

![TypeScript Compile-Fehler](./media/typescript_compile_errors.png)

## TypeScript Features - Type Annotations (1)

- Explizite Typangaben für Variablen, Funktionen, Parameter, Rückgabewerte

```typescript
let a: number = 1;
let b: number = 2;

function add(x: number, y: number): number {
  return x + y;
}
const result: number = add(a, b);
console.log(result);
```

## TypeScript Features - Type Annotations (2)

```typescript
...
function printMessage(message: string) {
  console.log(message);
}

printMessage(result);
```

## TypeScript Features - Type Annotations (3)

## Typfehler

![Typfehler durch Verstoß gegen Annotation](./media/typescript_type_error_annotation.png)

## TypeScript Features - Type Inference

- Explizite Typangaben sind aufwändig
- Gewünschte Typen ergeben sich meist aus dem Kontext
  - TypeScript kann Typen ableiten \rightarrow{} **Type Inference** / Typinferenz

![Typeinference](./media/type-inference-example.png)

## TypeScript Features - Klassen (1)

- Mehr Klassenfeatures als in JavaScript (ECMAScript 6)
  - Zugriffsmodifier `public`, `private`, `protected`
  - _Accessors_: Getter und Setter
  - Statische Member (`static`)
  - Vererbungsfeatures
    - Abstrakte Klassen
    - Interfaces
  - **Generics**
  - ...

## TypeScript Features - Klassen (2)

Beispiel [`typescript-classes.ts`](https://github.com/TINF23B5-Webengineering/Lecture_Code/blob/main/11_Javascript_Serverseitig_2/typescript-example/typescript-classes.ts)


<!-- TODO: weitere TypeScript-Features, Alternative Runtimes -->