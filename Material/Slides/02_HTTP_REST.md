---
title: "Vorlesung Webengineering I - HTTP & REST"
topic: "Webengineering_1_1"
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

# HTTP

## Hypertext Transfer Protocol (HTTP) - Grundlage des Web 

- Übertragung von Daten zwischen Webbrowser und Webserver 
- Textbasiertes Protokoll
- **Zustandsloses** Protokoll, Request-Response Prinzip
  - Protokoll speichert keine Informationen!
  - Jedes Request-Response-Paar ist unabhängig voneinander
  - Erhöht Skalierbarkeit \rightarrow{} dazu später mehr
  - ABER: Zustandsinformationen (z.B. Logindaten) müssen auf andere Art und Weise gespeichert werden

## HTTP Request - Response 

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
Date: Fri, 17 Nov 2023 12:26:59 GMT

<!DOCTYPE html>
...

```

## HTTP-Request - Aufbau

- Request besteht aus einzelnen Textzeilen, jeweils mit `<CR><LF>` (Zeilenumbruch) getrennt
  - Request endet nach Leerzeile (= `<CR><LF><CR><LF>`)

- Erste Zeile: `<Methode> <Resource> <Protokoll><CR><LF>`
  - Methode: `GET`
  - Resource: `/` (Hauptseite)
  - Protokoll: `HTTP/1.1` (aktuellste Version 3, heute meist Version 2 eingesetzt)


## Verbreitung der HTTP-Versionen
![](https://blog.cloudflare.com/content/images/2023/06/download-3.png){height=80%}

_https://blog.cloudflare.com/content/images/2023/06/download-3.png_

## HTTP-Versionen

- 1996: **HTTP/1.0**
- 1999: **HTTP/1.1**
	- Verschiedene Verbesserungen, z.B. Pipelining zur Reduktion von TCP-Verbindungen
	- Einführung von optionalem "Host"-[[HTTP-Header|Header]] 
		- → ermöglicht Nutzung von einem physischen Server für mehrere Webseiten
- 2015: **HTTP/2**
	- **Ziel**: Performanceverbesserungen und Optimierungen
	- Volle Abwärtskompatibilität
	- Multiplexing: mehrere Anfragen über eine Verbindung
	- Server-initiierte Datenübertragung \rightarrow{} konnte sich nicht durchsetzen, seit Chrome 106 (September 2022) nicht mehr unterstützt


## HTTP-Versionen 

- 2022: **HTTP/3**
	- Neues Übertragungsprotokoll: **QUIC**
  - Bei zuvor genutztem Multiplexing über TCP ist Head-of-Line-Blocking möglicht
    - Bei Paketverlust müssen alle folgenden Pakete (aller gemultiplexten Streams) auf erneute Übertragung des Verlorenen warten
	- Mehrere nutzt _unabhängige_ parallele Datenströme über UDP, Head-of-Line-Blocking betrifft jeweils nur einen Stream

## HTTP-Versionen - HTTP/3 vs. HTTP/2
![](media/HTTP3.png){height=65%}

_https://de.wikipedia.org/wiki/Hypertext_Transfer_Protocol#/media/Datei:HTTP-2_vs._HTTP-3_Protocol_Stack.svg_


## HTTP Header

- Jede weitere Zeile im Request: `<Key>: <Value>`
  - `Host: lukaspanni.de` \rightarrow{} Pflicht-Header ab HTTP/1.1 
  - `Accept: */*` \rightarrow{} Format der Antwort egal

- Viele weitere Standard Request-Header:
  - User-Agent
  - Accept-Encoding
  - Accept-Language
  - Cookie
  - ...
- Steuern verschiedene Funktionen ...


## HTTP Content Negotiation

- Feature das eine *automatische* Einigung auf ein Ausgabeformt ermöglicht
- Ermöglicht verschiedene _Repräsentationen_ für die gleiche _Ressource_
- Weitere Header für Sprache (`Accept-Language`) und Kodierung `Accept-Encoding`
- Format der Antwort über `ContentType`, `Language`, `Encoding` Header angegeben

- Server-driven (Server entscheidet):
  - Client sendet gewünschtes Format im `Accept`-Header
  - Angabe mehrerer Formate: z.B. `Accept: text/html,text/plain`
  - Server gibt die Antwort im ersten untertützten Format zurück


## HTTP Content Negotiation

```{.plantuml height=50%}
Client->Server : GET /; Accept: application/json, text/xml
Server->Client : 200 OK, ContentType: application/json
```

## HTTP Content Negotiation

- Agent-driven (Client entscheidet) 
  - Gleicher Beginn, Server antwortet mit Liste verfügbarer Repräsentationen
  - Client kann die am besten passende auswählen und anfragen 


```{.plantuml height=50%}
Client->Server : GET /; Accept: application/json, text/xml
Server->Client : 300 Multiple Choices; ...
Client->Server : GET /r1; Accept: application/json 
Server->Client : 200 OK, ContentType: application/json
```

 
## HTTP Content Negotiation

- Beide Varianten haben Vor- und Nachteile

|     | Nachteile | Vorteile |
| --- | ---      | ---       |
| Server-driven | gute Unterstzützung | Server kann nicht optimal entscheiden |
| Agent-driven | kein einheitliches Format | - Client kann die optimale Entscheidung treffen \newline - zusätzlicher Request notwendig |



## HTTP Methoden

- Verschiedene Methoden zum Ausdruck der _Semantik_
### Wichtige Methoden

|   Methode   | Beschreibung                       |
| ----------- | ---------------------------------- |
| **GET**     | Ressource abrufen                  |
| **HEAD**    | Header für Ressource abrufen       |
| **POST**    | Ressource erstellen                |
| **PUT**     | Ressource ersetzen                 |
| **DELETE**  | Resource löschen                   |
| **OPTIONS** | Liste erlaubter Methoden anfragen  |




## HTTP Status Codes

# REST
