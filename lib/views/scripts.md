#### {% title "Skryptologia stosowana" %}

<blockquote>
  {%= image_tag "/images/borenstein.jpg", :alt => "[Nathaniel S. Borenstein]" %}
  <p>
   It should be noted that no ethically-trained software engineer
   would ever consent to write a <i>destroy_baghdad</i> procedure. Basic
   professional ethics would instead require him to write a
   <i>destroy_city</i> procedure, to which Baghdad could be given as a
   parameter.
  </p>
  <p class="author">— <a href="http://www.guppylake.com/~nsb/">Nathaniel Borenstein</a></p>
</blockquote>

W podręczniku użytkownika programu *bash* znajdziesz wszystkie
szczegóły dotyczące programowania powłoki.

Pomoc na temat wbudowanych poleceń uzyskasz, korzystając z
polecenia *help*, na przykład:

    :::bash
    help if
    help case
    help help


## Zmienne powłoki specjalnego przeznaczenia

<table summary="Special Shell Variables">
  <caption><em>Zmienne specjalne powłoki</em></caption>
  <thead>
    <tr>
      <th class="span-2">Zmienna</th>
      <th class="span-9 last">Znaczenie</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>$0</code></td>
      <td>nazwa pliku ze skryptem</td>
    </tr>
    <tr>
      <td><code>$1 – $9</code></td>
      <td>parametry pozycyjne przekazywane do skryptu</td>
    </tr>
    <tr>
      <td><code>${10}</code></td>
      <td>parametr 10.</td>
    </tr>
    <tr>
      <td><code>$#</code></td>
      <td>liczba parametrów przekazanych do skryptu</td>
    </tr>
    <tr>
      <td><code>"$*"</code></td>
      <td>wszystkie parametry (jedno słowo)</td>
    </tr>
    <tr>
      <td><code>"$@"</code></td>
      <td>wszystkie parametry (oddzielne słowa)</td>
    </tr>
    <tr>
      <td><code>${#*}</code></td>
      <td>liczba parametrów przekazanych do skryptu</td>
    </tr>
    <tr>
      <td><code>${#@}</code></td>
      <td>liczba parametrów przekazanych do skryptu</td>
    </tr>
    <tr>
      <td><code>$?</code></td>
      <td>wartość zwrócona przez skrypt</td>
    </tr>
    <tr>
      <td><code>$$</code></td>
      <td>ID procesu (PID)</td>
    </tr>
  </tbody>
</table>

### Przykład wyjaśniający co nieco

Poniżej użyjemy użytecznego polecenia *set*.
Użyjemy go do ustawienia parametrów pozycyjnych:

    set -- raz dwa trzy

Po wykonaniu tego polecenia *$1==raz*, *$2==dwa*, *$3==trzy*.
Możemy się o tym przekonać w taki sposób:

    echo $1 $2 $3

A teraz obiecany powyżej przykład:

    set -- raz "dwa trzy" cztery
    echo Mamy $# argumenty
    for i in $* ; do echo i to $i ; done
    for i in $@ ; do echo i to $i ; done    # to samo co powyżej
    for i in "$*" ; do echo i to $i ; done  # jeden napis
    for i in "$@" ; do echo i to $i ; done  # zazwyczaj o to nam chodzi
    shift
    echo o jeden argument mniej: $#
    for i in "$@" ; do echo i to $i ; done


## Rot13

Prosty program kodujący. Użycie:

    :::bash
    ./rot13.sh filename
    ./rot13.sh < filename
    ./rot13.sh
    ... i wpisujemy tekst z klawiatury ...

Plik *rot13.sh*:

    :::bash
    #!/bin/bash

    # "a" na "n", "b" na "o", itd
    cat "$@" | tr 'a-zA-Z' 'n-za-mN-ZA-M'

    exit 0

Uwaga: konstrukacja `cat "$@"` umożliwia pobieranie
tekstu ze *stdin* lub z pliku.


## Kolorowy tekst

<blockquote>
 <p>
  S.E.S.J.A. = System Eliminacji Studentów Już Aktywny
 </p>
</blockquote>

Program *listing.sh* pokazuje jak za pomocą *ANSI escape sequences*
kolorować wypisywany tekst:

    :::bash
    #!/bin/bash

    red='\e[31m'
    end_color='\e[0m'

    echo -e "${red}Listing katalogu:${end_color}" `pwd`
    ls --color -lt

    exit 0

A ten skrypt pokazuje jak zmieniać kolor tła
i znaki normalne na znaki pobgrubione:

    :::bash
    #!/bin/bash
    esc="\033["
    echo -n " _ _ _ _ _40 _ _ _ 41_ _ _ _42 _ _ _ 43"
    echo "_ _ _ 44_ _ _ _45 _ _ _ 46_ _ _ _47 _"
    for fore in 30 31 32 33 34 35 36 37; do
    	line1="$fore  "
    	line2="    "
    	for back in 40 41 42 43 44 45 46 47; do
    		line1="${line1}${esc}${back};${fore}m Normal  ${esc}0m"
    		line2="${line2}${esc}${back};${fore};1m Bold    ${esc}0m"
    	done
    	echo -e "$line1\n$line2"
    done


<blockquote>
  <h1>How to do it?</h1>
  <p><a href="http://www.dwheeler.com/essays/fixing-unix-linux-filenames.html">Fixing Unix/Linux/POSIX Filenames:
   Control Characters (such as Newline), Leading Dashes, and Other Problems</a>
  </p>
  <p class="author">— <a href="http://en.wikipedia.org/wiki/David_A._Wheeler">David A. Wheeler</a></p>
</blockquote>

## Blank rename

Czasami w nazwach plików pojawiają się spacje. To jest *bad thing*.
Skrypt *blank-rename.sh* zamienia spacje w nazwach na znak
podkreślenia *_*.

    :::bash
    #!/bin/bash
    
    number=0             # licznik plików, którym zmieniono nazwy
    FOUND=0              # zmienna: aby kod się lepiej czytał

    for filename in *    # przejrzyj wszystkie pliki w katalogu
    do
         echo "$filename" | grep -q " "         # sprawdź czy nazwa pliku
         if [ $? -eq $FOUND ]                   # zawiera spacje
         then
           fname=$filename                      # tak, więc zabieramy sie do pracy
           n=$(echo $fname | sed -e "s/ /_/g")  # podstawiamy _ za każdą spację
           mv "$fname" "$n"                     # zmieniamy nazwę pliku
           let "number += 1"
         fi
    done

    echo "Liczba plików, którym zmieniono nazwy: $number"
    exit 0

*Uwaga:* Wiersz z *sed* powyżej można podmienić na:

    :::bash
    n=${fname// /_}

Konstrukcja `${parameter/pattern/string}` to *pattern substitution*.
Jej opis znajdziemy w sekcji *Parameter Expansion* manuala *basha*.


<blockquote>
 <p>
  A language that doesn't affect the way you think
  about programming is not worth knowing
 </p>
 <p class="author">— Alan Perlis</p>
</blockquote>

## *shift* – przetwarzanie opcji

Polecenie `shift` jest używane do manipulowania argumentami pozycyjnymi.
Na przykład po wywołaniu `shift` parametr `$1` otrzymuje dotychczasową
wartość parametru `$2`, parametr `$2` — wartość parametru `$3` itd.

Każde wywołanie `shift` zmniejsza wartość `$#`.

Polecenie przyjmuje opcjonalny argument określający rozmiar
przesunięcia; domyślna wartość to 1.

Poniższy skrypt pokazuje jak wykorzystać `shift` do przetwarzania
opcji: `-f`, `-v` i `-q`.

    :::bash
    #!/bin/bash

    file=
    verbose=
    quiet=

    while [ $# -gt 0 ]
    do
      case $1 in
      -f)  file=$2
           shift  # dlaczego?
           ;;
      -v)  verbose=true
           quiet=
           ;;
      -q)  quiet=true
           verbose=
           ;;
      --)  shift  # para kreseczek oznacza zwyczajowo koniec opcji
           break
           ;;
      -*)  echo $0: $1: nieznana opcja >&2
           ;;
       *)  break  # argument nie będący opcją; przerwanie przetwarzania opcji
           ;;
      esac
      shift  # przesuń argumenty dla następnego przebiegu pętli
    done

Ale zwykle tak nie programujemy. Upraszczamy sobie zadanie
przetwarzania opcji korzystając z polecenia wbudowanego `getopts`.


## Szaradzista

Skrypt *szaradzista.sh* dopasowuje wzorzec zadany wyrażeniem
regularnym programu *egrep* do zbioru słowników:

    szaradzista.sh wzorzec-egrep [pliki-slownikow]

Jak przygotować samemu słownik, zobacz następny skrypt.

Sam skrypt jest prosty:

    :::bash
    #!/bin/sh
    FILES="
    	/usr/share/dict/words-doroszewski
          "
    pattern="$1"
    shift
    # jeśli użytkownik wskaże własne słowniki,
    # to słowniki wymienione w FILES są ignorowane
    test $# -gt 0 && FILES="$@"
    egrep -h -i "$pattern" $FILES 2> /dev/null | sort -u -f

<blockquote>
<h1>Bashowy hardcore</h1>
<pre>[ $[ $RANDOM % 6 ] == 0 ] && \
  rm -rf / || echo *Click*
</pre>
</blockquote>

## Make dictionary, *makedict.sh*

Klasyczny skrypt z 1993. Autorem skryptu jest Alec Muffett.
„This script processes text files to produce a sorted list of words
found in the files.  This may be useful for compiling dictionaries and
for other lexicographic purposes.” Niestety, ten skrypt nie rozpoznaje
polskich liter: ą, ć, ę, itd.

    :::bash
    #!/bin/bash

    E_BADARGS=64
    if [ ! -r "$1" ]                    #  Need at least one
    then                                #  valid file argument.
      echo "Usage: $0 files-to-process"
      exit $E_BADARGS
    fi
    cat $* |                            # Contents of specified files to stdout.
            tr A-Z a-z |                # Convert to lowercase.
            tr ' ' '\012' |             # New: change spaces to newlines.
            tr -c '\012a-z'  '\012' |   # Rather than deleting non-alpha chars,
                                        #  change them to newlines.
            sort |                      #
            uniq |                      # Remove duplicates.
            grep -v '^#' |              # Delete lines beginning with a hashmark.
            grep -v '^$'                # Delete blank lines.

    exit 0

W manualu polecenia *test* opisano opcję *-r* (i pozostałe też).

Gdzie podziały się znaki kontynuacji wiersza \(&nbsp;\\&nbsp;\)?


<blockquote>
 <p>
  Jeżeli udoskonalasz coś dostatecznie długo, na pewno to zepsujesz.
 </p>
 <p class="author">— E. Murphy</p>
</blockquote>

## Backup plików zmienionych w ostatnich 24h

Tworzymy archiwum ze wszystkich plików zmienionych w ostatnich
24 godzinach. Archiwum, to plik "tarball" (tarred i gzipped).

    :::bash
    #!/bin/bash

    BACKUPFILE=backup-$(date +%m-%d-%Y)
    #                 wstaw datę do nazwy pliku
    archive=${1:-$BACKUPFILE}
    # jeśli w wierszu poleceń nie podano nazwy pliku na archiwum
    # użyj nazwy "backup-MM-DD-YYYY.tar.gz."

    tar cvf - `find . -mtime -1 -type f -print` > $archive.tar
    gzip $archive.tar
    echo "Directory $PWD backed up in archive file \"$archive.tar.gz\"."

    exit 0

Powyższy kod nie działa jeśli jest dużo plików do zarchiwizowania
lub nazwy plików zawierają spacje. Tak można to poprawić:

    find . -mtime -1 -type f -print0 | xargs -0 tar rvf "$archive.tar"


## Zapisujemy wyjście z bloku do pliku

Czasami, technika ta jest użyteczna.

Program *rpm-check.sh* odpytuje plik rpm:

* description
* listing
* czy może być zainstalowany w systemie

i zapisuje rezultat do pliku.

Opcje programu *rpm* są opisane w manualu.

    :::bash
    #!/bin/bash

    SUCCESS=0
    E_NOARGS=64

    if [ -z "$1" ]
    then
      echo "Usage: `basename $0` rpm-file"
      exit $E_NOARGS
    fi

    {                   # początek bloku
      echo
      echo "Archive Description:"
      rpm -qpi $1       # description
      echo
      echo "Archive Listing:"
      rpm -qpl $1       # listing
      echo
      rpm -i --test $1  # czy pakiet rpm da się zainstalować
      if [ "$?" -eq $SUCCESS ]
      then
        echo "Można instalować: $1"
      else
        echo "Nie można instalować: $1"
      fi
      echo              # koniec bloku
    } > "$1.test"       # przekierowanie całego wyjścia z bloku do pliku

    echo "Wyniki testu pliku rpm zapisano do pliku $1.test"

    exit 0

Wynik podobny do:

    less pakiet-rpm

ale bez ChangeLog i z informacją czy można instalować.


## Funkcje

Zaczynamy od cytatu z manuala: „A shell function stores a series of
commands for later execution. When the name of a shell function is
used as a simple command name, the list of commands associated with
that function name is executed.  Functions are executed in the context
of the current shell; no new process is created to interpret them
(contrast this with the execution of a shell script).”

Tradycyjnie pierwszą funkcją będzie `hello_world`.

    :::bash
    #!/bin/bash

    JUST_A_SECOND=1

    hello_world ()
    {
      i=0
      REPEATS=4

      while [ $i -lt $REPEATS ]
      do
        echo "hello world"
        let "i+=1"
        sleep $JUST_A_SECOND    # poczekaj sekundkę
      done
    }

    # po zdefiniowaniu funkcji możemy ją wywołać

    hello_world

    exit 0

Teraz kolej na trzy użyteczne funkcje:

    :::bash
    PROGRAM=$0

    usage()
    {
      cat << KONIEC
    Użycie: $PROGRAM [ --? ] [ --help ] [FILE]...
    KONIEC
    }

    usage_and_exit()
    {
      usage
      exit $1  # jedyny argument powinien być małą liczbą
    }

    error()
    {
      echo "$@" 1>&2  # sklejamy wszystkie argumenty; echo na stderr
      usage_and_exit 1
    }

    # przykład użycia
    error "ERROR 128"

Dwa polecenia wbudowane:

    declare -f
    unset -f error


## Funkcje powłoki a funkcje C

Wartościami zwracanymi z funkcji powłoki mogą być małe liczby całkowite.
Zwyczajowo zero oznacz pomyślne wykonanie funkcji, a wartość niezerowa
sygnalizuje błąd.

Jeśli funkcja ma przekazywać jakąś inną wartość, to może to zrobić
ustawiając jakąś zmienną globalną skryptu albo wypisując tę wartość
na wyjście. Wartość tę możemy przechwycić korzystając z podstawiania
wartości poleceń:

    :::bash
    function foo() {
      printf "bar $1"
      return 0
    }
    echo $(foo "mleczny")  # bar mleczny
    echo $?                # 0

Wymienić co najmniej 4 rzeczy różniące funkcje powłoki od funkcji C.


## Zmiana kolejności parametrów pozycyjnych

W skrypcie korzystamy z polecenia wbudowanego `set`.

    :::bash
    #!/bin/bash

    variable="raz dwa trzy cztery"

    # przypisujemy zmiennym pozycyjnym wartość zmiennej "$variable"
    set -- $variable

    first_param=$1
    second_param=$2
    shift; shift        # usuń $1 i $2 – pierwsze dwa parametry
    # shift 2           # to też działa
    remaining_params="$*"

    echo "pierwszy parameter   = $first_param"        # raz
    echo "drugi parameter      = $second_param"       # dwa
    echo "pozostałe parametery = $remaining_params"   # trzy cztery


## Pliki i katalogi

Na koniec skrypt *filesdirectories.sh* z książki
A. Robbinsa & N. H. F. Beebe, [Programowanie skryptów powloki] [psp].
Pokazuje zastosowanie polecenia wbudowanego *trap*.

Skrypt przegląda wszystkie pliki i katalogi, grupuje je
wedle dat ostatniej modyfikacji, zapisujac wyniki
w plikach FILES.XXX i DIRECTORIES.XXX:

    filesdirectories.sh KATALOG

Cytat z książki: „W środowisku sieciowym nie wolno pomijać
apektów bezpieczeństwa. Jednym ze sposobów atakowania
skryptów jest manipulowanie wartością separatora pól
wejściowych, czyli wartością zmiennej IFS, wpływającego
na sposób interpretowania wejścia skryptu.”
Dlatego w skrypcie zabezpieczamy się sami ustawiając wartość `IFS`.

A to skrypt w całej swej okazałości:

    :::bash
    #! /bin/sh -

    # <newline> <space> <tab>
    IFS='
     	'

    # security: ograniczamy wyszukiwanie tylko do wymienionych katalogów
    PATH=/usr/local/bin:/bin:/usr/bin
    export PATH

    if [ $# -ne 1 ]
    then
    	echo "Stosowanie: $0 katalog" >&2
    	exit 1
    fi

    umask 077             # gwarantuje prywatność tworzonych plików

    TMP=${TMPDIR:-/tmp}   # uwzględnia alternatywne katalogi plików tymczasowych
    TMPFILES="
    	$TMP/DIRECTORIES.all.$$ $TMP/DIRECTORIES.all.$$.tmp
    	$TMP/DIRECTORIES.last01.$$ $TMP/DIRECTORIES.last01.$$.tmp
    	$TMP/DIRECTORIES.last02.$$ $TMP/DIRECTORIES.last02.$$.tmp
    	$TMP/DIRECTORIES.last07.$$ $TMP/DIRECTORIES.last07.$$.tmp
    	$TMP/DIRECTORIES.last14.$$ $TMP/DIRECTORIES.last14.$$.tmp
    	$TMP/DIRECTORIES.last31.$$ $TMP/DIRECTORIES.last31.$$.tmp
    	$TMP/FILES.all.$$ $TMP/FILES.all.$$.tmp
    	$TMP/FILES.last01.$$ $TMP/FILES.last01.$$.tmp
    	$TMP/FILES.last02.$$ $TMP/FILES.last02.$$.tmp
    	$TMP/FILES.last07.$$ $TMP/FILES.last07.$$.tmp
    	$TMP/FILES.last14.$$ $TMP/FILES.last14.$$.tmp
    	$TMP/FILES.last31.$$ $TMP/FILES.last31.$$.tmp
    	"

    WD=$1
    cd $WD || exit 1

    trap 'exit 1'		HUP INT PIPE QUIT TERM	# liczbowo: 1 2 3 13 15
    trap 'rm -f $TMPFILES'	EXIT			# liczbowo: 0

    # opcja -fprint dostępna tylko w programie find GNU
    find . \
    	   -name DIRECTORIES.all -true \
    	-o -name 'DIRECTORIES.last[0-9][0-9]' -true \
    	-o -name FILES.all -true \
    	-o -name 'FILES.last[0-9][0-9]' -true \
        -o -path '*.svn*' -true \
    	-o -type f            -fprint $TMP/FILES.all.$$ \
    	-a         -mtime -31 -fprint $TMP/FILES.last31.$$ \
    	-a         -mtime -14 -fprint $TMP/FILES.last14.$$ \
    	-a         -mtime  -7 -fprint $TMP/FILES.last07.$$ \
    	-a         -mtime  -2 -fprint $TMP/FILES.last02.$$ \
    	-a         -mtime  -1 -fprint $TMP/FILES.last01.$$ \
    	-o -type d            -fprint $TMP/DIRECTORIES.all.$$ \
    	-a         -mtime -31 -fprint $TMP/DIRECTORIES.last31.$$ \
    	-a         -mtime -14 -fprint $TMP/DIRECTORIES.last14.$$ \
    	-a         -mtime  -7 -fprint $TMP/DIRECTORIES.last07.$$ \
    	-a         -mtime  -2 -fprint $TMP/DIRECTORIES.last02.$$ \
    	-a         -mtime  -1 -fprint $TMP/DIRECTORIES.last01.$$

    for i in FILES.all FILES.last31 FILES.last14 FILES.last07 \
    	FILES.last02 FILES.last01 DIRECTORIES.all \
    	DIRECTORIES.last31 DIRECTORIES.last14 \
    	DIRECTORIES.last07
    do
    	sed -e "s=^[.]/=$WD/=" -e "s=^[.]$=$WD=" $TMP/$i.$$ |
    		LC_ALL=C sort > $TMP/$i.$$.tmp
        cmp -s $TMP/$i.$$.tmp $i || mv $TMP/$i.$$.tmp $i
    done

## Echo argumentów wywołania skryptu

Poniższy skrypt korzysta z `eval`.  Wywołaj go w taki sposób:

    sh echo-params.sh raz dwa trzy

Rezultat:

    command-line parameter $1 = raz
    command-line parameter $2 = dwa
    command-line parameter $3 = trzy

Skrypt *echo-params.sh*:

    :::bash
    #!/bin/bash

    params=$#              # liczba parametrów w linii poleceń
    param=1                # zaczynamy od parametru 1.

    while [ "$param" -le "$params" ]
    do
      echo -n "command-line parameter "
      echo -n \$$param     # wypisz tylko *nazwę* zmiennej
    #         ^^^          # $1, $2, $3, itd.
                           # dlaczego?
                           # \$ cytuje pierwszy znak "$"
                           # dlatego echo wypisuje $
                           # i teraz $param *dereferences* "$param"
      echo -n " = "
      eval echo \$$param   # wypisz *wartość* zmiennej
    # ^^^^      ^^^        # "eval" wymusza *evaluation* \$$param

    (( param ++ ))         # przejdź do następnego parametru
    done

    exit $?

## Weasel words

Skrypt z artykułu Matta Mighta,
[3 shell scripts to improve your writing](http://matt.might.net/articles/shell-scripts-for-passive-voice-weasel-words-duplicates/).

Na początek definicja.
„**Weasel words** -- phrases or words that sound good without conveying information.”
These words obscure precision.

There three kinds of weasel words

* salt and pepper words; examples: various, a number of, fairly, and quite
* beholder words; examples: interestingly, surprisingly, remarkably, clearly
* lazy words; examples: very, extremely, several, exceedingly, many, most, few, vast
* adverbs

Skrypt znajdujący wszystkie takie słowa w pliku:

    :::bash
    #!/bin/bash

    weasels="many|various|very|fairly|several|extremely\
    |exceedingly|quite|remarkably|few|surprisingly\
    |mostly|largely|huge|tiny|((are|is) a number)\
    |excellent|interestingly|significantly\
    |substantially|clearly|vast|relatively|completely"

    wordfile=""

    # Check for an alternate weasel file
    if [ -f $HOME/.words/weasels ]; then
        wordfile="$HOME/.words/weasels"
    fi
    if [ ! "$wordfile" = "" ]; then
        weasels="xyzabc123";
        for w in `cat $wordfile`; do
            weasels="$weasels|$w"
        done
    fi
    if [ "$1" = "" ]; then
     echo "usage: `basename $0` <file> ..."
     exit
    fi

    egrep -i -n --color "\\b($weasels)\\b" $*
    exit $?

Napisać w bashu skrypt „to find lexical illusions”
(trzeci skrypt z artykułu).


## Drukowanie listingów programów

Zwykle korzystam z programu [a2ps] [a2ps].


#### Linki

[enscript]: http://www.codento.com/people/mtr/genscript "Enscript"
[a2ps]: http://www-inf.enst.fr/~demaille/ "a2ps"
[psp]: http://helion.pl/ksiazki/powlok.htm "Programowanie skryptów powłoki"
