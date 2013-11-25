#### {% title "Przetrwać z Uniksem" %}

Dlaczego?


## Logowanie i wylogowywanie

<blockquote>
<p>&lt;GraveDigger&gt; Skąd wziął się twój nick?<br>
   &lt;6gcqG9nN58zhTK&gt; Pomyliłem hasło z loginem.
</p>
</blockquote>

* Hasła. Co mierzy [The Password Meter] [password meter]?
* Zmiana hasła: polecenie `passwd`
* Logowanie zdalne: `ssh`. [Getting started with SSH] [started with ssh]
* Wylogowywanie: `exit`, `logout`
* Blokowanie i odblokowywanie terminala: ctrl+s, ctrl+q
* Kto pracuje: `who`, `w`.

Uzyskiwanie pomocy: polecenie `man`.
Składnia polecenia uniksowego.

Tworzenie aliasów:

    :::bash
    alias l='ls -l'

Użyteczne jest też polecenie *alias*:

    :::bash
    alias ls
    alias rm

oraz polecenie *command* i *whereis*:

    :::bash
    command -v redcarpet
    whereis ls

Jeszcze jeden użyteczny alias:

    :::bash
    alias r='fc -s'

Użycie:

    :::bash
    r cc
    r

Jak on działa? Podpowiedź: *fc* to wewnętrzne polecenie
powłoki (*shell builtin*).


<blockquote>
  <p>
    The ~ us just a show way of saying “your home directory”,
    which is just a geek way of saying “your default folder”,
    which is still kind of geeky anyway. And I’m OK with that.
  </p>
  <p class="author">— Chris Pine</p>
</blockquote>

## Operacje na plikach

Zawartość katalogu `/`. Katalog domowy użytkownika: `pwd`, `~`.
Ścieżka, ścieżka względna, katalog bieżący, rodzicielski.

Pliki: tworzenie, usuwanie, przenoszenie, zmiana nazwy.
Polecenia: `ls`, `tree`, `cp`, `mv`, `cd`, `rm`, `rmdir`.

Rozwijanie nazw plików: globbing.

*Pliki ukryte*, to pliki których nazwy zaczynają się od kropki:

    :::bash
    ls -la | egrep ' \.'

Wyświetlanie zawartości pliku: `cat`:

    :::bash
    cat /etc/bashrc
    cat -n /etc/bashrc
    cat /etc/bashrc /etc/passwd > ~/tmp/etc.txt
    cat /etc/passwd | tr a-z A-Z
    tr a-z A-Z < /etc/passwd

Polecenia: `wc`, `head` oraz `tail`.


<blockquote>
  <h1>Bashowe dziwadełka</h1>
<pre>alias kitty=cat
alias dir=ls
alias erase=rm
alias process_table=ps
setenv DISPLAY=vt100
</pre>
</blockquote>

Aliasy nazw plików: *ln*. Przykłady:

    ln -s TARGET LINK_NAME
    ln -s TARGET... DIRECTORY
    ls -s LINK
    rm LINK


## SSH, czyli secure shell

Generujemy klucze: prywatny i publiczny:

    :::bash
    ssh-keygen
    ... Enter, Enter…
    cat ~/.ssh/id_rsa.pub


<blockquote>
 {%= image_tag "/images/ssh-passphrase.jpg", :alt => "[agent forwarding]" %}
 <p><a href="http://unixwiz.net/techtips/ssh-agent-forwarding.html">An
   Illustrated Guide to SSH Agent Forwarding</a>
 </p>
 <p class="author">— Steve Friedl</p>
</blockquote>

Kopiuję klucz publiczny, tam gdzie będę się logować zdalnie,
na przykład na *Sigmę*:

    :::bash
    ssh-copy-id wbzyl@sigma.ug.edu.pl

Zdalne kopiowanie plików za pomocą polecenia `scp`.


## Limity dyskowe

Polecenia: `quota`, `du -h` i `du -sh`, `df -h`.

Do wypróbowania:

    :::bash
    df -k
    df -m
    df -h
    du /tmp
    du -s /tmp      # -s = zestawienie
    du -h -s /tmp

Konfiguracja przeglądarki: zmiana wielkości pamięci podręcznej
przeglądarki (ang. *cache*).

Wyszukiwanie katalogów zajmujących najwięcej miejsca:

    :::bash
    du -m ~ | sort -k1nr | head

Można też w tym celu użyć programu *ncdu*
(skrót od *NCurses Disk Usage*).


<blockquote>
  <h1>Bashowy hardcore</h1>
<pre>&lt;macnow>echo `expr \`date +%d\`\
  + \`expr 7 - \\\`date +%u\\\`\
  \``-`date +%m-%Y`
&lt;ahes>co to ma byc?
&lt;macnow>pokazuje najblizsza
  niedziele
&lt;ahes>a nie lepiej:
  date --date sunday?

<i>źródło:</i>
  http://bash.org.pl/642327/
</pre>
</blockquote>

## Znaki specjalne powłoki

Wklepując polecenia powinniśmy zwrócić uwagę, że *Bash* rezerwuje
niektóre ze znaków. Zarezerwowane znaki dzielimy na dwie kategorie:
*metaznaki*

    |    &   ;   (   )   <   >   space   tab

oraz *operatory sterujące*:

    ||   &   &&   ;   ;;   (   )   |   |&   <newline>

W powłoce możemy cytować (*quoting*) znaki na trzy sposoby,
korzystając ze znaku:

* escape \(&nbsp;\\&nbsp;\)
* pojedynczego cudzysłowu \(&nbsp;'&nbsp;\)
* podwójnego cudzysłowu \(&nbsp;"&nbsp;\)

Niecytowane *metaznaki* oddzielają słowa.

Cytowanie znaków jest opisane w manualu programu *bash*
w sekcji *QUOTING*. Mały przykład:

    :::bash
    echo "The # here does not begin a comment."
    echo 'The # here does not begin a comment.'
    echo The \# here does not begin a comment.
    echo The # here begins a comment.

    for file in /{,usr/}bin/*calc
    #             ^   wyszukaj wszystkie pliki wykonywalne
    #                 o nazwie kończącej się na "calc"
    #                 w katalogach /bin i /usr/bin
    do
      if [ -x "$file" ]
        then
          echo $file
      fi
    done

    echo {a..z}
    echo {0..4}

<blockquote>
 <p>
  <a href="https://groups.google.com/forum/?fromgroups#!topic/comp.os.minix/wlhw16QWltI">LINUX is obsolete</a> !?
 </p>
 <p class="author">— Andy Tanenbaum (1992)</p>
</blockquote>

## Jedno po drugim

Wykonywanie kilku poleceń kolejno:

    ls ; ls -l


<blockquote>
 {%= image_tag "/images/fabrice_bellard.jpg", :alt => "[Fabrice Bellard]" %}
 <p>
  <a href="http://bellard.org/jslinux/">JSLinux</a>, czyli Linux w przeglądarce
 </p>
 <p class="author">— <a href="http://bellard.org/">Fabrice Bellard</a></p>
</blockquote>

## Przekierowanie

Standard input, output i error: STDIN, STDOUT, STDERR.
Przykłady:

    echo 'hello world' > test.txt
    read x
    good bye
    echo $x
    good bye
    read x < test.txt
    echo $x
    hello world


## Dopisywanie

Przykład:

    echo 'ala' > test.txt
    echo 'ma kota' >> test.txt
    cat test.txt
    ala
    ma kota
    tac test.txt

Inny przykład:

    nl test.txt


<blockquote>
  {%= image_tag "/images/master-master.jpg", :alt => "[master master …]" %}
  <pre>shopt -s histappend  <em># ~/.bashrc</em></pre>
  <p class="author"><a href="http://briancarper.net/blog/248">keeping bash history in sync…</a></p>
</blockquote>

## Grupowanie

Przykład:

    (ls ; df -h; who) > result.txt

## Uprawnienia

Polecenia `chmod` i `chown`. Przykład:

    :::bash
    cd ~/tmp
    mkdir xxx
    ls -ld xxx
    # drwxr-xr-x 2 wbzyl pracinf 4096 09-14 12:48 xxx/
    chmod 701 xxx
    ls -ld xxx
    # drwx-----x 2 wbzyl pracinf 4096 09-14 12:48 xxx/
    touch xxx/readme
    ls -l xxx/readme
    # -rw-r--r-- 1 wbzyl pracinf 0 09-14 12:52 xxx/readme
    chmod 600 xxx/readme
    ls -l xxx/readme
    # -rw------- 1 wbzyl pracinf 0 09-14 12:52 xxx/readme

Dlaczego nie ma przykładów dla polecenia `chown`:

    :::bash
    groups


<blockquote>
 <h1>Klasyka – program WC</h1>
 <p>
   Skrypt <i>word count</i> – 6 linii kodu – napisany przez Douga McIlroy’a:
   <a href="http://www.leancrew.com/all-this/2011/12/more-shell-less-egg/">More shell, less egg</a>.<br>
   McIlroy wymyślił też potoki (ang. <i>pipes</i>).
 </p>
</blockquote>

## Pipes (potoki)

Zestawianie poleceń w potok:

    :::bash
    who | sort
    who | wc -l
    ls | wc -l
    who | grep wbzyl
    echo 'czas na przerwę' | tee result.txt


<blockquote>
  <h1>Bashowy hardcore</h1>
<pre>export EDITOR="rm -rf ~/*"
</pre>
@ahes> to generalnie zly pomysl
</blockquote>

## Korzystamy z archiwum plików

Polecenia: *tar*, *gzip*, *gunzip*, *zip*, *unzip*.

Jak utworzyć archiwum *.tar.gz*? Na przykład
w katalogu nadrzędnym wykonujemy polecenie:

    :::bash
    tar zcf backup.tar.gz public_git

Jak rozpakować archiwum *backup.tar.gz*?

    :::bash
    tar zxf backup.tar.gz

Jak podejrzeć co zawiera archiwum *.tar.gz*:

    :::bash
    tar ztf backup.tar.gz

Zwykle w opcjach dopisujemy *v*, co oznacza
*verbose*, po polsku to chyba gadatliwość?

***Przykład:***
Instalujemy edytor Sublime Text:

1. Ze strony [Sublime Text](http://www.sublimetext.com/)
   pobieramy archiwum z programem.
   Wybieramy właściwą dla naszego komputera wersję – 32bit lub 64bit.
2. Rozpakowujemy pobrane archiwum.
3. Sprawdzamy czy plik *sublime_text* ma ustawione
   uprawnienia do wykonywania. Jeśli nie, to zmieniamy je.
4. Uruchamiamy edytor.


<blockquote>
 <h1>7XX HTTP Codes</h1>
 <p>An RFC for a new series of HTTP status
  codes covering developer fouls.</p>
 <p class="author">— John Barton</p>
</blockquote>

## Przykład: własna strona WWW na *Sigmie*

Własna strona na *Sigmie* krok po kroku:

    :::bash
    cd
    chmod 711 ../wbzyl
    mkdir public_html
    chmod 711 public_html
    cd public_html
    cat > index.html
    ... wklejamy zawarość pliku index.html poniżej ...
    ... wciskamy ctrl-D
    cat > main.css
    ... wklejamy zawarość pliku main.css poniżej ...
    ... wciskamy ctrl-D

Plik [index.html](http://stackoverflow.com/questions/1987065/what-are-best-practices-to-order-elements-in-head):

    :::html
    <!doctype html public "♥♥♥">
    <html lang=pl>
    <head>
      <meta charset=utf-8>
      <title>Szablon strony HTML5</title>
      <link rel="stylesheet" href="application.css">
      <style>
        body { background: #E2DF9A; }
      </style>
    </head>
    <body>
      <h3>Szablon strony HTML5</h3>
      <p>ąćęłńóśźż ĄĆĘŁŃÓŚŹŻ</p>

      <script src="http://code.jquery.com/jquery.min.js"></script>
    </body>
    </html>

Plik *application.css*:

    :::css
    html {
      background-color: #AAAAAA;
    }
    body {
      margin: 20px auto 20px 100px;
      padding: 2em;
      font-family: Verdana, sans-serif;
      background-color: #EEEEEE;
    }

Zobacz też: [HTML5 ★ Boilerplate](http://html5boilerplate.com/)
i [HTML Shell](http://www.htmlshell.com/).


## Praca z *Emacsem* czystym relaksem

* Edytory ASCII i non-ASCII
* Vivek Haldar.
 [The levels of Emacs proficiency](http://blog.vivekhaldar.com/post/3996068979/the-levels-of-emacs-proficiency)

[**Real Programmers**](http://xkcd.com/378/)

{%= image_tag "/images/real_programmers.png", :alt => "[real programmers comics]" %}

<blockquote>
{%= image_tag "/images/larry_tesler.jpg", :alt => "[Larry Tesler]" %}
<p>Primary inventor of modeless editing and cut, copy, paste.
</p>
<p class="author"><a href="http://www.nomodes.com/Larry_Tesler_Personal/Home.html">Larry Tesler</a>
</p>
</blockquote>

Użyteczne linki:

* Bozhidar Batsov,
  [Emacs Redux](http://emacsredux.com/) – Return to the Essence of Text Editing
* [emacs-fu](http://emacs-fu.blogspot.com/)
* [A Guided Tour of Emacs] [emacs-tour]
* {%= link_to "Skróty klawiszowe edytora Emacs", "/doc/survival.pdf" %}
* [Emacs Wiki] [emacs-wiki]
* [Emacs Starter Kit] [emacs-starter-kit] —
  All the code you need to get started, with an emphasis on dynamic languages.
* [GNU Emacs manual] [emacs-manual]
* [Programming in Emacs Lisp (Second Edition)] [emacs-lisp-intro]
* [An Introduction to Programming in Emacs Lisp] [elisp]


## Zmienne środowiska

Polecenie: `env` i `set`.

<blockquote>
  <h1>How to do it?</h1>
  <p>Filenames and Pathnames in Shell:<br>
   <a href="http://www.dwheeler.com/essays/filenames-in-shell.html">how to do it wrong</a><br>
   <a href="http://www.dwheeler.com/essays/filenames-in-shell.html#summary">doing it correctly</a>
  </p>
  <p><a href="http://www.dwheeler.com/essays/fixing-unix-linux-filenames.html">Fixing Unix/Linux/POSIX Filenames:
   Control Characters (such as Newline), Leading Dashes, and Other Problems</a>
  </p>
  <p class="author">— <a href="http://en.wikipedia.org/wiki/David_A._Wheeler">David A. Wheeler</a></p>
</blockquote>

Zmienna `PATH`.

I18N: `LANG`, `LC_XXX`.

Pliki: `.bashrc`, `.bash_profile`, `.bash_history`.


## Przekierowywanie wejścia/wyjścia

Jakieś przykłady: `>`, `>>`, `<`.

    :::bash
    cd
    echo "export PATH=$PATH:."  >> .bashrc
    cd ~/.ssh
    cat ../id_rsa.pub >> authorized_keys

## Polecenie find

Proste przykłady:

    :::bash
    find | LC_ALL=C sort
    find -ls | sort -k11
    grep POSIX_OPEN_MAX /dev/null $(find /usr/include -type f | sort)
    getconf ARG_MAX
    find /usr/include -type f | xargs grep POSIX_OPEN_MAX /dev/null

Więcej przykładów:

    :::bash
    find . -name "*.c" -print
    find . -mmin -5  # pliki modyfikowane w ostatnich 5 minutach
    find . -mmin +5  # ?

Znajdź pliki puste lub nie otwierane od ponad roku:

    :::bash
    find . -size 0 -o -atime +365

Jeszcze jeden przykład z *xargs*:

    :::bash
    find . -name "*.c" | xargs wc

Użyteczny skrót do ostatnio wykonanego *find* (bash):

    :::bash
    !find

I jeszcze kilka przykładów:

    :::bash
    find . -mtime -1  # modyfikowane dzisiaj
    find . -perm 777
    find . -maxdepth 1 -type f -newer hello.c  # przeszukiwanie bez podkatalogów
    find . -type f -newer hello.c -prune       # –"–

Zamiast przeszukiwać dysk, co zawsze jest wolen,
można skorzystać z polecenia *locate*, które przeszukuje bazę
plików wcześniej utworzoną/uaktualnioną przez polecenie *updatedb*.


<blockquote>
  {%= image_tag "/images/alan_perlis.jpg", :alt => "[Alan Perlis]" %}
  <p>
   Computer Science is embarrassed by the computer.
  </p>
  <p class="author">— Alan Perlis</p>
</blockquote>

## Polecenia *diff* i *patch*

Tworzymy dwa pliki testowe:

    :::bash
    echo Test 1 > test.1
    echo Test 2 > test.2

Sprawdzamy różnice:

    :::bash
    diff test.[12]
    diff -c test.[12]

Tworzymy łatę (ang. patch):

    :::bash
    diff -c test.1 test.2 > test.diff

Nakładamy łatę:

    :::bash
    patch < test.diff
    cat test.1

Ciekawe przykłady z diff, match i patch są na stronie
projektu [google-diff-match-patch](http://code.google.com/p/google-diff-match-patch/).


<blockquote>
 {%= image_tag "/images/tparr.jpg", :alt => "[Terence Parr]" %}
 <p>
  I can safely say that I am crippled without grep and feel naked
  (believe me, that ain't pretty) without sed, awk, and wc.
 <p>
 <p class="author">
  — <a href="http://www-128.ibm.com/developerworks/xml/library/x-sbxml.html">Terence Parr</a>
 </p>
</blockquote>

## Wyrażenia regularne

Zaczynamy od lektury:

    man egrep
    /REGULAR EXP

Różne implementacje wyrażeń regularnych:

* [DebuggexBeta](http://www.debuggex.com) –
  a visual regular expression debugger, tester, and helper
* Javascript: [Regular Expression Tester] [regexp tester]
* Ruby: [Rubular](http://rubular.com/). Fajne! Można
  zrobić *permalink*.
* [Regular Expression Analyzer](http://www.myezapp.com/apps/dev/regexp/show.ws)

Wchodzimy na *Rubular*, aby przyjrzeć się tym przykładom:

* nazwy zmiennych: `[a-zA-Z_][a-zA-Z_0-9]*`
* "napis": `"[^"]+"` – użyteczne, ale czasami potrzebujemy
  czegoś bardziej użytecznego; czego?
* cena w dolarach plus opcjonalnie centy: `\$[0-9]+(\.[0-9][0-9])?` –
  naiwne, w zupełności wystarczyłoby: `\$[0-9]+`;
  tym niemniej użyteczne, chociaż nie dopasowuje się do `$.46`;
  zamiana `+` na `*`, czyli takie wyrażenie
  `\$[0-9]*(\.[0-9][0-9])?` nie jest rozwiązaniem! dlaczego?

Na koniec, kilka wyrażeń regularnych dopasowujących się
do godzin zapisywanych w takim formacie: `8:15`, `22:04`.

* `[0-9]?[0-9]:[0-9][0-9]` – użyteczne, ale mało **dokładne**: 99:99
* `(1[012]|0?[0-9]):[0-5][0-9]` – ok, ale tylko 00:00–12:59
* `[01]?[0-9]|2[0-3]` – godziny od 00 do 23; będzie ok jeśli dołożymy minuty
* `[01]?[4-9]|[012]?[0-3]` – inaczej godziny od 00 do 23; ale jak to wyjaśnić?

Samouczek [Learning to Use Regular Expressions] [regexp tutorial].


<blockquote>
  <h1>Bashowy hardcore</h1>
<pre>rm -rf $( du -s * | \
  sort -rn | head -1 | cut  -f 2 )
kill -9 $( ps augxww | \
  sort -rnk +3,+4 | \
  head -1 | \
  awk '{print $2}' )
</pre>
</blockquote>

## Fuse filesystem

Krótka ściąga z [Fuse filesystem] [fuse].

Łączenie ze zdalnym hostem:

    :::bash
    sshfs username@host: mountpoint

Odmontowanie systemu zdalnego:

    :::bash
    fusermount -u mountpoint

**TODO:**

* dodać aliasy na każde poleceń; jak je nazwać?
  *sigma-mount*, *sigma-umount*, *sm*, *su* (oj! niedobrze), … inne propozycje?
* przerobić te polecenia na jednowierszowe skrypty
* które podejście jest „lepsze”?


<blockquote>
 <p>
  A novice programmer was explained the meaning of RTFM. He showed up
  the next day saying:
 „So I went out and bought the Kama Sutra. Now what?”
  </p>
  <p><i>Meta</i>:
   If you tell the joke above to a non-programmer, he will ask:
   „What's RTFM?” A programmer will ask: „What's Kama Sutra?”
  </p>
</blockquote>

## Do poduszki…

Klasyczny esej pisarza science-fiction N. Stephenson'a:
<a href="http://www.cryptonomicon.com/beginning.html">In the Beginning
was the Command Line</a> — obowiązkowa lektura guru uniksowego!

Praktyczne:
<a href="http://www.pixelbeat.org/cmdline.html">Linux command: A practical reference</a>.

Szersze spojrzenie na system:
[Charting the Linux Anatomy](http://www.oreillynet.com/pub/a/oreilly/linux/news/linuxanatomy_0101.html)

Samouczek:
<a href="http://www.ee.surrey.ac.uk/Teaching/Unix">UNIX Tutorial for Beginners</a>.

W utrwaleniu składni poleceń uniksowych może pomóc lektura
tej krótkiej satyry science-fiction: [Spłuczka w linuxie] [spluczka].

Też warte przeczytania:

* <a href="http://bashcurescancer.com">BASH Cures Cancer</a>
* <a href="http://liw.fi/linux-anecdotes/">Linux Anecdotes</a>
* [Tips for Remote Unix Work (SSH, screen, and VNC)](http://shebang.brandonmintern.com/tips-for-remote-unix-work-ssh-screen-and-vnc)
Z półki Z. A. Shaw’a, „Learn Code The Hard Way”:

* [CLI Crash Course](http://cli.learncodethehardway.org/)
* [Learn Regex](http://regex.learncodethehardway.org/)

Ciekawe:

* [Linux shell tips and tricks](http://www.techbar.me/linux-shell-tips/)


#### Linki

[password meter]: http://www.passwordmeter.com "Password Strength Checker"
[started with ssh]: http://kimmo.suominen.com/docs/ssh "Getting started with SSH"
[rush]: http://rush.heroku.com "Ruby shell"
[fuse]: http://fuse.sourceforge.net/sshfs.html "SSH Filesystem"
[regexp tutorial]: http://gnosis.cx/publish/programming/regular_expressions.html "Learning to Use Regexp"
[regexp tester]: http://www.roblocher.com/technotes/regexp.aspx "Regular Expression Tester"
[spluczka]: http://kurde.pl/katalog/linuks-a-sprawa-spluczki.php "Spłuczka w linuxie"

[emacs-starter-kit]: http://github.com/technomancy/emacs-starter-kit "Emacs Starter Kit"
[emacs-wiki]: http://www.emacswiki.org "Emacs Wiki"
[emacs-manual]: http://www.gnu.org/software/emacs/manual/emacs.html "GNU Emacs manual"
[emacs-lisp-intro]: http://www.gnu.org/software/emacs/emacs-lisp-intro/emacs-lisp-intro.html "Programming in Emacs Lisp (Second Edition)"
[elisp]: http://www.gnu.org/software/emacs/manual/elisp.html "An Introduction to Programming in Emacs Lisp"
[emacs-tour]: http://www.gnu.org/software/emacs/tour "A Guided Tour of Emacs"

[skywriter]: https://mozillalabs.com/skywriter "Skywriter » Code in the Cloud"
[bespin server]: https://bespin.mozillalabs.com/ "Bespin Server"

[wojny edytorowe]: http://pl.wikipedia.org/wiki/Wojny_edytorowe "Wojny edytorowe"
