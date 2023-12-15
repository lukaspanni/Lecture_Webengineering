---
title: "Vorlesung Webengineering 1 - CSS"
topic: "Webengineering_1_5"
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
toc: true
numbersections: true
plantuml-format: svg
...


# CSS - Grundlagen 

## CSS - Grundlagen

**C**ascading **S**tyle **S**heets

- Stylesheet-Sprache: Beschreibung von Darstellung und Layout
- Trennung von Inhalt (HTML) und Darstellung (CSS)
- "Cascading": Kaskadierung von Stylesheets
  - Kombination von Stylesheets
  - Überschreibung von Regeln
- Stylesheets werden vom Browser interpretiert und ergeben mit HTML das Layout der Webseite

## CSS - Syntax

- Deklaration: Paar aus Eigenschaft (Property) und Wert (Value)
  - `color: red;`
  - `font-size: 12px;`
- Deklarationsblock: Sammlung von zusammengehörigen Deklarationen
  ```css
  {
    color: red;
    font-size: 12px;
  }
  ```
- Selektor: Element, auf das sich eine Deklaration / ein Deklarationsblock bezieht
- Kombination aus Selektor und Deklarationsblock: _Ruleset_

## CSS Selektoren

- Universal-Selektor `*` \rightarrow{} alle Elemente
- Elementname `p` \rightarrow{} alle `<p>`-Elemente
- Klassenname `.class` \rightarrow{} alle Elemente, bei denen das `class`-Attribut den Wert `class` **enthält**
  - Mehrere Klassen in HTML: `class="class1 class2 class3"`
  - Würde von `.class` und `.class2` und `.class3` selektiert werden
- ID `#id` \rightarrow{} alle Elemente, bei denen das `id`-Attribut den Wert `id` hat
  - IDs sollten eindeutig pro HTML-Dokument sein

## CSS Selektoren 

- Attribute `[attr]` \rightarrow{} alle Elemente, bei denen das Attribut `attr` existiert
- Attribut mit Wert `[attr="value"]` \rightarrow{} alle Elemente, bei denen das Attribut `attr` exakt den Wert `value` hat
  - Wert beginnt mit: `[attr^="value"]` \rightarrow{} alle Elemente, bei denen das Attribut `attr` mit `value` _beginnt_
  - Wert endet mit: `[attr$="value"]` \rightarrow{} alle Elemente, bei denen das Attribut `attr` mit `value` _endet_
  - Wert enthält: `[attr*="value"]` \rightarrow{} alle Elemente, bei denen das Attribut `attr` den Wert `value` _enthält_

siehe auch [selfhtml.org](https://wiki.selfhtml.org/wiki/CSS/Tutorials/Selektoren/einfacher_Selektor#Attributselektor)

## CSS Eigenschaften

- Komplette Liste: [CSS Properties](https://www.w3schools.com/cssref/index.php)
- Wichtige Eigenschaften
  - `color`: Textfarbe
  - `background-color`: Hintergrundfarbe
  - `font-size`: Schriftgröße
  - `font-weight`: Schriftstärke
  - `margin`: Abstand zum Nachbarelement (`top right bottom left`, Als Ersatz für `margin-...`)
  - `padding`: Abstand vom Rand des Elements zum Inhalt (`top right bottom left`)
  - `border`: Rahmen um das Element (`width style color`, Als Ersatz für `border-...`)

## CSS Vererbung

- Rulesets werden vom Selektor auf Kind-Elemente vererbt:
  ```css
  body {
    color: red;
  }
  ```
  \rightarrow{} Alle Kind-Elemente des `body` (=gesamtes HTML Dokumente) bekommen standardmäßig roten Text


# CSS nutzen

## CSS: Einbindung in HTML

- Inline-Style: Angabe im `style`-Attribut
  ```html
  <p style="color: red;">Hallo Welt</p>
  ```
- Header-Style: Angabe im `<style>`-Element im `<head>`
  ```html
  <style>
    p {
      color: red;
    }
  </style>
  ```
- Externes Stylesheet: Verweis über `<link>`-Element im `<head>`
  ```html
  <link rel="stylesheet" href="style.css">
  ```


## Praxisaufgabe 1

Passt die in 03_HTML erstellte Nachrichtenseite mit CSS an:

- Überschriften sollen besser hervorgehoben werden
- Die Seite soll im Darkmode dargestellt werden
- Artikel auf der Übersichtsseite sollen einen Rahmen bekommen
  

# CSS Fortgeschritten

## Kombination von Selektoren

- Verschiedene Möglichkeiten der Kombination
  - `A, B` \rightarrow{} Alle Elemente, die entweder mit `A` **oder** mit `B` selektiert werden
  - `AB` \rightarrow{} Alle Elemente, die mit `A` **und** mit `B` selektiert werden
  - `A B` \rightarrow{} Alle Elemente, die mit `B` selektiert werden und ein **transitives** Kind (auch Nachfahre genannt) von `A` sind
  - `A > B` \rightarrow{} Alle Elemente, die mit `B` selektiert werden und ein **direktes** Kind von `A` sind
  - `A + B` \rightarrow{} Alle Elemente, die mit `B` selektiert werden und **direkt** nach `A` stehen (Nachbarelemente)
  - `A ~ B` \rightarrow{} Alle Elemente, die mit `B` selektiert werden und nach `A`

siehe auch [selfhtml.org](https://wiki.selfhtml.org/wiki/CSS/Tutorials/Selektoren/Kombinator)


## CSS Pseudoklassen

- Klassen, die nicht im HTML-Code angegeben werden, sondern vom Browser gesetzt werden
  - Werden direkt an Selektor angehängt (z.B. `p:hover`)
- Wichtige Pseudoklassen 
  - `:hover` \rightarrow{} Mauszeiger ist aktuell über Element
  - `:active` \rightarrow{} Element wird aktuell angeklickt
  - `:focus` \rightarrow{} Element hat aktuell den Fokus (z.B. durch Tabulator-Taste oder Mausklick)

## CSS Struktur-Pseudoklassen
- Beziehen sich auf die Struktur des HTML-Dokuments
  - `:first-child` \rightarrow{} Element ist das erste Kind seines Elternelements
  - `:last-child` \rightarrow{} Element ist das letzte Kind seines Elternelements
  - `:nth-child(n)` \rightarrow{} Element ist das `n`-te Kind seines Elternelements
    - `n` kann auch als Formel angegeben werden: `2n+1` \rightarrow{} Alle ungeraden Kindelement
  - Analog für den Typ des Elements: `:first-of-type`, `:last-of-type`, `:nth-of-type(n)`


## TODO:
- CSS Maßeinheiten 
- CSS Box-Modell
- CSS Flexbox



## Praxisaufgabe 2

Passt die in 03_HTML erstellte Nachrichtenseite mit CSS noch weiter an: 

- Nutzt Flexbox um ein responsives Layout zu erstellen
- Artikel auf der Übersichtsseite sollen Abstand voneinander haben
- Die Artikel sollen abwechselnd farbig hinterlegt werden
- Bilder in Artikeln sollen einen Rahmen mit abgerundeten Ecken bekommen
- Einzelne Abschnitte im Artikel sollen besser voneinander unterscheidbar sein
  