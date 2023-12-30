---
title: Einführung in Git 
lang: de-DE
author: "Lukas Panni"
...

#  Einführung in Git

## Was ist Git?

Git ist ein _dezentrales_ Versionsverwaltungssystem und ermöglicht die einfache Nachverfolgung von Änderungen an Dateien.
Heute ist Git der de-facto Standard in der Softwareentwicklung.
Dezentral bedeutet dabei, dass jede Person, die an einem Projekt arbeitet, eine eigene Kopie des Projekts und aller Änderungen lokal auf ihrem Rechner hat und damit auch offline arbeiten kann.

## Wozu brauche ich Git?

Git ist besonders sinnvoll, wenn im Team gearbeitet wird.
Durch die Nachverfolgbarkeit der Änderungen einzelner Personen können parallele Änderungen an einem Projekt einfach zusammengeführt werden.
Aber auch für Einzelpersonen ist Git sinnvoll, da es eine einfache Möglichkeit bietet, Änderungen an einem Projekt nachzuvollziehen und bei Bedarf zu einem früheren Stand zurückzukehren.


## Wie kann ich Git nutzen?

Um alle Funktionen nutzen zu können, wird die Verwendung der Kommandozeile empfohlen.
Allerdings gibt es auch grafische Oberflächen, Plugins für Editoren und IDEs, die wichtige Funktionen von Git einfach zugänglich bereitstellen.

## Wichtige Begriffe

- Repository: Projekt/Ordner, der mit Git verwaltet wird.
  - Remote: Repository auf einem zentralen Server, zum Beispiel GitHub oder GitLab
  - Local: Lokales Repository auf dem eigenen Rechner, häufig ein Klon eines Remote-Repositories
- Commit: Änderung an einem Repository, kann eine oder mehrere Dateien betreffen
- Push: Hochladen von Änderungen zu einem Remote-Repository
- Pull: Herunterladen und Integrieren von Änderungen von einem Remote-Repository in ein lokales Repository
- Branch: "Zweig" eines Projekts, erlaubt parallele Entwicklung von verschiedenen Features ohne Konflikte zu erzeugen. Alle Commits auf einem Branch sind zunächst nur auf diesem Branch, andere Branches werden davon nicht beeinflusst


## Erste Schritte mit Git

Viele Linux-Distributionen haben Git bereits vorinstalliert, ansonsten ist Git über den jeweiligen Paketmanager verfügbar.
Unter MacOS wird Git über die XCode Command Line Tools automatisch installiert, wenn das erste Mal `git` in der Kommandozeile ausgeführt wird (für die neuste Version ist eventuell eine Installation über die Webseite besser).
Für Windows kann Git von der [Git-Website](https://git-scm.com/downloads) heruntergeladen werden.

### Grundkonfiguration

Bevor mit der Arbeit mit Git begonnen werden sollte, wird emfpolen, einige grundlegende Einstellungen vorzunehmen.
Insbesondere sollten Name und E-Mail-Adresse für die Zuordnung zu einem Commit konfiguriert werden:
```bash
git config --global user.name "XXXX YYYY"
git config --global user.email "XXXX.YYYY@ZZZZ.AA"
```

Windows-Nutzer sollten außerdem noch die folgende Einstellung vornehmen, um Problemen mit Zeilenumbrüchen bei der Zusammenarbeit mit Nutzern anderer Betriebssysteme vorzubeugen:
```bash
git config --global core.autocrlf true
```

### Repository anlegen

Ein neues Repository wird mit `git init` erzeugt.
Dabei wird ein neuer Ordner `.git` im aktuellen Ordner angelegt, der alle Informationen über das Repository enthält.
Ansonsten ist das Repository zunächst leer.

Um ein bestehendes Remote-Repository zu klonen, wird `git clone <url>` verwendet, wobei standardmäßig die gesamte Historie heruntergeladen wird.

### Änderungen nachverfolgen

Mit `git status` kann der aktuelle Status des Repositories abgefragt werden.
Dabei wird angezeigt, welche Dateien geändert wurden, welche Dateien neu hinzugekommen sind und welche Dateien gelöscht wurden.
Außerdem wird angezeigt, welche Dateien aktuell nicht nachverfolgt werden.
Änderungen müssen explizit mit `git add <file>` (oder `git add -A` für alle Dateien) für den Commit vorgemerkt ("staged") werden.

Mit dem Befehl `git commit` wird ein Commit erzeugt, der alle vorgemerkten Änderungen enthält.
Ein Commit hat immer auch eine Commit-Message, die beschreiben sollte, welche Änderungen vorgenommen wurden.
Die Message kann direkt mit `git commit -m "Message"` angegeben werden, ansonsten wird der Standard-Editor geöffnet.

### Änderungen hochladen

Wenn ein Remote-Repository konfiguriert ist (automatisch beim Klonen, ansonsten mit `git remote add <name> <url>`), können Änderungen mit `git push <name> <branch>` hochgeladen werden.
Der Standardname eines Remote-Repositories ist `origin` und kann weggelassen werden.
Auch der Branch kann häufig weggelassen werden, da standardmäßig der aktuelle Branch und dessen konfigurierter Remote-Branch verwendet wird.

### Änderungen herunterladen

Mit `git pull <name> <branch>` können Änderungen von einem Remote-Repository heruntergeladen und in das lokale Repository integriert werden.
Auch hier können der Name und der Branch meist weggelassen werden.

Achtung: ohne weitere Konfiguration nutzt Git die Standard-Strategie `merge`, um Änderungen zusammenzuführen, wobei Merge-Commits mit zwei Eltern-Commits erzeugt werden.
Um die Historie linear zu halten, kann stattdessen `rebase` verwendet werden, was entweder über die Konfiguration allgemein oder mit `git pull --rebase` einmalig aktiviert werden kann.

## Weitere Informationen

- [Git-Website](https://git-scm.com/)
- [Git-Book](https://git-scm.com/book/en/v2): konstenloses E-Book mit ausführlichen Anleitungen und Hintergrundinformationen
- [Attlasian Git-Tutorial](https://www.atlassian.com/git/tutorials): gute Tutorials zu verschiedenen Themen rund um Git, empfehlenswert auch die Tutorials zu Git-Branching und Git-Workflows: https://www.atlassian.com/git/tutorials/comparing-workflows


# Exkurs: GitHub

GitHub erlaubt die kostenlose Verwaltung von Remote-Repositories und bietet darüber hinaus viele Funktionen zur Zusammenarbeit.
Außerdem gibt es unter [GitHub Edducation](https://education.github.com/) für Studierende die Möglichkeit auf viele weitere normalerweise kostenpflichtige Funktionen zuzugreifen.

Im Rahmen dieser Vorlesung werden alle Vorlesungsmaterialien auf GitHub bereitgestellt.
Zugriff ist auch ohne Account möglich, mit Account können Updates leichter nachverfolgt werden (Repository beobachten oder mit Stern markieren).
Außerdem können Issues und Discussions genutzt werden, um Fragen zu stellen oder Fehler zu korrigeren und ihr könnt eure Projektarbeiten direkt über GitHub abgeben.
Trotzdem ist ein Account keine Pflicht!