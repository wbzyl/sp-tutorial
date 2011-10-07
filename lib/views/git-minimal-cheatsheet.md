#### {% title "Git – krótka ściągawka" %}

<blockquote>
  {%= image_tag "/images/algorithm.png", :alt => "[Rozwiązanie…]" %}
</blockquote>

Git w 5 minut – absolutne podstawy.

## github.com & sigma.ug.edu.pl

1. Zakładanie konta **[Free for open source](https://github.com/plans)
2. Umieszczenie swojego klucza publicznego z **sigmy** na swoim koncie
   na *githubie* – **[Account Settings/SSH Public Keys](https://github.com/account/ssh)*
3. Utworzenie nowego repozytorium na *githubie* – po zalogowaniu
   się do swojego konta, przycisk **[New Repository](https://github.com/)**

Po kliknięciu w przycisk i wpisaniu nazwy **abc** wyświetlana jest taka podopowiedź:

    mkdir abc
    cd abc
    git init
    touch README
    git add README
    git commit -m 'first commit'
    git remote add origin git@github.com:wbzyl/abc.git
    git push -u origin master

## git na co dzień

Zaczynamy od pobrania ostatnich zmian:

    git pull

Edytujemy jakiś plik, np. *README*.
Sprawdzamy status repozytorium:

    git status

Dodajemy plik *README* do repozytorium

    git add README
    git commit -m "Dopisałem coś do README."

Wrzucamy zamiany na *githuba*:

    git push

… i tak w kółko …


## …i co dalej?

* Pracę z projektem ułatwiają [gałęzie](http://progit.org/book/pl/ch3-0.html)
  ([cały podręcznik](http://progit.org/book/pl/).
* Do swoich projektów można i należy dodawać **collaborators** –
  po wejściu na stronę z projektem, zakładka **Admin**.
  Na początek należy dodać jako współpracownika wykładowcę
  i prowadzącego laboratorium.
