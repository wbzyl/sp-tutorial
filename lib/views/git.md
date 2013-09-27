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

Klika linków na początek:

* S. Chacon:
  - [Git in One Hour] [git-in-one-hour]
  - [Pro Git](http://git-scm.com/book) ([polskie tłumaczenie](http://git-scm.com/book/pl))
* [Git Concepts Simplified](http://gitolite.com/gcs/index.html)
* [Git User’s Manual](https://www.kernel.org/pub/software/scm/git/docs/user-manual.html)
* Juan Batiz-Benet, [A simple Git branching model](https://gist.github.com/wbzyl/52947ec7869e7ba13323)

[Github](https://github.com/):

* [GitHub Archive](http://www.githubarchive.org/)
* [The Open Source Report Card](http://osrc.dfm.io/) by Dan Foreman-Mackey.


<blockquote>
 <p>
  Podchodzi informatyk do fortepianu i ogląda go wnikliwie:<br>
  — Hmm, tylko 84
  klawisze, z czego 1/3 funkcyjnych, wszystkie nieopisane,
  chociaż… shift naciskany nogą. Oryginalnie.
 </p>
</blockquote>

## Konfiguracja

Zanim zaczniemy pracę systemem Git musimy go skonfigurować:

    :::bash
    git config -l
    git config --global user.name "Wlodek Bzyl"
    git config --global user.email "matwb@univ.gda.pl"
    git config --global core.autocrlf input      # on Linux
    git config --global core.autocrlf auto       # on Windows

    # git config --global push.default matching  # or simple or current

Po czym natychmiast sprawdzamy, czy coś poszło nie tak:

    :::bash
    cat ~/.gitconfig

Łatwiej będzie nam porozumiewać się z Gitem, po dodaniu do pliku
konfiguracyjnego kilku zwyczajowych skrótów:

    :::bash
    git config --global alias.br    "branch -a"
    git config --global alias.co    "checkout"
    git config --global alias.ci    "commit"
    git config --global alias.lg    "log -p"
    git config --global alias.lol   "log --graph --decorate --pretty=oneline --abbrev-commit"
    git config --global alias.lola  "log --graph --decorate --pretty=oneline --abbrev-commit --all"
    git config --global alias.ls    "ls-files"
    git config --global alias.st    "status"
    git config --global alias.df    "diff"

**Uwaga:** Porównywanie zmian w kodzie ułatwia program [meld](http://meldmerge.org/).
Po instalacji tego programu w systemie, konfigurujemy program *git*:

    :::bash
    git config --global diff.tool meld

Teraz zmiany w kodzie przeglądamy za pomocą programu *meld* w taki sposób:

    :::bash
    git difftool

Ułatwimy sobie śledzenie zmian w kodzie jeśli je podkolorujemy:

    :::bash
    git config --global color.branch auto
    git config --global color.diff auto
    git config --global color.status auto

Jeszcze trochę ręcznych robótek w pliku konfiguracyjnym.
I oto rezultat — mój plik *~/.gitconfig* w całej okazałości:

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


### Nazwa gałęzi w znaku zachęty basha

Po sklonowaniu repozytorium samego Gita:

    :::bash
    git clone git://git.kernel.org/pub/scm/git/git.git

z katalogu *contrib/completion* kopiujemy
do katalogu domowego te pliki:

    :::bash
    cp git-prompt.sh ~/.git-prompt.sh
    cp git-completion.bash ~/.git-completion.sh

Następnie do pliku *.bashrc* dopisujemy:

    :::bash
    source ~/.git-prompt.sh
    source ~/.git-completion.sh
    # bash                    <pre>      <post>
    PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\n→ "'
    GIT_PS1_SHOWDIRTYSTATE=enable      # unstaged (*), staged (+) changes
    GIT_PS1_SHOWSTASHSTATE=enable      # something is stashed ($)
    GIT_PS1_SHOWUNTRACKEDFILES=enable  # untracked (%)
    GIT_PS1_SHOWUPSTREAM=verbose       # no difference (=), behind (<), ahead(>)
    GIT_PS1_DESCRIBE_STYLE=branch      # relative to newer tag or branch (master~4)
    GIT_PS1_SHOWCOLORHINTS=enable

Teraz w repozytoriach powinniśmy mieć taki „znak zachęty”:

    wbzyl@localhost:~/GitHub/git (master =)
    →

Kolorowy prompt z nazwą gałęzi uzyskamy
z [powerline-shell](https://github.com/milkbikis/powerline-shell):

{%= image_tag "/images/powerline-shell.png" %}

*Konfiguracja powerline-shell:* wyszukujemy i odkomentowujemy
w pliku *powerline-shell.py* dwa wiersze z *p.append*:

    if __name__ == '__main__':
        p.append(Segment(p, '\\u ', 250, 240))
        p.append(Segment(p, '\\h ', 250, 238))

dodajemy znak nowego wiersza do *bash* w zmiennej *root_indicators*:

    root_indicators = {
        'bash': '\\n\\$ ',
        'zsh': ' \\$ ',
        'bare': ' $ ',
    }


## Podstawy

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

### Zakładamy repozytorium

Pierwsze repozytorium, zgodnie ze starą uniksową tradycją
powinno mieć nazwę *hello-world*:

    :::bash
    mkdir hello-world
    cd hello-world
    git init
    touch .gitignore README.md Makefile hello.c
    git add .
    git commit -m "pierwsza wrzutka"

Każdy plik w systemie Git może mieć aż trzy życia:
jedno w „katalogu roboczym”, drugie w „staging area” i trzecie w „repozytorium”:

    :::bash
    git diff           # shows you the differences from staging area to working tree
    git diff HEAD      # shows you the differences from repo to working tree
    git diff --staged  # shows you the differences from repo to staging area

*Użyteczne aliasy:*

<blockquote cite="http://www.gitready.com/beginner/2009/01/18/the-staging-area.html">
  {%= image_tag "/images/staging_area.png", :alt => "[working tree / index / trunk]" %}
</blockquote>

    :::bash
    git config --global alias.sw    "diff"
    git config --global alias.rw    "diff HEAD"
    git config --global alias.rs    "diff --staged"

Do czego służy drugie życie opisał Ryan Tomayko na swoim blogu,
[The Thing About Git] [tomayko about git].

Na *staging area* (punkt etapowy, punkt tranzytowy) mówimy też
index; *working tree* to katalog roboczy (kopia robocza);
a *repozytorium* to *repozytorium*.


### Git na co dzień

Zazwyczaj praca z repozytorium wygląda tak:

    :::bash
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

<blockquote>
 <p><a href="http://anders.janmyr.com/2012/01/finding-with-git.html">Finding with Git</a></p>
 <p class="author">— Anders Janmyr</p>
</blockquote>

    :::bash
    git log
    git log -p
    git log --grep 'important'
    git log -Sword               # search thru history
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

    :::bash
    git commit --amend

Unstaging staged plik:

    :::bash
    git add .
    git status
    # On branch master
    # Changes to be committed:
    #   (use "git reset HEAD <file>..." to unstage)
    #
    #       modified:   README.md

Wycofanie zmian w edytowanym pliku:

    :::bash
    # Changed but not updated:
    #   (use "git add <file>..." to update what will be committed)
    #   (use "git checkout -- <file>..." to discard changes in working directory)
    #
    #       modified:   README.md

Undo merge:

    :::bash
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

    :::bash
    mkdir ~/public_html/dowcipy/
    cd ~/public_html/dowcipy/
    git init

Tworzymy nowy plik *index.txt*:

    :::bash
    vim index.txt

gdzie wpisujemy:

    Jestem albańskim wirusem komputerowym, ale z uwagi
    na słabe zaawansowanie informatyczne mojego kraju
    nie mogę nic ci zrobić.
    Proszę skasuj sobie jakiś plik i prześlij mnie dalej.

Dodajemy plik *index.txt* do „staging area” i zapisujemy go
w repozytorium:

    :::bash
    git status
    git add index.html
    git commit -m "dodałem albański dowcip"

2\. Tworzymy nową gałąź:

    :::bash
    git checkout -b newidea

gdzie zaczynamy wpisywać wpisywać nowy dowcip:

    Webmaster wypełnia podanie o dowód.
    Data urodzenia: 31.11.1990
    Wzrost: 190

3\. W trakcie wpisywania dowcipu dostajemy wiadomość o wirusie:

    :::bash
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

    :::bash
    git commit -m "usunąłem albańskiego wirusa" -a
    git lola  # przyglądamy się jak zmieniła się historia
    git checkout master
    git lola  # j.w.
    git merge hotfix
    git branch -d hotfix

6\. Kończymy nowy dowcip:

    :::bash
    git checkout newidea
    git stash apply

Uruchamiamy edytor:

    :::bash
    vim index.txt

i dopisujemy puentę dowcipu:

    Kolor oczu: #4040EE

Testujemy czy wszystko jest OK. Jeśli tak, to jak poprzednio
scalamy *master* z *newidea* i usuwamy *newidea*:

    :::bash
    git commit -m "dodałem raczej słaby dowcip" -a

**Pytanie:** Jakie dowcipy są zapisane w pliku *index.txt* na gałęzi:

* *newidea* (za proste!)
* *master*  (czy jeszcze pamiętamy jakie?)

Teraz kolejno wykonujemy:

    :::bash
    git merge master        # najpierw scalanie (CONFLICT)
    git checkout master     # następnie zmieniamy gałąź
    git merge newidea       # i na koniec jeszcze raz scalanie
    git branch -d newidea

Zostajemy z pokrętną historią. Aby się o tym przekonać wykonujemy:

    :::bash
    git lola

**Pytanie:** Jak przejść powyższy scenariusz, tak aby na końcu
otrzymać „prostą historię”?

Możemy nieco oczyścić historię usuwając niepotrzebny „stash”:

    :::bash
    git stash clear
    git lola

Tak jest lepiej. Ale z rebase będzie jeszcze lepiej!


## Remote branches

Zob. też [9.5 Git Internals - The Refspec](http://git-scm.com/book/en/Git-Internals-The-Refspec).

Dodajemy oryginalny projekt jako *remote*.

Forkuję projekt Phil Hagelberga (nick: technomancy):

    http://github.com/technomancy/emacs-starter-kit

i tworzę klon sforkowanego projektu na swoim komputerze:

    :::bash
    git clone git@github.com:wbzyl/emacs-starter-kit.git

<blockquote>
<h1>Upstream</h1>
<p>
  <i>upstream</i> to oryginalny projekt.
  Jeśli będziemy scalać uaktualnienia
  z upstream, to powinniśmy go dodać jako
  <i>remote</i>, np. tak jak to zrobiono
  z emacsowym repo.
  Ale można postąpić też tak:
</p>
<pre>git remote add --track \
  master upstream \
  git://github.com/upstream/repo.git
</pre>
<p>Co to daje?</p>
<pre>
git fetch upstream
git merge upstream/master
</pre>
</blockquote>

Teraz dodaję do klona oryginalny projekt jako *remote* repozytorium:

    :::bash
    git remote add technomancy \
      git://github.com/technomancy/emacs-starter-kit.git

Po dodaniu gałęzi remote, wykonujemy polecenie:

    :::bash
    git fetch technomancy

ściągając na gałąź *technomancy* najnowszą wersję projektu
z serwera *github.com*.

Sprawdzamy co zostało zrobione. Wykonujemy polecenie:

    :::bash
    git remote
    origin
    technomancy

i widzimy że wszystko jest w porządku: mamy dwie gałęzie remote.

Polecenie:

    :::bash
    git branch -a

daje nieco więcej informacji od poprzedniego polecenia:

    * master
    origin/HEAD
    origin/master
    technomancy/master
    technomancy/personalizations

Po co to zrobiliśmy? Teraz możemy porównać nową wersję ze swoją:

    :::bash
    git diff technomancy/master

i scalić nową wersję ze swoim projektem:

    :::bash
    git merge technomancy/master

Albo, możemy postąpić ostrożniej:

    :::bash
    git checkout -b technomancy
    git merge technomancy/master

Od czasu do czasu wykonujemy:

    :::bash
    git fetch technomancy

pobierając nową wersję (jeśli były jakieś zmiany).


Od czasu do czasu, po pobraniu nowych rzeczy:

    git fetch technomancy

zauważamy, że technomancy dodał nowe rzeczy, na przykład
pojawiła się nowa gałąź *v2*:

    origin/HEAD -> origin/master
    origin/master
    technomancy/master
    technomancy/v2

Oczywiście, natychmiast chcielibyśmy sprawdzić co jest na *v2*.
W tym celu,
najwygodniej będzie dodać do swojego repozytorium nową gałąź na
którą będziemy pobierać nowe wersje v2 z repozytorium technomancy.
i utworzyć tzw. *tracking branch*:

    git checkout --track technomancy/v2
    git checkout -b v2.x --track technomancy/v2 # lub tak, zmieniamy nazwę gałęzi na v2.x

Teraz możemy się przyjrzeć co zostało zrobione na *v2*.

A po przejściu na gałąź master, możemy podejrzeć zawartość
pliku, na przykład tak:

    git show c0b13124:README.markdown


## Usuwamy zbędne gałęzie

Usuwamy wszystkie gałęzie scalone z bieżącą gałęzią (sprawdzić czy to działa):

    :::bash
    git branch --merged | grep -v "\*" | xargs -n 1 git branch -d

Usuwamy gałąź lokalną:

    :::bash
    git branch -d branchname

Usuwamy niescaloną gałąź lokalną:

    :::bash
    git branch -D branchname

Usuwamy gałąź z repozytorium zdalnego (*remote*):

    :::bash
    git push origin :branchname

to samo ale prościej:

    :::bash
    git push --delete origin branchname

Usuwamy wszystkie tzw. zdalne *tracking branches*:

    :::bash
    git remote prune origin

to samo, ale pojedynczo:

    :::bash
    git branch -dr branchname


<blockquote>
 <p>Mała powtórka?
   <a href="http://marklodato.github.com/visual-git-guide/index-en.html">A Visual Git Reference</a>
 </p>
</blockquote>

## Prostowanie historii, czyli rebasing

Zaczynamy od przyjrzenia się historii systemu *Git*.
W tym celu klonujemy repo systemu *Git*.
Następnie przeoglądamy historię korzystając
z programu *gitk*, albo wykonujac na terminalu polecenia:

    :::bash
    git lola  # mój alias; definicja u góry strony

Zaczniemy od utworzenia następującego repozytorium:

    :::bash
    cd simple-rebase-example
    git checkout foo
    ls
      A B F G H
    git checkout master
    ls
      A B C D E
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

    :::bash
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

    :::bash
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

    :::bash
    git checkout master
    git merge foo
    git branch -d foo

I już! Gotowe:

    :::bash
    git lola
    * 5965449 (HEAD, master) H
    * 292f360 G
    * 2e134c9 F
    * ee5cfcc E
    * 8517a45 D
    * c126d7a C
    * 9eb57d2 B
    * ca9e9e2 A


<blockquote>
<h1>merge vel rebase</h1>
{%= image_tag "/images/git-rebase.jpg", :alt => "https://github.com/blog/593-github-rebase-35" %}
<p>
  M. Marhonić, <a href="http://mislav.uniqpath.com/2013/02/merge-vs-rebase/">Git merge vs. rebase</a>,
  K. Buckley, <a href="http://www.kerrybuckley.org/2008/06/18/avoiding-merge-commits-in-git/">Avoiding Merge Commits in Git</a>
</p>
</blockquote>

Co to jest *interactive rebase*? Wykonać:

    :::bash
    git rebase -i master foo

Jaka są różnice w historii repozytorium, po wykonaniu
poleceń po lewej stronie v. te po prawej:

    :::bash
    git co master            git co master # kontekst
    git rebase foo master    git rebase master foo
    git checkout foo
    git merge master         git merge foo

[Undoing a git rebase](http://stackoverflow.com/questions/134882/undoing-a-git-rebase):

    :::bash
    git reset --hard ORIG_HEAD



## Prostowanie historii z konfliktami po drodze

Edytor *mg* jest malutki i ma klawiszologię Emacsa.
Użyjemy go w poniższym, pokrętnym przykładzie.

Zakładamy repo:

    :::bash
    mkdir test
    cd test
    git init

Dodajemy plik:

    :::bash
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

    :::bash
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

    :::bash
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

    :::bash
    git rebase newidea
    git lola

Przechodzimy na gałąź *newidea* gdzie wykonujemy *rebase*:

    :::bash
    git checkout newidea
    git rebase master      # mamy konflikt, dlaczego?

Rozwiązujemy konflikt. Następnie wykonujemy:

    :::bash
    git add .
    git rebase --continue  # ponownie mamy konflikt, dlaczego?

Rozwiązujemy drugi konflikt. Następnie wykonujemy:

    :::bash
    git add
    git rebase --continue
    git lola

Widzimy wyprostowaną historię:

    * 1141770 (HEAD, newidea) wrzutka z gałęzi newidea: 2.
    * d791e95 wrzutka z gałęzi newidea: 1.
    * 83c7ef9 (master) wrzutka: 2.
    * 3b10add wrzutka: 1.

Pozostaje jeszcze wrócić na główną gałąź i posprzątanie po sobie:

    :::bash
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


<blockquote>
 {%= image_tag "/images/howto-github.jpg", :alt => "[How to GitHub]" %}
 <p><a href="http://gun.io/blog/how-to-github-fork-branch-and-pull-request/">How to GitHub:
  Fork, Branch, Track, Squash and Pull Request</a></p>
</blockquote>

## „Github flow”

Git evangelist, writer, world traveler, father, husband, cat
rescuer, baby signer and gorilla tamer, czyli krótko
[Scott Chacon](http://scottchacon.com/)
opisał jak używany jest git na swoim blogu
w [Issues with git-flow](http://scottchacon.com/2011/08/31/github-flow.html).

Oto główne punkty:

1. Anything in the master branch is deployable.
2. To work on something new, create a descriptively named branch off
of master (ie: new-oauth2-scopes)
3. Commit to that branch locally and regularly push your work to the
same named branch on the server.

Plus rzeczy specyficzne dla Github’a:

4. When you **need feedback or help**, or you think the branch is ready
for merging, **open a pull request**.
5. After someone else has reviewed and signed off on the feature, you
can merge it into master
6. Once it is merged and pushed to ‘master’, you can and should
deploy immediately.

W artykule nie opisano jak „push named branches”.
Pewnie chodziło o takie polecenie:

    :::bash
    git push origin new-oauth2-scopes

Po wykonaniu tego polecenia, gałąź *new-oauth2-scopes*
powinna się pojawić na stronie repozytorium w zakładce **Branches**.

Koniecznie obejrzeć takie gałęzie, na przykład
[tutaj](https://github.com/github/gollum/branches).
Na tej stronie kliknąć przycisk **Compare**.


<blockquote>
 {%= image_tag "/images/gitlog.jpg", :alt => "[GitHub & Pull Requests & Logs]" %}
 <p>Linus Torvalds o
  <a href="https://github.com/torvalds/linux/pull/17#issuecomment-5654674">pull requests</a>
  i log messages:
  <a href="http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html">A Note About Git Commit Messages</a>
  (Tim Pope).
 </p>
</blockquote>

## „Mozilla flow”

* [Using topic branches and interactive rebasing effectively](http://blog.mozilla.com/webdev/2011/11/21/git-using-topic-branches-and-interactive-rebasing-effectively/)


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

    :::bash
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

    :::bash
    man git-bisect


## Zalety *nagich* repozytoriów

Jak utworzyć nagie repozytorium?
Załóżmy, że w katalogu *~/tmp/* mamy repozytorium *photos*.
Po wykonaniu polecenia:

    :::bash
    git clone --bare ~/tmp/photos ~/public_git/photos.git

Skąd takie określenie *nagi*. Wykonanie polecenia:

    :::bash
    ls ~/public_git/photos.git

powinno to wyjaśnić.

Zaletą posiadania nagiego repozytorium jest możliwość pracy
rozproszonej, takiej jak z repozytoriami githuba.


## Repozytorium Git z systemem „wte”

Zakładamy repozytorium z systemem „wte”:

    :::bash
    cd ~/public_git
    mkdir test
    cd test
    touch README.md
    git init
    git add .
    git commit -m "pierwsza wrzutka"
    ... edycja README.md, add – zmiany, commit – co zostało zrobione

Korzystając z protokołu git, każdy użytkownik może sklonować na swój
komputer repo *test*:

    :::bash
    git clone git://sigma.ug.edu.pl/~wbzyl/test

Kilka zdań o magiczności katalogu *public_git* na Sigmie oraz o małej
użyteczności repozytoriów z systemem „wte”.


## Repozytorium Git z systemem „wtewewte”

Tworzymy *bare* repo *test.git* z repozytorium *test*:

    :::bash
    mkdir ~/public_git  # katalog na publiczne repozytoria
    git clone --bare ~/tmp/test ~/public_git/test.git
    rm -rf test  # usuwamy niepotrzebne już repozytorium

Korzystając z protokołu git, każdy użytkownik może sklonować na swój
komputer repo *test.git*:

    :::bash
    git clone git://sigma.ug.edu.pl/~wbzyl/test.git

A **właściciel repozytorium**, czyli ja, klonuje repo korzystając
z protokołu **ssh** w taki sposób:

    :::bash
    git clone ssh://sigma.ug.edu.pl/~wbzyl/public_git/test.git

Właściciel repozytorium może wykonać `pull` i `push`
(system wtewewte), a pozostali tylko `pull` (system wte).


## Workflow dla Bloga

Skorzystamy z gotowego bloga [Jekyll-Bloga] [jblog]
który specjalnie przygotowałem na tę okazję.

Wchodzimy na serwer *http://github.com*, gdzie zakładamy darmowe publiczne
konto: zakładka *Pricing and Signup*.

Po zalogowaniu się na swoje konto, klikamy w zakładkę *account*
i **dodajemy klucz publiczny** z *Sigmy*: zakładka *SSH Public Keys*.

<blockquote>
 <p>
  <em>fork</em> – widelec, widły, <b>rozwidlenie</b><br/>
  <em>branch</em> – gałąź, odnoga; <b>odgałęzienie</b>
 </p>
</blockquote>

Przechodzimy na konto: *http://github.com/wbzyl/*, gdzie klikamy
w projekt *jblog*. Forkujemy projekt. Na koniec, klonujemy
sforkowany przed chwilą projekt na swój komputer.

Teraz przechodzimy do katalogu z projektem:

    :::bash
    cd jblog

i dodajemy oryginalne repozytorium jako **remote**:

    :::bash
    git remote add wbzyl git://github.com/wbzyl/jblog.git

<blockquote>
  {%= image_tag "/images/jwz.gif", :alt => "[Jamie Zawinski]" %}
  <p>
   Zawinski's Law: Every program attempts to expand until it can read
   mail. Those programs which cannot so expand are replaced by ones
   which can.
  </p>
  <p class="author">— <a href="http://www.jwz.org/">Jamie Zawinski</a></p>
</blockquote>

Umożliwi to pobieranie i scalanie uaktualnień z oryginału:

    :::bash
    git fetch wbzyl
    git diff wbzyl/master
    git merge wbzyl/master

Piszemy pierwszy wpis do swojego bloga: [instrukcje są tutaj] [jblog].


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

[jblog]: http://github.com/wbzyl/jblog "Jekyll-Blog dostosowany do Sigmy"
