# Środowisko Programisty

Gem zawierający notatki do wykładu „Środowisko Programisty”.


## Instalacja

Wykonać polecenie:

    gem install sp-tutorial -s http://gemcutter.org


## Uruchamianie

Sprawdzamy gdzie w systemie został zainstalowany gem *sp-tutorial*:

    gem which sp-tutorial

Aplikację uruchamiamy w takis sposób:

<pre>rackup /«<i>ścieżka do katalogu z gemem</i>»/lib/config.ru -p 8008
</pre>

Na przykład:

    rackup rackup /usr/lib/ruby/gems/1.8/gems/sp-tutorial-0.3.0/lib/config.ru -p 8008

Po uruchomieniu aplikacja jest dostępna z URL:

    http://localhost:8008/
