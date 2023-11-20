---
title: "Vorlesung Webengineering I - HTTP & REST"
topic: "Webengineering_1_1"
date: 2023-09-22
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
  - Zustandsinformationen (z.B. Logindaten) müssen auf andere Art und Weise gespeichert werden

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
![](https://blog.cloudflare.com/content/images/2023/06/download-3.png){height=95%}


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


## Exkurs HTTP Content Negotiation

- Feature das eine *automatische* Einigung auf ein Ausgabeformt ermöglicht
- Client sendet gewünschtes Format im `Accept`-Header
  - Angabe mehrerer Formate: z.B. `Accept: text/html,text/plain`
  - Server gibt die Antwort im ersten untertützten Format zurück
- Format der Antwort über `ContentType`-Header angegeben

```{.plantuml height=35%}
Client->Server : Accept: application/json, text/xml
Server->Client : ContentType: application/json
```

# REST
