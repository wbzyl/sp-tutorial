#### {% title "Ćwiczenia" %}

# Ćwiczenia

<blockquote>
  {%= image_tag "/images/albert_einstein.jpg", :alt => "[Albert Einstein]" %}
  <p>
   In the interests of clarity, it seemed necessary to constantly
   remind myself to pay not the slightest attention to the elegance of
   the presentation; I adhered conscientiously to the rule of the
   brilliant theoretician, Ludwig Boltzmann, to leave elegance to
   tailors and shoemakers.
  </p>
  <p class="author">— Albert Einstein</p>
</blockquote>

Skrypty należy umieścić w repozytorium git. Nazwa repozytorium
dla konkretnego zestawu zadań powinna być jedna dla całej
grupy laboratoryjnej.

Dla użytkownika *wbzyl* zakładanie repozytorium „bare” z systemem
„wtewewte” może wyglądać tak:

    mkdir latex
    cd latex
    git init
    touch README.markdown
    # ... dodajemy pozostałe pliki z kodem/rozwiązaniem ...
    git add .
    git commit -m "gotowe"
    cd ..
    git clone --bare latex ~/public_git/latex.git
    rm -rf latex

Ponieważ repozytoria w katalogu **public_git** są publiczne,
każdy może je klonować (system „wte”):

    git clone git://sigma.ug.edu.pl/~wbzyl/latex.git

Ale właściciel repozytorium powinien klonować swoje repozytoria tak
(system „wtewewte”):

    git clone ssh://sigma.ug.edu.pl/~wbzyl/public_git/latex.git

Oczywiście tylko dla repozytoriów „wtewewte” można wykonać
polecenie *push*:

    cd latex
    # ... edytujemy jakiś plik ... dodajemy nowe pliki ...
    git add .
    git commit -m "nowa wersja"
    git push

<blockquote>
  <p>Uważaj na człowieka, którego nie interesują szczegóły.
  </p>
  <p class="author">— William Feather</p>
</blockquote>

## Bash

Zadania do wykonania w laboratorium:

* {%= link_to "Laboratorium 1", "/labs01" %} (polecenia powłoki)
* {%= link_to "Laboratorium 2", "/labs02" %} (kontynuacja)
* {%= link_to "Laboratorium 3", "/labs03" %} (— " —)
* {%= link_to "Laboratorium 4", "/labs04" %} (— " —)
* {%= link_to "Laboratorium 5", "/labs05" %} (*find*)
* {%= link_to "Laboratorium 6", "/labs06" %} (*grep*)
* {%= link_to "Laboratorium 7", "/labs07" %} (skrypty)


## LaTeX

Zadania do wykonania w laboratorium:

* {%= link_to "Laboratorium 10", "/labs10" %}

<!-- 

## Git

Zadania do wykonania w laboratorium:

* {%= link_to "Laboratorium 12", "/labs12" %} (praca w zespołach)
* {%= link_to "Laboratorium 13", "/labs13" %} (gałęzie, scalanie)

## Zaliczenia

Laboratoria 14, 15.

-->


# Zadania opisowe

<blockquote>
  <p>Jeśli chodzi o obserwację, los nagradza tylko przygotowane umysły.
  </p>
  <p class="author">— Louis Pasteur</p>
</blockquote>

Rozwiązania zadań opisowych należy umieścić na swoim blogu.
Na przykład, rozwiązania ćwiczeń LaTeX-owych, powinny
być dostępne pod jakimś takim URL:

    http://sigma.ug.edu.pl/~wbzyl/sp/2009-11-22-latex.html

Oczywiście, zamiast *wbzyl* trzeba wstawić swój login,
no i data będzie też inna.


## Edytor & notacja Markdown

1\. Przygotować post ze ściągą do wyrażeń regularnych
rozpoznawanych przez program *egrep*.


## Grep

1\. Wymyśl dwa zadania używające polecenia *egrep* i&nbsp;nietrywialne
wyrażenie regularne.


## Skrypty

1\. Poprawić skrypt *makedict.sh* z wykładu tak, aby rozpoznawał 
polskie litery. Opisać jak ten skrypt działa.

2\. W *jBlogu* jest kilka napisów, które należy wymienić,
na przykład, w pliku *index.html*:

    title: WB_Blog

a w pliku *_layouts/default.html*:

    <meta name="author" content="Włodek Bzyl" />
    
Napisać prosty skrypt korzystający z programu *sed*
wymieniający wszystkie takie napisy.


## LaTeX

1\. Zadania rozwiązywane w laboratoriach, na przykład 
zadania z „Laboratorium 2”, to tekst z listą wypunktowaną
(otoczenia *enumerate*, *itemize*) 
oraz tytulariami (polecenia *section*, *paragraph*).

* Przygotować szablon dla programu *texworks* oraz 
  skróty klawiszowe ułatwiające wpisywanie takich tekstów. 
* Przepisać jeden ze zestawów
  zadań korzystając z przygotowanego szablonu oraz z
  przygotowanych skrótów klawiszowych.

Wskazówka: Zajrzyj na strony Wiki:
[Documentation of the code completion feature] [texworks code completion],
[Some tips for using TeXworks] [texworks tips].


## Git

1\. Napisać historyjkę pokazującą jak można
wyszukać *commit* w którym po raz pierwszy
pojawiła się określona funkcja.
Umieścić historyjkę na jBlogu pod *git-grep*. 

2\. Napisać historyjkę ilustrującą użycie polecenia
`git cherry-pick`.
Umieścić historyjkę na jBlogu pod *git-cherry-pick*. 

3\. Przeczytać [Git Repo Hosting via SSH](http://rfelix.com/2010/04/06/git-repo-hosting-via-ssh/)
i zastosować w praktyce. (dobrać jakiś projekt na 2–3 osoby). 


#### Linki

[texworks tips]: http://code.google.com/p/texworks/wiki/TipsAndTricks "Tips and Tricks"
[texworks code completion]: http://code.google.com/p/texworks/wiki/CodeCompletion "Code completion"
