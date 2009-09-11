# Środowisko Programisty

Gem zawierający notatki do wykładu z „Środowiska Programisty”.

### Instalacja

    gem install wbzyl-sp-tutorial -s http://gems.github.com

### Zależności

*sp-tutorial* zależy od następujących gemów, które należy zainstalować:

* rack 
* sinatra
* rdiscount
* wbzyl-sinatra-rdiscount    
* wbzyl-rack-codehighlighter
* ultraviolet

### Uruchamianie

Aplikację uruchamiamy, np. tak:

    thin --rackup config.ru -p 3000 start

Po uruchomieniu aplikacja jest dostępna z:

    http://localhost:3000/
