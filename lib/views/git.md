#### {% title "Git jest git" %}

<blockquote>
  {%= image_tag "/images/the_thinker.jpg", :alt => "[The Thinker]" %}
  <p>There's no sense in being precise when you don't even know what
     you're talking about.</p>
  <p class="author">— John von Neumann</p>
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


## Konfiguracja

<blockquote>
 <p>
  Podchodzi informatyk do fortepianu i ogląda go wnikliwie:
  — Hmm, tylko 84
  klawisze, z czego 1/3 funkcyjnych, wszystkie nieopisane,
  chociaż… shift naciskany nogą. Oryginalnie.
 </p>
</blockquote>

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
jedno w „drzewie roboczym”, drugie w „indeks” i trzecie w „trunk”:

    git diff           # shows you the differences from index to working tree
    git diff HEAD      # shows you the differences from trunk to working tree
    git diff --cached  # shows you the differences from trunk to index

Do czego służy drugie życie opisał Ryan Tomayko na swoim blogu,
[The Thing About Git] [tomayko about git].


<blockquote cite="http://www.gitready.com/beginner/2009/01/18/the-staging-area.html">
  {%= image_tag "/images/staging_area.png", :alt => "[working tree / index / trunk]" %}
</blockquote>

Na *indeks* mówimy też *staging area* (punkt etapowy, punkt tranzytowy),
*working tree* tłumaczymy na drzewo robocze (kopia robocza?),
a *trunk* to *trunk*.


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
*index.html*.

1\. Zakładamy repozytorium. Do pliku *index.html*
wpisujemy dowcip:

    mkdir ~/public_html/dowcipy/
    cd ~/public_html/dowcipy/
    git init
    cat > index.html
    Jestem albańskim wirusem komputerowym, ale z uwagi
    na słabe zaawansowanie informatyczne mojego kraju
    nie mogę nic ci zrobić.
    Proszę skasuj sobie jakiś plik i prześlij mnie dalej.

Dodajemy plik do repozytorium i umieszczamy go w repozytorium

    git add index.html
    git commit -m "dodałem albański dowcip"

2\. Tworzymy nową gałąź i zaczynamy wpisywać nowy dowcip:

    git checkout -b newidea
    cat >> index.html
    Webmaster wypełnia podanie o dowód.
    Data urodzenia: 31.11.1990
    Wzrost: 190

3\. W trakcie wpisywania dowcipu dostajemy wiadomość o wirusie:

    git status
    git stash
    git status
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

    git commit -m "usunięto wirusa" -a
    git checkout master
    git merge hotfix
    git branch -d hotfix

6\. Kończymy nowy dowcip:

    git checkout newidea
    git stash apply
    cat >> index.html
    Kolor oczu: #4040EE

Testujemy czy wszystko jest OK. Jeśli tak, to jak poprzednio
scalamy *master* z *newidea* i usuwamy *newidea*:

    git add index.html
    git commit -m "raczej słaby dowcip"

Teraz kolejno wykonujemy:

    git merge master        # najpierw scalanie
    git checkout master     # następnie zmieniamy gałąź
    git merge newidea       # i na konie jeszcze raz scalanie
    git branch -d newidea

**Uwaga:** Najpierw wykonujemy na gałęzi *newidea* scalanie z *master*.
Jeśli pominiemy ten krok, to scalenie z *newidea*
daje konflikt. Dlaczego?

Zostajemy z pokrętną historią:

    gitk --all

Jak przejść powyższy scenariusz, tak aby na końcu otrzymać „prostą
historię”?

Możemy nieco oczyścić gałęzie w taki sposób:

    git stash clear
    git gc


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

Zobacz też [The Basic Rebase](http://progit.org/book/ch3-6.html)

Zakładamy repo:

    mkdir test
    cd test
    cat > README.md
    # Hello project
    .. ctrl+d
    git init
    git add .
    git commit -m "wrzutka: 1."
    gitk

Nowy pomysł:

    git checkout -b newidea
    cat > README.md
    # Hello world project
    .. ctrl+d
    git commit -m "wrzutka z gałęzi newidea: 1." -a
    cat >> README.md
    Kolekcja programów hello world.
    .. ctrl+d
    git commit -m "wrzutka z gałęzi newidea: 2." -a
    gitk

Przechodzimy na główną gałąź:

    git checkout master
    cat >> README.md
    ## Ruby
        print "hello world"
    .. ctrl+d
    git commit -m "wrzutka: 2." -a
    gitk

Przechodzimy na gałąź *newidea*.
Rebase **wykonujemy** z gałęzi *newidea*:

    git checkout newidea
    git rebase master

Wracamy na główną gałąź, scalamy zmiany z gałęzi
*newidea* i usuwamy gałąź *newidea*:

    git checkout master
    gitk                   # podgląd
    git merge newidea      # powinno być fast-forward
    gitk
    git branch -d newidea
    gitk


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


<blockquote>
  {%= image_tag "/images/jwz.gif", :alt => "[Jamie Zawinski]" %}
  <p>
   Zawinski's Law: Every program attempts to expand until it can read
   mail. Those programs which cannot so expand are replaced by ones
   which can.
  </p>
  <p class="author">— <a href="http://www.jwz.org/">Jamie Zawinski</a></p>
</blockquote>

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

    git clone ssh://sigma.inf.ug.edu.pl/~wbzyl/public_git/test.git

albo tak:

    git clone wbzyl@sigma.inf.ug.edu.pl:public_git/test.git

To ostatnie polecenie nie mówi *explicite*, że ma być użyte ssh.


## Różne

* [Hunting bugs thru history](http://phunkwork.com/post/460924983/hunting-bugs-thru-history)
  ([An example repository that can be used to play with git-bisect, bugs and
  rspec](http://github.com/phunkwork/Bisect-bug-hunt))


#### Linki

[git home]: http://git.or.cz "git home"
[the-git-parable]: http://tom.preston-werner.com/2009/05/19/the-git-parable.html "The Git Parable"
[torvalds on git]: http://www.youtube.com/watch?v=4XpnKHJAok8 "Tech Talk: Linus Torvalds on git"
[schwartz on git]: http://www.youtube.com/watch?v=8dhZ9BXQgc4 "Git"
[git-in-one-hour]: http://www.oreillynet.com/pub/e/1394 "Git in One Hour"
[progit branches]: http://progit.org/book/ch3-1.html "What a Branch Is"

[tomayko about git]: http://tomayko.com/writings/the-thing-about-git "The Thing About Git"
