#### {% title "Git jest git" %}

<blockquote>
  {%= image_tag "/images/the_thinker.jpg", :alt => "[The Thinker]" %}
  <p>In the emerging, highly programmed landscape ahead, you will
  either create the software or you will be the software. It’s really
  that simple: <b>Program, or be programmed</b>. Choose the former, and you
  gain access to the control panel of civilization. Choose the latter,
  and it could be the last real choice you get to make.
  </p>
  <p class="author">— Douglas Rushkoff</p>
</blockquote>

Do czego służy system *Git*? Odpowiedź znajdziemy na stronie domowej projektu
[Git - Fast Version Control System] [git home].

Obejrzenie wystąpienia autora Linuksa:
[Tech Talk: Linus Torvalds on git] [torvalds on git]
dla pracowników Google powinno wyjaśnić dlaczego powstał Git
i dlaczego Google więcej już nie poprosi LT o wygłoszenie referatu.

Randal L. Schwartz “Guru-On-Demand” jest autorem najlepszego
wprowadzenia do języka (Perl) jakie czytałem. Jego
screencast [Schwartz on Git] [] jest wart obejrzenia.
Można się z niego dowiedzieć jak Git może zmienić życie
programisty.

Tom Preston-Werner w [The Git Parable] [the-git-parable] napisał:
„Most people try to teach Git by demonstrating a few dozen commands
and then yelling “tadaaaaa.” I believe this method is flawed. Such
a treatment may leave you with the ability to use Git to perform
simple tasks, but the Git commands will still feel like magical
incantations.”
Przypowieść ta opisuje perypetie czeladnika tworzącego system
gitopodobny od podstaw.

Też należy obejrzeć: S. Chacon, [Git in One Hour] [git-in-one-hour].


<blockquote>
 <p>
  Podchodzi informatyk do fortepianu i ogląda go wnikliwie:
  — Hmm, tylko 84
  klawisze, z czego 1/3 funkcyjnych, wszystkie nieopisane,
  chociaż… shift naciskany nogą. Oryginalnie.
 </p>
</blockquote>

## Konfiguracja

Pracę z gitem zaczynamy od przedstawienia się:

    git config -l
    git config --global user.name "Wlodek Bzyl"
    git config --global user.email "matwb@univ.gda.pl"

po czym natychmiast sprawdzamy, czy Git zrozumiał kim jesteśmy:

    cat ~/.gitconfig

Łatwiej będzie nam porozumiewać się z Gitem, po dodaniu do pliku
konfiguracyjnego kilku skrótów:

    git config --global alias.br    "branch -a"
    git config --global alias.co    "checkout"
    git config --global alias.ci    "commit"
    git config --global alias.df    "diff"
    git config --global alias.lg    "log -p"
    git config --global alias.lol   "log --graph --decorate --pretty=oneline --abbrev-commit"
    git config --global alias.lola  "log --graph --decorate --pretty=oneline --abbrev-commit --all"
    git config --global alias.ls    "ls-files"
    git config --global alias.st    "status"

Ułatwimy sobie śledzenie zmian w kodzie jeśli je podkolorujemy:

    git config --global color.branch auto
    git config --global color.diff auto
    git config --global color.status auto

Jeszcze trochę ręcznych robótek, bo czemu nie, w pliku konfiguracyjnym
i oto rezultat — mój plik *~/.gitconfig* w całej okazałości:

    :::ini
    [user]
      email = matwb@univ.gda.pl
      name = Wlodek Bzyl

    [color]
      branch = auto
      diff = auto
      status = auto

    [color]
      ui = true

    [core]
      whitespace=fix,-indent-with-non-tab,trailing-space,cr-at-eol

    [alias]
      br = branch -a
      co = checkout
      ci = commit
      ...

I już po konfiguracji.

Wygodnie też jest mieć kilka aliasów w bashu.
Dopisujemy je do pliku *~/.bashrc*:

    :::bash
    alias gb='git branch -a'
    alias gl='git log -p'
    alias gt='git status'


### Nazwa gałęzi w prompt basha

Po sklonowaniu repozytorium samego Gita:

    git clone git://git.kernel.org/pub/scm/git/git.git

z katalogu *contrib/completion]* kopiujemy plik (*Fedora*):

    cp git-completion.bash /etc/profile.d/git-completion.sh

Następnie do pliku *.bashrc* dopisujemy, coś w stylu:

    :::bash
    if [ "$PS1" ]; then
      [ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \w]"' $(__git_ps1 "(%s)")'"\n→ "
      export PS1
    fi

Teraz powinniśmy mieć taki „znak zachęty”:

    [wbzyl@localhost ~/github.com/git] (master)
    →


<blockquote>
 <h1>Zasłyszane</h1>
 <p>
  Q: Couldn't this be done using a Git repo?<br/>
  A: What's that “Git” thing?
  Diversion system is developed using “Mother Driven Development”.
  With this system, you keep asking yourself:
  <em>Would my mother understand this?</em>
 </p>
 <p>
  Call it the poor man’s approach to usability.
 </p>
</blockquote>

## Podstawy

### Zakładamy repozytorium

Pierwsze repozytorium, zgodnie ze starą uniksową tradycją
powinno mieć nazwę *hello-world*:

    mkdir hello-world
    cd hello-world
    git init
    touch .gitignore README.md Makefile hello.c
    git add .
    git commit -m "pierwsza wrzutka"

Każdy plik w systemie Git może mieć aż trzy życia:
jedno w „katalogu roboczym”, drugie w „staging area” i trzecie w „repozytorium”:

    git diff           # shows you the differences from staging area to working tree
    git diff HEAD      # shows you the differences from repo to working tree
    git diff --cached  # shows you the differences from repo to staging area

Do czego służy drugie życie opisał Ryan Tomayko na swoim blogu,
[The Thing About Git] [tomayko about git].


<blockquote cite="http://www.gitready.com/beginner/2009/01/18/the-staging-area.html">
  {%= image_tag "/images/staging_area.png", :alt => "[working tree / index / trunk]" %}
</blockquote>

Na *staging area* (punkt etapowy, punkt tranzytowy) mówimy też
*indeks*; *working tree* to katalog roboczy (kopia robocza);
a *repozytorium* to *repozytorium*.


### Git na co dzień

Zazwyczaj praca z repozytorium wygląda tak:

    ... edycja, edycja ...
    git status
    git add [nazwy plików albo .]
    git commit -m "jakiś wpis do loga"
    ... edycja, edycja ...
    git status
    ... i tak w kółko ...


<blockquote>
 <p>
  Przychodzi administrator rano do pracy, siada do komputera, aby
  zobaczyć co się działo w nocy i śpiewa: <em>Chcę oglądać twoje logi,
  logi, logi, logi…</em>
 </p>
</blockquote>


### Przeglądanie logów i nie tylko

Użytecznymi programami są przeglądarki repozytoriów.
Na *Sigmie* jest zainstalowana przeglądarka *gitk*.

W logach zapisane są „commit messages”, z których łatwo się
wyczytać co zostało zrobione i przez kogo. Dlatego logi są często
przeglądane. Kilka przykładów:

    :::bash
    git log
    git log -p
    git log --grep 'important'
    git log -Sword                       # search thru history
    git log --pickaxe-regex -S'\bword\b' # with regexp
    git log origin/master..HEAD

Repozytorium git składa się z czterech rodzajów obiektów:
**commit**, **tree**, **blob** i **tag**.
Powyższe polecenia z *log* służą tylko do przeglądania
obiektów typu *commit*.

{%= image_tag "/images/commits.png", :alt => "[git log]" %}

Źródło, S. Chacon, [Pro Git, What a Branch Is](http://progit.org/book/ch3-1.html).


Polecenie `git show` służy do wypisywania zawartości obiektów
dowolnego typu. Czasami używamy bardziej specjalizowanych
poleceń:

    :::bash
    git ls-tree SHA1               # obiekt tree
    git show -s --pretty=raw SHA1  # obiekt commit
    git cat-file tag v1.0          # obiekt tag

Obiekty są powiązane „wskaźnikami” SHA1. Tak to powiązanie możemy
sobie wyobrażać:

{%= image_tag "/images/objects-example.png", :alt => "[Powiązania między obiektami]" %}

Źródło, [Git Community Book](http://book.git-scm.com/1_the_git_object_model.html).


### Undo różnych rzeczy

Zmieniamy **ostatni** wpis w logu:

    git commit --amend

Unstaging staged plik:

    git add .
    git status
    # On branch master
    # Changes to be committed:
    #   (use "git reset HEAD <file>..." to unstage)
    #
    #       modified:   README.md

Wycofanie zmian w edytowanym pliku:

    # Changed but not updated:
    #   (use "git add <file>..." to update what will be committed)
    #   (use "git checkout -- <file>..." to discard changes in working directory)
    #
    #       modified:   README.md

Undo merge:

    git reset --hard ORIG_HEAD


## Branching

*Pytanie*: Czym jest gałąź? (odgałęzienie?)

*Odpowiedź*: A branch in Git is simply a lightweight movable pointer
to one of these commits.

Gałęzie Gita najlepiej rozrysował S. Chacon w swojej książce:
[Pro Git] [progit branches]


### Tworzenie gałęzi w projekcie i ich scalanie

Przećwiczmy następujący scenariusz:

* Tworzymy serwis www z dowcipami.
* Tworzymy nową gałąź o nazwie *newidea* na nowy dowcip
  i przenosimy się na nią.
* Zaczynamy pisać nowy dowcip.

W trakcie pracy nad dowcipem dostajemy wiadomość,
że strona główna jest zawirusowana.
Przerywamy pracę nad nowym dowcipem i zabieramy się
za szukanie wirusa.

<blockquote>
  {%= image_tag "/images/spowrotem.jpg", :alt => "[z powrotem]" %}
</blockquote>

* Wracamy na główną gałąź.
* Tworzymy nową gałąź o nazwie *hotfix*,
  gdzie będziemy robić poprawki.
* Po przetestowaniu poprawek,
  scalamy gałąź *hotfix* z gałęzią główną.
* Przenosimy się z powrotem na gałąź *newidea*
  gdzie kończymy pisać nowy dowcip.

A teraz konkrety. Serwis będzie dostępny z takiego URL:

    http://sigma.inf.ug.edu.pl/~wbzyl/dowcipy/

Na początek serwis www będzie się składał z jednej strony:
*index.txt*.

1\. Zakładamy repozytorium:

    mkdir ~/public_html/dowcipy/
    cd ~/public_html/dowcipy/
    git init

Tworzymy nowy plik *index.txt*:

    vim index.txt

gdzie wpisujemy:

    Jestem albańskim wirusem komputerowym, ale z uwagi
    na słabe zaawansowanie informatyczne mojego kraju
    nie mogę nic ci zrobić.
    Proszę skasuj sobie jakiś plik i prześlij mnie dalej.

Dodajemy plik *index.txt* do „staging area” i zapisujemy go
w repozytorium:

    git status
    git add index.html
    git commit -m "dodałem albański dowcip"

2\. Tworzymy nową gałąź:

    git checkout -b newidea

gdzie zaczynamy wpisywać wpisywać nowy dowcip:

    Webmaster wypełnia podanie o dowód.
    Data urodzenia: 31.11.1990
    Wzrost: 190

3\. W trakcie wpisywania dowcipu dostajemy wiadomość o wirusie:

    git status              # dobry zwyczaj nakazuje, aby sprawdzić stan kopii roboczej
    git stash               # zanim ukryjemy zmiany w „dirty” kopii roboczej
    git lola                # mój skrót; zob. początek wykładu
    git checkout master
    git checkout -b hotfix

4\. Szybko znajdujemy wirusa. Zawirusowany dowcip zastępujemy
nowym dowcipem:

    Żona wysyła męża programistę do sklepu.
    — Kup parówki, jak będą jajka, kup dziesięć.
    Mąż w sklepie:
    — Są jajka?
    — Tak
    — Poproszę dziesięć parówek.

5\. Czytamy dowcip kolegom. Ponieważ teraz wydaje się,
że wszystko jest OK, wykonujemy:

    git commit -m "usunąłem albańskiego wirusa" -a
    git lola  # przyglądamy się jak zmieniła się historia
    git checkout master
    git lola  # j.w.
    git merge hotfix
    git branch -d hotfix

6\. Kończymy nowy dowcip:

    git checkout newidea
    git stash apply

Uruchamiamy edytor:

    vim index.txt

i dopisujemy puentę dowcipu:

    Kolor oczu: #4040EE

Testujemy czy wszystko jest OK. Jeśli tak, to jak poprzednio
scalamy *master* z *newidea* i usuwamy *newidea*:

    git commit -m "dodałem raczej słaby dowcip" -a

**Pytanie:* Jakie dowcipy są wpliku *index.txt* na gałęzi:

* *newidea* (za proste!)
* *master*  (czy jeszcze pamiętamy jakie?)

Teraz kolejno wykonujemy:

    git merge master        # najpierw scalanie (CONFLICT)
    git checkout master     # następnie zmieniamy gałąź
    git merge newidea       # i na koniec jeszcze raz scalanie
    git branch -d newidea

Zostajemy z pokrętną historią. Aby się o tym przekonać wykonujemy:

    git lola

**Pytanie:** Jak przejść powyższy scenariusz, tak aby na końcu
otrzymać „prostą historię”?

Możemy nieco oczyścić historię usuwając niepotrzebny „stash”:

    git stash clear
    git lola

Tak jest lepiej. Ale z rebase będzie jeszcze lepiej!


## Remote branches

Dodajemy oryginalny projekt jako *remote*.

Forkuję projekt Phil Hagelberga (nick: technomancy):

    http://github.com/technomancy/emacs-starter-kit

i tworzę klon sforkowanego projektu na swoim komputerze:

    git clone git@github.com:wbzyl/emacs-starter-kit.git

Teraz dodaję do klona oryginalny projekt jako *remote* repozytorium:

    git remote add technomancy git://github.com/technomancy/emacs-starter-kit.git

Po dodaniu gałęzi remote, wykonujemy polecenie:

    git fetch technomancy

ściągając na gałąź *technomancy* najnowszą wersję projektu
z serwera *github.com*.

Sprawdzamy co zostało zrobione. Wykonujemy polecenie:

    git remote
    origin
    technomancy

i widzimy że wszystko jest w porządku: mamy dwie gałęzie remote.

Polecenie:

    git branch -a

daje nieco więcej informacji od poprzedniego polecenia:

    * master
    origin/HEAD
    origin/master
    technomancy/master
    technomancy/personalizations

Po co to zrobiliśmy? Teraz możemy porównać nową wersję ze swoją:

    git diff technomancy/master

i scalić nową wersję ze swoim projektem:

    git merge technomancy/master

Albo, możemy postąpić ostrożniej:

    git checkout -b technomancy
    git merge technomancy/master

Od czasu do czasu wykonujemy:

    git fetch technomancy

pobierając nową wersję (jeśli były jakieś zmiany).


## Prostowanie historii, czyli rebasing

Zaczynamy od przyjrzenia się historii systemu *Git*.
W tym celu klonujemy repo systemu *Git*.
Następnie przeoglądamy historię korzystając
z programu *gitk*, albo wykonujac na terminalu polecenia:

    git lola  # mój alias; definicja u góry strony

Zaczniemy od utworzenia następującego repozytorium:

    cd simple-rebase-example
    git lola

    * 762524f (foo) H
    * a8dbb5a G
    * 6796ee0 F
    | * 37d5345 (HEAD, master) E
    | * 3172f08 D
    | * 5e62f10 C
    |/
    * c1f4e53 B
    * d558084 A

    ls
      A B C D E

    git checkout foo
    ls
      A B F G H


Jak utworzyć repozytorium z taką zawartością i historią?
Na przykład tak:

    :::bash
    mkdir simple-rebase-example
    cd simple-rebase-example
    git init
    touch A ; git add A ; git commit -m A
    touch B ; git add B ; git commit -m B
    git checkout -b foo
    git checkout master
    touch C ; git add C ; git commit -m C
    touch D ; git add D ; git commit -m D
    touch E ; git add E ; git commit -m E
    git checkout foo
    touch F ; git add F ; git commit -m F
    touch G ; git add G ; git commit -m G
    touch H ; git add H ; git commit -m H
    git checkout master

**Uwaga:** SHA commitów będą się różniły od tych wypisanych powyżej!

Chcemy „wyprostować” powyższą historię do takiej:

    git lola
    * 5965449 (HEAD, master) H
    * 292f360 G
    * 2e134c9 F
    * ee5cfcc E
    * 8517a45 D
    * c126d7a C
    * 9eb57d2 B
    * ca9e9e2 A

Prostowanie historii wykonujemy w kilku krokach.

Pierwszy krok:

    :::bash
    git checkout foo
    git rebase master foo

Dlaczego tak? Oto odpowiedź:

    git lola

    * 5965449 (HEAD, foo) H
    * 292f360 G
    * 2e134c9 F
    * ee5cfcc (master) E
    * 8517a45 D
    * c126d7a C
    * 9eb57d2 B
    * ca9e9e2 A

Drugi krok:

    git checkout master
    git merge foo
    git branch -d foo

I już! Gotowe:

    git lola
    * 5965449 (HEAD, master) H
    * 292f360 G
    * 2e134c9 F
    * ee5cfcc E
    * 8517a45 D
    * c126d7a C
    * 9eb57d2 B
    * ca9e9e2 A


## Prostowanie historii z konfliktami po drodze

Edytor *mg* jest malutki i ma klawiszologię Emacsa.
Użyjemy go w poniższym, pokrętnym przykładzie.

Zakładamy repo:

    mkdir test
    cd test
    git init

Dodajemy plik:

    mg .gitignore
    *~
    .. zapisujemy plik, opuszczamy edytor: ctrl+x ctrl+c
    mg README.md
    # Hello project
    .. zapisujemy plik, opuszczamy edytor
    git add .
    git commit -m "wrzutka: 1."
    git lola

Nowy pomysł:

    git checkout -b newidea
    mg README.md
    # Hello world project
    .. zapisujemy plik, opuszczamy edytor
    git commit -m "wrzutka z gałęzi newidea: 1." -a
    git lola
    mg README.md
    Kolekcja programów hello world.
    .. zapisujemy plik, opuszczamy edytor
    git commit -m "wrzutka z gałęzi newidea: 2." -a
    git lola

Przechodzimy na główną gałąź:

    git checkout master
    mg README.md
    ## Ruby
        print "hello world"
    .. zapisujemy plik, opuszczamy edytor
    git commit -m "wrzutka: 2." -a
    git lola

Rebase **wykonujemy** z gałęzi *newidea*. **Dlaczego?**
Aby się o tym przekonać wykonujemy rebase
z gałęzi *master* (na kopii repozytorium):

    git rebase newidea
    git lola

Przechodzimy na gałąź *newidea* gdzie wykonujemy *rebase*:

    git checkout newidea
    git rebase master      # mamy konflikt, dlaczego?

Rozwiązujemy konflikt. Następnie wykonujemy:

    git add .
    git rebase --continue  # ponownie mamy konflikt, dlaczego?

Rozwiązujemy drugi konflikt. Następnie wykonujemy:

    git add
    git rebase --continue
    git lola

Widzimy wyprostowaną historię:

    * 1141770 (HEAD, newidea) wrzutka z gałęzi newidea: 2.
    * d791e95 wrzutka z gałęzi newidea: 1.
    * 83c7ef9 (master) wrzutka: 2.
    * 3b10add wrzutka: 1.

Pozostaje jeszcze wrócić na główną gałąź i posprzątanie po sobie:

    git checkout master
    git lola               # podgląd historii
    git merge newidea      # powinno być fast-forward
    git lola
    git branch -d newidea
    git lola

Jest dobrze:

    * 1141770 (HEAD, master) wrzutka z gałęzi newidea: 2.
    * d791e95 wrzutka z gałęzi newidea: 1.
    * 83c7ef9 wrzutka: 2.
    * 3b10add wrzutka: 1.

Warto też przeczytać [The Basic Rebase](http://progit.org/book/ch3-6.html)
(jest polskie tłumaczenie?).


## „Github flow”

Git evangelist, writer, world traveler, father, husband, cat
rescuer, baby signer and gorilla tamer, czyli krótko
[Scott Chacon](http://scottchacon.com/)
opisał jak używany jest git na swoim blogu
w [Issues with git-flow](http://scottchacon.com/2011/08/31/github-flow.html).

Oto główne punkty:

* anything in the master branch is deployable
* create descriptive branches off of master
* pushing named branches constantly

Plus rzeczy specyficzne dla Github’a:

* open a pull request at any time
* merge only after pull request review
* deploy immediately after review

W artykule nie opisano jak „push named branches”.
Pewnie chodziło o takie polecenie:

    git push origin patch-git-fetch-performance

Po wykonaniu tego polecenia, gałąź *patch-git-fetch-performance*
powinna pojawić się w zakładkach **Branch List**
(oraz *Switch Branches*) na stronie
repozytorium na *github.com* (koniecznie obejrzeć takie galęzie,
na przykład [tutaj](https://github.com/github/git/branches)).


## Praca rozproszona z *Githubem*

Przykład: wspólna praca nad projektem *jBlog*.

Ala zakłada konto *as007* na serwerze *github.com*, a następnie
loguje się na swoje nowe konto.

Po zalogowaniu wchodzi na stronę *https://github.com/account*, gdzie
dodaje klucz publiczny swojego komputera do *SSH Public Keys*.
W ten sposób, Ala zapewnia sobie możliwość wykonywania *push*
ze swojego komputera na serwer *github.com*.

1. Teraz wchodzi na na stronę z projektem
   *http://github.com/wbzyl/jblog/*, gdzie klika w ikonkę *fork*.
1. Po sforkowaniu projektu, wchodzi z powrotem na swoją stronę:
   *http://github.com/as007/* i widzi, że projekt
   *jblog* pojawił się na liście **jej** projektów.
1. Po kliknięciu na link z nazwą *jblog* zostaje przekierowana
   na stronę *http://github.com/as007/jblog*.
   Na tej stronie jest link **Your Clone URL**:
   *git@github.com:as007/jblog.git*.
1. Używając tego URL-a, Ala klonuje sforkowane repozytorium na
   swój komputer.

Teraz zaczyna robić się ciekawie.

1. Ala dodaje nowy wpis do bloga, tworząc w katalogu *_posts*
   sforkowanego repozytorium plik *2009-10-10-mercurial.markdown*.  Plik
   ten dodaje do repozytorium, wykonuje commit i push na
   *github.com*.
1. Teraz ze strony projektu: *http://github.com/as007/jblog*
   klika w ikonkę *pull request*.

W ten sposób Ala wysłała do mnie *pull request*.
Ja po otrzymaniu *pull request* dodaję repozytorium Ali
jako *remote* do mojego repozytrorium *jblog*:

    git add remote as007 git://github.com/as007/jblog.git

1. Następnie ściągam remote repo: `git fetch as007`.
1. Patrzę co zostało zrobione: `git diff as007/master`.
1. Scalam oba projekty: `git merge as007/master`.
1. Wykonuję commit i push.

Zob. też John Resig. [Pulley: Easy Github Pull Request Landing](http://ejohn.org/blog/pulley/).


<blockquote>
 <p>
  Wsiada informatyk do taksówki. Taksiarz pyta:<br/>
  — Dokąd jedziemy?<br/>
  — 127.0.0.1
 </p>
</blockquote>

## My typical Git day

… to przykład ze strony
[Everyday GIT With 20 Commands Or So](http://www.kernel.org/pub/software/scm/git/docs/everyday.html).

Jak znaleźć bug w kodzie za pomocą *git-bisect*? Zaczynamy od lektury:

    man git-bisect


## Zalety *nagich* repozytoriów

Jak utworzyć nagie repozytorium?
Załóżmy, że w katalogu *~/tmp/* mamy repozytorium *photos*.
Po wykonaniu polecenia:

    git clone --bare ~/tmp/photos ~/public_git/photos.git

Skąd takie określenie *nagi*. Wykonanie polecenia:

    ls ~/public_git/photos.git

powinno to wyjaśnić.

Zaletą posiadania nagiego repozytorium jest możliwość pracy
rozproszonej, takiej jak z repozytoriami githuba.


## Tak klonujemy projekty z *Sigmy*

Korzystając z protokołu GIT:

    git clone git://sigma.inf.ug.edu.pl/~wbzyl/test.git

Własne projekty klonujemy korzystając z SSH:

    git clone wbzyl@sigma.inf.ug.edu.pl:public_git/test.git

albo tak:

    git clone ssh://sigma.inf.ug.edu.pl/~wbzyl/public_git/test.git


To ostatnie polecenie nie mówi *explicite*, że ma być użyte ssh.


<blockquote>
  {%= image_tag "/images/jwz.gif", :alt => "[Jamie Zawinski]" %}
  <p>
   Zawinski's Law: Every program attempts to expand until it can read
   mail. Those programs which cannot so expand are replaced by ones
   which can.
  </p>
  <p class="author">— <a href="http://www.jwz.org/">Jamie Zawinski</a></p>
</blockquote>

## Różne

* [Hunting bugs thru history](http://phunkwork.com/post/460924983/hunting-bugs-thru-history)
  ([An example repository that can be used to play with git-bisect, bugs and
  rspec](http://github.com/phunkwork/Bisect-bug-hunt))
* [Reset Demystified](http://progit.org/2011/07/11/reset.html)


#### Linki

[git home]: http://git.or.cz "git home"
[the-git-parable]: http://tom.preston-werner.com/2009/05/19/the-git-parable.html "The Git Parable"
[torvalds on git]: http://www.youtube.com/watch?v=4XpnKHJAok8 "Tech Talk: Linus Torvalds on git"
[schwartz on git]: http://www.youtube.com/watch?v=8dhZ9BXQgc4 "Git"
[git-in-one-hour]: http://www.oreillynet.com/pub/e/1394 "Git in One Hour"
[progit branches]: http://progit.org/book/ch3-1.html "What a Branch Is"

[tomayko about git]: http://tomayko.com/writings/the-thing-about-git "The Thing About Git"
