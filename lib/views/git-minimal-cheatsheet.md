#### {% title "Git – krótka ściągawka" %}

<blockquote>
  {%= image_tag "/images/algorithm.png", :alt => "[Rozwiązanie…]" %}
</blockquote>

Git w 5 minut – absolutne podstawy.

## github.com & sigma.ug.edu.pl

1. Zakładanie konta – plan **[free for open source](https://github.com/plans)**
2. Umieszczenie swojego klucza publicznego z **sigmy** na swoim koncie
   na *githubie* – **[Account Settings/SSH Public Keys](https://github.com/account/ssh)**
3. Utworzenie nowego repozytorium na *githubie* – po zalogowaniu
   się do swojego konta, przycisk **[New Repository](https://github.com/)**

Po kliknięciu w przycisk i wpisaniu nazwy **abc** wyświetlana jest podpowiedź:

    mkdir abc
    cd abc
    git init
    touch README
    git add README
    git commit -m 'first commit'
    git remote add origin git@github.com:wbzyl/abc.git
    git push -u origin master

Wykonujemy wszystkie te polecenia. Na początek nie powinniśmy
zawracać sobie głowy co robi polecenie z **remote** oraz
do czego służy opcja **-u** powyżej.
Na razie są to „szczegóły techniczne”.
Ważne jest aby przeklikać **całe** polecenia.

O pozostałych poleceniach należy umieć powiedzieć
swoimi słowami co one robią.

## git na co dzień

Zaczynamy od pobrania ostatnich zmian:

    git pull

Edytujemy jakiś plik, np. *README*.
Sprawdzamy status repozytorium:

    git status

Dodajemy plik *README* do repozytorium:

    git add README
    git commit -m "Dopisałem coś do README."

Wrzucamy zamiany na *githuba*:

    git push

… i tak w kółko …


## git diff z meld

Najpierw instalujemy program [Meld](http://meldmerge.org/)
(najlepiej z jakiejś paczki).

Następnie konfigurujemy Gita:

    :::bash
    git config --global diff.tool meld

Teraz wystarczy wykonać, na przykład:

    :::bash
    git difftool

*Można też tak:* do pliku *.gitconfig* dopisujemy:

    :::ini
    [merge]
      tool = extMerge
    [mergetool "extMerge"]
      cmd = extMerge "$BASE" "$LOCAL" "$REMOTE" "$MERGED"
      trustExitCode = false
    [diff]
      external = extDiff

gdzie skrypt *extMerge*:

    :::bash
    #! /bin/bash
    /usr/bin/meld "$@"

i skrypt *extDiff*:

    :::bash
    #! /bin/bash
    [ $# -eq 7 ] && extMerge "$2" "$5"

zapisujemy, np. w katalogu *$HOME/bin*
(o ile mamy go w ścieżkach zmiennej *PATH).


## Search a git repo like a Ninja

Konfiguracja:

    :::bash
    git config --global grep.extendRegexp true
    git config --global grep.lineNumber true

Aliasy – group like Ack:

    :::bash
    git config --global alias.g "grep --break --heading --line-number"

Praktyczne przykłady:

    :::bash
    git grep -e <regexp> other_branch -- '*.js'
    git grep <regexp> $(git rev-list --all)
    git log --grep=login --author=travis --since=1.month


## …i co dalej?

* Pracę z projektem ułatwiają [gałęzie](http://progit.org/book/pl/ch3-0.html)
  (link do polskiego tłumaczenia [podręcznika](http://progit.org/book/pl/)).
* Do swoich projektów można i należy dodawać **collaborators** –
  po wejściu na stronę z projektem, zakładka **Admin**.
  Na początek można dodać jako współpracowników wykładowcę
  (login *wbzyl*) i prowadzących laboratoria.

## Git for ages 4 an up

* [Michael Schwern](http://blip.tv/open-source-developers-conference/git-for-ages-4-and-up-4460524) –
  git makes so much more sense when you understand how it really works,
  because its really a two trick pony.
* [Git shouldn't be so hard to learn](http://think-like-a-git.net/)
