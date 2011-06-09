#### {% title "Laboratorium 1" %}

W żadnym z poniższych zadań nie wolno używać programu *mc*.

Polecenia: mkdir, cp, mv, touch, tree.
Ścieżki względne i bezwzględne: `~`, `..`, `.`.

1\. Używając linii poleceń stwórz strukturę katalogów:

    temp
    |-- dom
    |-- nauka
    |   |-- c
    |   |-- logo
    |   `-- pascal
    `-- praca
        |-- dokumenty
        `-- zlecenia
            |-- niezrealizowane
            `-- zrealizowane

2\. Przejdź do katalogu *dom* i utwórz katalog *wazne-sprawy*.

3\. Wejdź do katalogu *wazne-sprawy* i utwórz tam pusty plik
*rachunki.txt*.

4\. Będąc w katalogu *wazne-sprawy* skopiuj plik *rachunki.txt* do
katalogu *zrealizowane*.

5\. Przejdź do katalogu *zrealizowane* i zmień nazwę pliku *rachunki.txt* na
*wykonano.txt*.

Polecenia: split, cat, diff

6\. Utwórz plik *wykonano.txt* wielkości 11 bajtów,
następnie podziel go pliki wielkości 5 bajtów.
W ten sposób otrzymasz 3 pliki. (*split*)

7\. Będąc w katalogu *logo* skopiuj powyżej otrzymane 3 pliki do
katalogu *dokumenty*.

8\. Będąc w katalogu dokumenty połącz skopiowane 3 pliki w plik
*odtworzono.txt*, tak aby otrzymać plik o zawartości identycznej z
*wykonano.txt*. Następnie plik *odtworzono.txt* skopiuj do katalogu
*wazne-sprawy*.

9\. Będąc w katalogu *wazne-sprawy* sprawdź, czy są jakieś różnice w
zawartości plików *wykonano.txt* i *odtworzono.txt*.

10\. Wyświetl kalendarz na październik 2009 r.  (*cal*)

Wyświetl kalendarz na wrzesień, październik i listopad 2009 r.
z miesiącami obok siebie (*cal*):

        wrzesień 2009       październik 2009        listopad 2009
    ni po wt śr cz pi so  ni po wt śr cz pi so  ni po wt śr cz pi so
           1  2  3  4  5               1  2  3   1  2  3  4  5  6  7
     6  7  8  9 10 11 12   4  5  6  7  8  9 10   8  9 10 11 12 13 14
    ...                   ...                   ...

Wyświetl kalendarz na październik, listopad i grudzień 2009 r.
w taki sposób:

         październik             listopad               grudzień
    ni po wt śr cz pi so   ni po wt śr cz pi so   ni po wt śr cz pi so
                 1  2  3    1  2  3  4  5  6  7          1  2  3  4  5
     4  5  6  7  8  9 10    8  9 10 11 12 13 14    6  7  8  9 10 11 12
    11 12 13 14 15 16 17   15 16 17 18 19 20 21   13 14 15 16 17 18 19
    ...                    ...                    ...

I jeszcze raz na wrzesień i październik oraz
na październik i listopad 2009 r z miesiącami obok siebie
(*cal*, *cut*?):

         październik             listopad
    ni po wt śr cz pi so   ni po wt śr cz pi so
                 1  2  3    1  2  3  4  5  6  7
     4  5  6  7  8  9 10    8  9 10 11 12 13 14
    11 12 13 14 15 16 17   15 16 17 18 19 20 21
    ...                    ...

11\. Jaki był dzień tygodnia 25 maja 1975 r. (*cal* i *date*)
