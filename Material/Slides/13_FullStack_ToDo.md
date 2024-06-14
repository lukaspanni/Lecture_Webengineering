---
title: "Vorlesung Webengineering 1 - Praxis: Full-Stack Webanwendung"
topic: "Webengineering_1_13"
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


# Anforderungen 

## Sammlung von Anforderungen

### Funktionale Anforderungen 

- Was soll die Anwendung tun?
  - Anforderungen an Funktionalität, Verhalten, ...

### Nicht-funktionale Anforderungen

- Wie soll die Anwendung etwas tun?
  - Anforderungen an Qualität, Skalierbarkeit, Sicherheit, ...

# Entwurf

## Datenmodell

- Welche Daten werden benötigt?
- Wie sind die Daten strukturiert?

## Grundsätzliche Architektur

- Zerlegung in Komponenten: Lösung des Gesamtproblems durch Zusammenarbeit
- Kommunikation zwischen Komponenten: Schnittstellen (im Web stark standardisiert!)
- Deployment der Komponenten: \rightarrow{} nächste Vorlesung: Deployment mit Docker


# Implementierung

## Technologien

- Backend: TypeScript, Express, bun
- Frontend: TypeScript, HTML, CSS

### Gemeinsame Implementierung, beginnend mit dem Backend