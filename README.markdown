# Środowisko Programisty

Gem zawierający notatki do wykładu z „Środowiska Programisty”.

### Instalacja

Wykonać polecenie:

    gem install wbzyl-sp-ii -s http://gems.github.com



### Zależności

*sp-tutorial* zależy od następujących gemów, 
które należy zainstalować:

* rack 
* sinatra
* rdiscount
* wbzyl-sinatra-rdiscount    
* wbzyl-rack-codehighlighter
* ultraviolet

### Uruchamianie

Sprawdzamy gdzie w systemie został zainstalowany gem *sp-ii*:

    gem which wbzyl-sp-ii

Przechodzimy do tego katalogu i uruchamiamy aplikację:

    thin --rackup config.ru -p 3000 start

Po uruchomieniu aplikacja jest dostępna z URL:

    http://localhost:3000/

## TODO

Dopisać kilka scenariuszy, 
podobnych do [GitUsage](http://biopython.org/wiki/GitUsage).
