# Środowisko Programisty

Gem zawierający notatki do wykładu z „Środowiska Programisty”.


## Instalacja

Wykonać polecenie:

    gem install sp-tutorial -s http://gemcutter.org


## Uruchamianie

Sprawdzamy gdzie w systemie został zainstalowany gem *sp-tutorial*:

    gem which sp-tutorial

Przechodzimy do tego katalogu i uruchamiamy aplikację:

<pre>rackup <i>ścieżka do katalogu z gemem</i>/lib/config.ru -p 8008
</pre>

Po uruchomieniu aplikacja jest dostępna z URL:

    http://localhost:8008/


## Zależności

*sp-tutorial* zależy od następujących gemów:

* rack 
* sinatra
* ultraviolet
* rdiscount
* sinatra-rdiscount    
* rack-codehighlighter
