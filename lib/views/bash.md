#### {% title "Bash w przykładach" %}

<blockquote>
  {%= image_tag "/images/algorithm.png", :alt => "[Rozwiązanie…]" %}
</blockquote>

Użyteczna ściąga: [Linux Commands In Structured Order with Detailed Reference](http://linoxide.com/guide/linux-command-shelf.html).

1\. Podaj przykład skryptu wykorzystującego zmienne
i zmienne środowiska np. USER, PWD, HOME.

    :::bash
    #!/bin/bash
    echo "Czesc $USER"
    echo "twoj aktualny katalog to $PWD"
    zmienna="a to twoj katalog domowy to $HOME"
    echo $zmienna
    echo "nazwa twojego hosta to: $HOSTNAME"
    echo "korzystasz z systemu operacyjnego: $OSTYPE"
    zmienna2=$(pwd)
    echo "\"Ciapki\" – przyklad: $zmienna2"
    exit 0

2\. Podaj przykład skryptu korzystującego ze zmiennych
specjalnych, czyli użyj $0, $1, $2, …, $9, $@, $*, $?, $$.

    :::bash
    #!/bin/bash
    echo "Nazwa biezacego skryptu: $0"
    echo "Pierwszy przekazany parametr do skryptu: $1"
    echo "Drugi przekazany parametr do skryptu: $2"
    echo "..."
    echo "Dziewiaty przekazany parametr do skryptu: $9"
    # separatorem będzie spacja
    echo "Skrypt uruchomiono z parametrami: $@"
    # separator okresla zmienna $IFS
    echo "Skrypt uruchomiono z parametrami: $*"
    echo "Kod powrotu ostanio wykonywanego polecenia: $?"
    echo "PID procesu biezacej powloki: $$"
    exit 0

3\. Podać przykład skryptu korzystającego z tablic
(Użyj declare, unset, *, @, # ).

    :::bash
    owoc[0]="jablko"
    owoc[1]="gruszka"
    owoc[2]="sliwka"
    owoc[3]="wisnia"
    echo "Pierwszy element tablicy owoc to: ${owoc[0]}"
    echo "Wszystkie elementy tablicy owoc to: ${owoc[*]}"
    echo "Wszystkie elementy tablicy owoc to: ${owoc[@]}"
    echo "Drugi element tablicy owoc ma ${#owoc[1]} znakow"
    echo "Tablica owoc ma ${#owoc[*]} elementy"
    imie=(Jola Ania Kasia Basia Magda)
    echo "Wszystkie elementy tablicy imie to: ${imie[@]}"
    unset imie  # usuniecie tablicy
    echo "Tablica imie ma ${#imie[*]} elementow"
    tab1=(`cat /etc/passwd`)
    echo "Tablica tab1 ma ${#tab1[*]} elementow"
    declare tab2=(`cat /etc/passwd`)
    echo "Tablica tab2 ma ${#tab2[*]} elementow"
    exit 0

4\. Napisać skrypt obliczający sumę, różnicę i iloczyn dwóch
wczytanych liczb całkowitych. (Użyj polecenia read.)

    :::bash
    #!/bin/bash
    echo -n "Podaj pierwsza liczbe: "
    read liczba1
    echo -n "Podaj druga liczbe: "
    read liczba2
    echo
    suma=$[liczba1 + liczba2] #1 sposob
    echo "Suma liczb wynosi: $suma"
    roznica=$((liczba1-liczba2)) #2 sposob
    echo "Roznica liczb wynosi: $roznica"
    let iloczyn=liczba1*liczba2 #3 sposob
    echo "Iloczyn liczb wynosi: $iloczyn"
    iloraz=$[liczba1/liczba2]
    echo "Iloraz liczb wynosi: $iloraz" #czesc calkowita
    modulo=$[liczba1%liczba2]
    echo "Modulo liczb wynosi: $modulo" #reszta
    exit 0

5\. Napisać skrypt sprawdzający, czy w katalogu głównym użytkownika
istnieje plik *.bashrc*. (Użyj instrukcji warunkowej if.)

    :::bash
    if [ -e ~/.bashrc ]
    # lub rownowaznie: if test -e ~/.bashrc
    then echo "Masz plik .bashrc"
    else echo "Nie masz pliku .bashrc"
    fi
    exit 0

Krótka ściąga z pozostałych warunków:

<table class="span-19" summary="Scaffold">
  <colgroup>
    <col class="table1"/>
    <col class="table2"/>
  </colgroup>
<tbody>
 <tr>
 <td>-d plik</td>
 <td>plik jest katalogiem</td>
 </tr>
 <tr>
 <td>-e plik</td>
 <td>plik istnieje</td>
 </tr>
 <tr>
 <td>-f plik</td>
 <td>plik jest plikiem regularnym</td>
 </tr>
 <tr>
 <td>-g plik</td>
 <td>plik ma przypisany set-group-id</td>
 </tr>
 <tr>
 <td>-r plik</td>
 <td>plik daje się odczytac</td>
 </tr>
 <tr>
 <td>-s plik</td>
 <td>plik ma niezerowy rozmiar</td>
 </tr>
 <tr>
 <td>-u plik</td>
 <td>plik ma przypisany set-user-id</td>
 </tr>
 <tr>
 <td>-w plik</td>
 <td>plik można edytowac (można pisac))</td>
 </tr>
 <tr>
 <td>-x plik</td>
 <td>plik wykonywalny</td>
 </tr>
</tbody>
</table>



6\. Napisać skrypt pytający się czy już jest wieczór. Dla odpowiedzi
„tak” powinien wypisać „Dobry wieczor”, dla odpowiedzi „nie” –
„Dzien dobry”, dla pozostałych odpowiedzi „Nie rozpoznana odpowiedz: ”
i przytoczyć treść odpowiedzi. (Użyj instrukcji warunkowej if-elif.)

    :::bash
    #!/bin/bash
    echo -n "Czy jest wieczor? Odpowiedz tak lub nie: "
    read odp
    if [ "$odp" = "tak" ]
    then echo "Dobry wieczor"
    elif [ "$odp" = "nie" ]
    then echo "Dzien dobry"
    else
      echo "Nie rozpoznana odpowiedz: $odp"
      exit 1
    fi
    exit 0

Jeszcze jedna ściąga:

<table class="span-19" summary="Scaffold">
  <colgroup>
    <col class="table1"/>
    <col class="table2"/>
  </colgroup>
<tbody>
 <tr>
 <td>ciąg</td>
 <td>ciąg jest niepusty</td>
 </tr>
 <tr>
 <td>ciąg1=ciąg2</td>
 <td>ciągi sa jednakowe</td>
 </tr>
 <tr>
 <td>ciąg1!=ciąg2</td>
 <td>ciągi nie sa rowne</td>
 </tr>
 <tr>
 <td>-n ciąg</td>
 <td>ciąg nie jest NULL</td>
 </tr>
 <tr>
 <td>-z ciąg</td>
 <td>ciąg jest NULL (pusty)</td>
 </tr>
</tbody>
</table>


7\. Napisać skrypt pobierający numer dnia tygodnia i wypisujący jego
nazwę lub informację „Nie rozumiem”. (Użyj polecenia read i
instrukcji warunkowej case.)

    :::bash
    #!/bin/bash
    echo "Podaj numer dnia tygodnia: "
    read dzien
    case "$dzien" in
      "1") echo "poniedzialek" ;;
      "2") echo "wtorek" ;;
      "3") echo "sroda" ;;
      "4") echo "czwartek" ;;
      "5") echo "piatek" ;;
      "6") echo "sobota" ;;
      "7") echo "niedziela" ;;
      *) echo "Nie rozumiem"
    esac
    exit 0

8\. Wyświetlić z bieżącego katalogu nazwy wszystkich plików:
\*.html, \*.htm, *.php, *.css, *.gif, *.jpg. (Użyj pętli for.)

    :::bash
    #!/bin/bash
    for nazwa in *.html *.htm *.php *.css *.gif *.jpg
    do
    echo $nazwa
    done
    exit 0

To samo, ale bez rozróżniania małych i dużych liter.

9\. Napisać skrypt wykonujący pętlę 15 razy i wypisujący za każdym
razem numer obiegu pętli. (Użyj pętli while.)

    :::bash
    #!/bin/bash
    n=1;
    # gdy warunek stanie się fałszywy to petla zakonczy dzialanie
    while [ $n -le 15 ]
    do
      echo "Petla wykonuje sie po raz: $n"
      n=$[n + 1]
    done
    exit 0

Ściąga z operatorów wykorzystywanych w warunkach:

<pre>-eq (==)    -ne (!=)   -lt (&lt;)
-le (&lt;=)    -gt (>)    -ge (>=)
</pre>

10\. Napisać skrypt sprawdzający, czy użytkownik, którego login został
podany jako parametr skryptu zalogował się. (Użyj pętli until.)

    :::bash
    #!/bin/bash
    until who | grep "$1" > /dev/null
    # gdy warunek stanie się prawdziwy to petla zakonczy dzialanie
    do
      sleep 60
    done
    echo -e \\a
    echo "$1 wlasnie sie zalogowal !!! "
    exit 0

11\. Napisać skrypt pytający się użytkownika co wybiera: kawe,
herbate, sok, quit. Po dokonaniu wyboru powinna się pojawić
informacja co zostało wybrane. Po wybraniu quit skrypt powinien
zakończyć działanie. (Użyj pętli select i instrukcji warunkowej case.)

    :::bash
    #!/bin/bash
    echo "Co wybierasz?"
    select x in kawe herbate sok quit
    do
      case $x in
        "kawe") echo "Wybrales kawe." ;;
        "herbate") echo "Wybrales herbate." ;;
        "sok") echo "Wybrales sok." ;;
        "quit") echo "Wybrales quit."; break ;;
        *) echo "Nic nie wybrales."
      esac
    done
    exit 0

12\. Zmienić nazwy plików i katalogów pisane dużymi literami na nazwy
pisane małymi literami.

    :::bash
    #!/bin/bash
    for nazwa in *
    do
      mv $nazwa $(echo $nazwa | tr '[A-Z]' '[a-z]')
    done
    exit 0

<!-- źródło: http://howtonode.org/node-for-everyday-things -->

13\. Przyjmujemy, że strona wydrukowanego tekstu zawiera około 350 słów.
Korzystając z programu *wc* napisać program wypisujący
ile będzie miał stron po wydrukowaniu stron plik tekstowy podany
jako pierwszy argument skryptu.

    :::bash
    #!/usr/bin/env bash
    let x=$(wc -w $1 | cut -d\  -f 1)/350
    echo "Liczba stron po wydrukowaniu $1: $x";

14\. Przykład z *xargs* i *find*:

    :::bash
    find -type f -print0 | xargs -0 egrep *pattern*

15\. Przykład z *while* i *find*:

    :::bash
    find $PWD/assets -name "*.css.scss" | while read i;
    do
      mv "$i" "${i%.css.scss}.scss";
    done
