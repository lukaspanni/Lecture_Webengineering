---
title: "Vorlesung Webengineering 1 - Recap 1. Semester"
topic: "Webengineering_1_09_x"
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

# Rückblick 1. Semester

## Feedback

### Was war gut? Was kann verbessert werden? Wünsche für dieses Semester?

# Behandelte Themen

## Was ist eine Webanwendung?

> Eine **Webanwendung** ist eine Anwendung, die Web-Technologien (_HTML_, _CSS_, _JavaScript_) verwendet

Einfache und ausreichende Definition.

## Grundlagen Web: HTTP

- = Hypertext Transfer Protocol (HTTP)
- Übertragung von Daten zwischen Browser & Webserver
- Zustandslosigkeit / Request-Response-Prinzip: Jede Anfrage ist unabhängig von vorherigen Anfragen
- Textbasiertes Protokoll, Struktur: Header (mehrere Key-Value Paare) + Body (beliebiger Text)

## Grundlagen Web: HTTP Request - Response

**Request**:

```
GET / HTTP/1.1
Host: lukaspanni.de
Accept: */*

```

**Response**:

```
HTTP/1.1 200 OK
Content-Type: text/html
Date: Tue, 02 Apr 2024 17:42:37 GMT

<!DOCTYPE html>
...

```

## Grundlagen Web: HTTP Methoden

| **Methode** | **Beschreibung**                  |
| ----------- | --------------------------------- |
| **GET**     | Ressource abrufen                 |
| **HEAD**    | Header für Ressource abrufen      |
| **POST**    | Ressource erstellen               |
| **PUT**     | Ressource ersetzen                |
| **DELETE**  | Resource löschen                  |
| **OPTIONS** | Liste erlaubter Methoden anfragen |

## Grundlagen Web: HTTP Statuscodes

| **Bereich** | **Kategorie** | **Zweck**                                                                       |
| ----------- | ------------- | ------------------------------------------------------------------------------- |
| 1xx         | Informational | Informationen über den aktuellen Stand, kaum relevant                           |
| 2xx         | Success       | Request war erfolgreich                                                         |
| 3xx         | Redirection   | Client muss andere Seite aufrufen, Server teilt dem Client mit welche / Auswahl |
| 4xx         | Client Error  | Fehler, der Client ist schuld                                                   |
| 5xx         | Server Error  | Fehler, der Server ist schuld                                                   |

## Grundlagen Web: Addressierung über URL

- URL = Uniform Resource Locator
- `<schema>:<schema-spezifisch>`
- HTTP: `http://<host>:<port>/<pfad>?<query>#<fragment>`
  - `<host>`: der Domainname / die IP des angefragten Servers \rightarrow{} Host-Header
  - `<port>`: TCP-Port des Webservers, HTTP 80 (HTTPS 443)
  - `<pfad>`: Pfad zur Ressource (konkrete "Seite") \rightarrow{} erste Zeile des Requests
  - `<query>`: Zusatzinformationen, z.B. Filter oder Anzeigeformate
  - `<fragment>`: Verweis auf bestimmten Abschnitt einer Webseite z.B. [wikipedia.org/wiki/URL#Fragment](https://de.wikipedia.org/wiki/URL#Fragment)


## Grundlagen Web: REST

- = Representational State Transfer
- Architekturstil verteilter Systeme
  - Eindeutig identifizierbare Ressourcen im Mittelpunkt
  - Links und Hypermedia als Steuerungselemente
  - Einheitliche, generische Schnittstellen
  - Möglichkeit verschiedener Repräsentationen
  - Zustanslose Kommunikation der Komponenten

## Grundlagen Web: HTML

- = Hypertext Markup Language
- Auszeichnungssprache: beschreibt **Struktur** und **Inhalt**
- Komponenten: **Elemente** (Tags: `<X> ... </X>`) und **Attribute** (`X="Y"`)
- Gliederung in _Head_ (Metadaten, `<head>`) und _Body_ (Inhalt `<body>`)
- Semantische Elemente (z.B. `<header>`, `<footer>`, `<nav>`, `<article>`, `<section>`, `<aside>`, `<main>`) sollten genutzt werden, um Semantik zu verdeutlichen

## Grundlagen Web: HTML - Wichtige allgemeine Tags

- **Überschriften**: `<h1> ... <h6>`
- **Hervorhebungen**: `<strong>`, `<em>`
- **Absätze**: `<p>`
- **Listen**: `<ul>`, `<ol>`, `<li>`
- **Bilder**: `<img src="url" alt="Beschreibung">`
- **Links**: `<a href="url">Text</a>`

## Grundlagen Web: HTML - Formulare

- Eingabe von Daten durch Nutzer ermöglichen
- Senden über `GET` (Query-Parameter) oder `POST` (Body)
- `<form action="Ziel-URL">...</form>`
- `<input type="text" name="name" placeholder="Name eingeben" required>`
  - Typen: `text`, `password`, `number`, `email`, `date`, `file`, `submit`, `reset`, ...


## Grundlagen Web: CSS

- = Cascading Style Sheets
- Beschreibung der **Darstellung** von HTML-Elementen
- Ruleset: `Selektor { Eigenschaft: Wert; ... }`
  - **Selektoren**: Universal (`*`), Element (`p`), Klasse (`.class`), ID (`#id`), Attribut (`[attr]`), Kombinationen (`div p`, `div > p`, `div + p`, ...), Pseudoklassen (`:hover`, `:nth-child()`, ...)
  - **Eigenschaften**: `color`, `background-color`, `font-size`, `border`, `margin`, `padding`, `display`, ...
- Einbindung: `style`-Element im `head`, externes Stylesheet (`<link rel="stylesheet" href="url">`), Inline-Styles (Attribut `style="..."`)


## Grundlagen Web: CSS - Box-Modell + Positionierung

- Jedes Element ist eine Box: Inhalt umschlossen von _Padding_, _Border_ und _Margin_
- Modernes Layout-Modell: **Flexbox**
  - Dynamische Anpassung (flex/shrink) an vorhandenen Platz
  - Flex-Container (`display: flex;`) und Flex-Items (`flex: ...;`)
  - Eigenschaften für Container: `flex-direction`, `justify-content`, `align-items`, ...
  - Eigenschaften für Items: `flex`, `order`, `align-self`, ...


## Exkurs: Webdesign

- Begriffe: i18n, l10n, UX, Usability
- Gestaltgesetze: Nähe, Gleichheit
  - Was wird zusammengehörig wahrgenommen?
  - Wie können Gesetzmäßigkeiten im Design genutzt werden?
- Gestaltung von Bedienelementen
  - Affordances & Constraings \rightarrow{} welche Nutzung wird nahegelegt? (sieh Norman-Doors)
  - Feedback: Sinnvolle Rückmeldungen bei Nutzerinteraktionen
- Entwurfsprinzipien


## Grundlagen Web: JavaScript

- Programmiersprache für Webanwendungen (Client & Server)
- Client:
  - Verändern von HTML (DOM)
  - Reaktion auf Nutzereingaben
  - Nachladen von Daten, Kommunikation mit Server
  - Komplexe Animationen
- Server:
  - Erzeugen von HTML
  - Bereitstellen von APIs (JSON, XML, ...)

## Grundlagen Web: JavaScript - DOM

- = Document Object Model
- Repräsentation der HTML-Struktur als Baum
- Zugriff auf und Veränderung von HTML-Elementen über JavaScript
  - Ändern von Inhalt (`innerText`, `textContent`)
  - Ändern von Attributen (`setAttribute`, `removeAttribute`)
  - Hinzufügen von Elementen (`createElement` + `appendChild`, `insertBefore`, ...)
- Event-Handler: Reaktion auf Benutzerinteraktionen
  - `element.addEventListener("click", handler)`
  - `element.onclick = handler`


## Grundlagen Web: JavaScript - fetch-API

- Asynchrone API für Kommunikation mit Server
- `fetch(url, options): Promise<Response>`
  - `url`: Ziel-URL
  - `options`: Konfiguration (Methode, Body, Header, ...)
  - `Promise<Response>`: Asynchrones Ergebnis


## Webarchitekturen

- Grundlagen Client-Server-Modell
  - Server: Bietet Dienste an
  - Client: Nutzt Dienste
- Zentrale Fragen der Softwarearchitektur: Modularisierung von Struktur, Kommunikation, Deployment
  - Komplexes Problem wird in kleinere Teile zerlegt
  - Komponenten lösen Problem durch Interaktion

## Webarchitekturen Konzepte

- **Schichtenarchitektur**: Aufteilung in klar getrennte Schichten (z.B. Präsentation, Anwendung, Daten)
  - Klassische Aufgabenteilung: Browser (Präsentation), Web-Server (Anwendung) Datenbank-Server (Daten)
  - Hohe Interaktivität erfordert Verlagerung von Logik in Richtung Client
  - Aufgabenverteilung in der Praxis nicht so eindeutig möglich


# Organisatorisches 2. Semester

## Vorlesung

- 22 Vorlesungseinheiten
  - i.d.R. 3x 45 min. + 15 min. Pause (1 Termin mit einer zusätzlichen Einheit)
  - Feiertag 20.05. 
  - letzte Vorlesung voraussichtlich 24.06.

## Prüfungsleistung

- Projektarbeit: 
  - siehe Bewertungskriterien
  - Abgabe: voraussichtlich 11.08. finaler Termin wird mindestens 3 Wochen vorher bekannt gegeben

