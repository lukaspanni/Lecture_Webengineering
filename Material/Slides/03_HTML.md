---
title: "Vorlesung Webengineering I - HTML"
topic: "Webengineering_1_2"
date: 2024-01-15
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

# HTML - Grundlagen

## HTML - Grundlagen

**H**yper**t**ext **M**arkup **L**anguage

- Auszeichnungssprache: Beschreibt **Struktur** und **Inhalt**
- Erste Version: Tim Berners-Lee - CERN 1990er
  - Tim Berners-Lee = "Erfinder" des Web: HTTP, HTML, URL, Webbrowser
  - Weiterentwicklung durch World Wide Web Consortium (W3C)

## HTML Grundstruktur

```html
<!doctype html>
<html>
  <head>
    <title>Titel</title>
    <meta charset="utf-8" />
  </head>
  <body>
    <!-- Kommentar -->
    <p>Inhalt (Absatz)</p>
  </body>
</html>
```

## HTML Grundstruktur

- Dateiendung: `.html`, `.htm`
- `<!DOCTYPE html>`: Angabe des Dokumententyps, Browser verstehen das Dokument auch ohne
- 2 Komponenten
  - **Head**: Metadaten, z.B. Titel, Encoding, Scripte
  - **Body**: eigentlicher Inhalt

## Syntax

- HTML-Elemente ("Tags") bestehen i.d.R. aus Start- und End-Tag
  - Öffnender Tag `<ELEMENT>`
  - Inhalt
  - Schließender Tag `</ELEMENT>`
  - Ausnahmen für z.B. Zeilenumbruch `<br>`, müssen nicht geschlossen werden
- HTML-Dokument ist eine Sammlung solcher Tags (mit einigen Regeln für die Verschachtelung)
- Inhalt der Seite innerhalb des `<body>`-Tags

## Syntax - Attribute

- Tags können mit **Attributen** angereichert werden
- Key-Value Paare
- Angabe im öffnenden Tag
- `<ELEMENT ATTRIBUT="VALUE"> ... </ELEMENT>`
- Nutzbarkeit abhängig vom Tag


## HTML Head

- Umschlossen mit `<head>`-Tag
- Möglicher Inhalt
  - `<title>` Titel der Seite, darf nur einmal vorkommen
  - `<meta>` beliebige Metadaten (als Attribute)
  - `<link>` Links zu verwandten Ressourcen, z.B. Stylesheets
  - `<style>` direkte Angabe von **CSS**-Styles
  - `<script>` **JavaScript**-Code oder Link auf einzubindendes Script
- In der Regel wird zumindest ein Titel und der Zeichensatz (Charset = Codierung) angegeben
  ```html
  <meta charset="utf-8" /> <title>Titel</title>
  ```

## HTML Body

- Umschlossen mit `<body>`-Tag
- Alle Elemente im Body können vom Browser dargestellt werden
- Schachtelung:
  - `<tag1><tag2>Inhalt</tag2></tag1>`
  - \rightarrow{} Tags müssen in der richtigen Reihenfolge geschlossen werden
  - `<tag1><tag2>Inhalt</tag1></tag2>` \rightarrow{} geht nicht!
  - Inline Elemente können keine Block Elemente enthalten

# HTML Elemente

## HTML Inline + Block Elemente

- Inline Element: (`<a>, <em>, <span> ...`)
  - Anzeige in einer Zeile, kein Zeilenumbruch für folgende Elemente
  - Beispiel:
    - `<em>Text 1</em><span>Text 2</span>`
    - \rightarrow{} _Text 1Text 2_
- Block Element: (`<p>, <div>, <section>, ...`)

  - Anzeige als "Block", jedes Element eine neue Zeile
  - Beispiel:

    - `<p>Absatz 1</p><p>Absatz 2</p>`
    - \rightarrow{} Absatz 1

      Absatz 2


## HTML Elemente: Überschriften

- `<h1>...</h1>` bis `<h6></h6>` (h = headline)
- Block-Elemente
- Absteigende Wichtigkeit, Standardmäßig entsprechende Darstellung im Browser

![](./media/HTML_headings_default.png){height=55%}


## HTML Elemente: Absätze

- `<p>...</p>` (p = paragraph)
- Block-Element + Abstand davor und danach

![](./media/HTML_paragraph_default.png){height=70%}


## HTML Elemente: Zeilenumbruch + Trennlinie

- `<br>` (br = break)
  - Zeilenumbruch, nachfolgende Elemente in nächster Zeile

- `<hr>` (hr = horizontal ruler)
  - Horizontale Trennlinie

![](./media/HTML_break_hr.png){height=70%}

## HTML Elemente: Hervorhebungen

- `<em>` (em = emphasis)
  - Einfache Hervorhebung
  - Darstellung standardmäßig: _kursiv_
- `<strong>`
  - Stärkere Hervorhebung
  - Darstellung standardmäßig: **fett**

![](./media/HTML_emphasis.png){height=70%}


## HTML Elemente: Fett / Kursiv

- Fett lässt sich auch über `<b>` (b = bold) erreichen
- Kursiv über `<i>` (i = italics)
- `<strong>` und `<em>` sind i.d.R. vorzuziehen!
  - Semantische Bedeutung: strong = "strong importance", em = "stressed emphasis"
  - \rightarrow{} Trennung von Inhalt + Struktur und Darstellung


## HTML Elemente: Hoch- / Tiefstellung

- `<sup>` (superscript)
  - Hochstellung 
- `<sub>` (subscript)
  - Tiefstellung


![](./media/HTML_sup_sub.png){height=70%}



## HTML Globale Attribute

- Recap: Tags können mit Attributen (Key-Value Paare) angereichert werden
- Attribute abhängig vom Tag
  - Einige global verfügbar: [Universalattribute](https://wiki.selfhtml.org/wiki/HTML/Attribute#Universalattribute) 
- Wichtige Universalattribute
  - `id` - eindeutiger Identifier für Element (z.B. Zugriff über `#ID` in URL)
  - `class` - Klasse von gleichartigen Elementen, Liste von Klassen (Leerzeichengetrennt)
  - `hidden` - Elemente verstecken
  - `style` - Inline CSS-Style


## HTML Elemente: Auswahl semantischer Elemente

- Bereits behandelt: `<em>` / `<strong>`
- Weitere Elemente mit vorwiegend **semantischer Bedeutung**
  -  
