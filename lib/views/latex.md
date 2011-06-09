#### {% title "Nie za krótkie wprowadzenie do LaTeX-a" %}

<blockquote>
  {%= image_tag "/images/knuth.jpg", :alt => "[Donald E. Knuth]" %}
  <p>
   Computers are good at following instructions,
   but not at reading your mind.
  </p>
  <p class="author">— Donald E. Knuth</p>
</blockquote>

System TeX powstał w 1980 roku. Jego autorem jest prof. D. Knuth.
Od tego czasu system jest stale rozwijany i udoskonalany.

Co to jest TeX? Krótko: TeX jest systemem do składu dokumentów.
Długo: [Najkrótsze wprowadzenie do systemu TeX](http://www.gust.org.pl/doc/tex_whatisit/).

Skompilować jakiś dokument z [arXiv] [].

W systemie TeX znajdziemy około 300 różnych programów.
Najważniejsze z nich to: latex, pdflatex, **xelatex**.

Najważniejsze biblioteki do języka *TeX*:

* **latex**
* *plain*
* *eplain*
* *context*

Biblioteka *LaTeX* (mówimy też format *LaTeX*) jest najczęściej
używana.  Autorem tej biblioteki jest Leslie Lamport.

Kilka zdań o rozszerzeniach w nazwach plików:
.tex, .sty, .pdf, .eps, .ps, .png, .jpg.


Co będzie?

* Dlaczego TeX?
* Praca z programem *texworks*
* Budowa typowego dokumentu latechowego
* Rozszerzanie funkcjonalności latexa za pomocą
  dodatkowych bibliotek:
   *  `\usepackage{hyperref}`
   *  `\usepackage{graphics}`


## Dlaczego TeX a nie… ?

* [TeX Users Group] [tug] (*TUG*)
* [Polska Grupa Użytkowników Systemu TeX] [gust] (*GUST*)
* [arXiv.org e-Print archive] [arxiv] (*arXiv*)



## Praca z programem *texworks*

Cykl: edycja, kompilacja, podgląd.

Kod z błędami.

Korzystamy z szablonów.

    ~/.TeXworks/
    ...
    |-- templates
    |   |-- Basic XeLaTeX documents         # miejsce na nasze szablony
    |   |   |-- article-hyperref.tex
    |   |   `-- article-bibliography.tex
    |   |-- Basic LaTeX documents           # standardowe szablony
    |   |   |-- article.tex
    |   |   `-- letter.tex
    |   |-- Beamer presentations
    |   |   |-- conference-ornate-20min.en.tex
    |   |   |-- generic-ornate-15min-45min.en.tex
    |   |   `-- speaker_introduction-ornate-2min.en.tex
    |   `-- XeLaTeX documents
    |       `-- article-fontspec.tex
    ...

Konfigurujemy *texworks*. Gotowe szablony do pobrania:

* {%= link_to "article-hyperref.tex", "/doc/templates/article-hyperref.tex" %}
* {%= link_to "article-bibliography.tex", "/doc/templates/article-bibliography.tex" %}

Na koniec dwie uwagi:

1\. Na zajęciach będziemy korzystać z programu *xetex*.
Program ten potrafi czytać pliki w kodowaniu UTF-8
(domyślne kodowanie na *Sigmie*).

2\. Program *xetex* potrafi użyć do składu każdy font
zainstalowany w systemie. Nie potrafi tego program *tex*.

Listę zainstalowanych fontów otrzymamy wykonując polecenie:

    fc-list

Aby zainstalować lokalnie nowy font kopiujemy plik
z fontem do katalogu *~/.fonts* i wykonujemy polecenie:

    fc-cache -v -f ~/.fonts


<blockquote>
  {%= image_tag "/images/jkew.jpg", :alt => "[Jonathan Kew]" %}
  <p class="center">Jonathan Kew autor XeTeX-a</p>
</blockquote>

## Budowa typowego dokumentu latechowego

Szablon *article-hyperref.tex* pokazuje jak zmieniać wielkość fontu,
jak ustawia się rozmiar strony, jak zmieniać font,
jak wstawić spis treści (aby się złożył musimy
dwukrotnie skompilować dokument).

    :::latex
    % !TEX TS-program = xelatex
    % !TEX encoding = UTF-8

    % Szablon dokumentu:
    % XeLaTeX + klasa article + pakiet hyperref

    \documentclass[12pt]{article} % domyślne 10pt jest za małe

    \usepackage{fontspec} % dokumentacja „fontspec.pdf”
    \defaultfontfeatures{Mapping=tex-text} % konwencja: -- --- ,, ''
    \usepackage{xunicode}
    \usepackage{xltxtra}

    \setmainfont{DejaVu Serif} % zmień font na „DejaVu Serif”
                               % font powinien byc zainstalowany w systemie?

    \usepackage{geometry} % dokumentacja „geometry.pdf”
    \geometry{a4paper}

    \usepackage{hyperref} % wstaw odsyłacze

    \usepackage{graphicx} % polecenie \includegraphics, dokumentacja „epslatex.pdf”

    \usepackage[polish]{polyglossia} % najważniejszy pakiet

    \title{Historia mojej rodziny}
    \author{Hieronim Brzęczyszczykiewicz}
    %\date{} % odkomentuj aby usunąć datę lub wstaw jakąś datę między {}
             % jeśli tego nie zrobisz będzie drukowana aktualna data

    \begin{document}
    \maketitle % składaj tytuł

    \tableofcontents % składaj spis treści

    \section{Pierwsza sekcja}

    Akapity oddzielamy

    pustym wierszem.

    \subsection{Pierwsza podsekcja}

    Więcej tekstu.

    \end{document}

Wpisując swój tekst w powinniśmy zwrócić uwagę na to,
że LaTeX rezerwuje te znaki do swoich celów:

    %   $   #   &   \   {   }   ^   _   ~

Są to tzw. *znaki specjalne*. Jeśli chcemy wydrukować
któryś z tych znaków, to wklepujemy odpowiednio:

    \%  \$  \#  \&

Poniższe cztery znaki

    "   |   <   >

też są znakami specjalnymi. Jeśli je wpiszesz,
to zostaną wydrukowane zupełnie inne rzeczy.


## Bibliografia – pakiet *amsrefs*

Na stronie [The amsrefs package] [amsrefs] umieszczono
link do dokumentacji oraz przykładów.

Prosty przykład może wyglądać tak, plik *szablon.tex*:

    :::latex
    % !TEX TS-program = xelatex
    % !TEX encoding = UTF-8 Unicode

    \documentclass[12pt]{article}
    \usepackage{amsrefs}

    \usepackage{fontspec}
    \defaultfontfeatures{Mapping=tex-text}
    \usepackage{hyperref}
    \usepackage{xunicode}
    \usepackage{xltxtra}
    \usepackage{url} % do przełamywania url
    \usepackage[polish]{polyglossia}

    \begin{document}

    \section{Pierwszy rozdział}

    SGML~\cite{Goldfarb2002} jest to \emph{metajęzyk}
    służący do opisywania struktury i~zawartości dokumentów.

    \section{Drugi rozdział}

    Typowy proces produkcji dokumentów w~standardzie SGML
    podzielony jest na kilka części. Najważniejsze elementy tego
    procesu są opisane w~\cite{Eisenberg2002}.

    \begin{bibdiv}
    \begin{biblist}
      \bibselect{literatura}
    \end{biblist}
    \end{bibdiv}

    \end{document}

Plik z bibliografią może wyglądać tak, *literatura.ltb*:

    :::latex
    % !TEX TS-program = xelatex
    % !TEX encoding = UTF-8 Unicode

    \documentclass[12pt]{amsbook}
    \usepackage{amsrefs}

    \usepackage{fontspec}
    \defaultfontfeatures{Mapping=tex-text}
    \usepackage{xunicode}
    \usepackage{xltxtra}
    \usepackage[polish]{polyglossia}

    \raggedbottom

    \begin{document}

    \begin{bibdiv}
    \begin{biblist}

    \bib{Goldfarb2002}{book}{
        author={Charles F. Goldfarb},
        author={Paul Prescod},
         title={Charles F. Goldfarb's XML handbook},
       edition={Fourth},
     publisher={Princeton-Hall},
       address={Englewood Cliffs, NJ 07632, USA},
          date={2002},
          ISBN={0-13-065198-2; 978-0-13-065198-3},
    }
    \bib{Eisenberg2002}{article}{
        author={Andrew Eisenberg},
        author={Jim Melton},
         title={SQL\slash XML is making good progress},
          date={2002},
          ISSN={0000-0000},
       journal={SIGMOD},
        volume={31},
        number={2},
         pages={101\ndash 108},
    }

    \end{biblist}
    \end{bibdiv}
    \end{document}

Dokument *szablon.tex* kompilujemy dwukrotnie:

    xelatex szablon
    xelatex szablon


## Bibliografia klasycznie, czyli bibtex

Teraz przyjrzymy się bardziej skomplikowanemu dokumentowi.
Pokazuje on jak przygotowywać bibliografię w systemie LaTeX.

    :::latex
    % !TEX TS-program = xelatex
    % !TEX encoding = UTF-8 Unicode

    \documentclass[12pt]{article}
    \usepackage{geometry}
    \geometry{a4paper}

    \usepackage{fontspec}
    \usepackage{hyperref}
    \usepackage{xunicode}
    \usepackage{xltxtra}
    \usepackage{url}  % do przełamywania url
    \usepackage[polish]{polyglossia}

    \bibliographystyle{unsrt}

    \title{Bibliografia do przedmiotu\\,,Środowisko Programisty''}
    \author{Włodzimierz Bzyl}
    \date{20 października 2009}

    \begin{document}
    \maketitle
    \tableofcontents

    \section{Podstawy}\label{sec:basics}

    W fontach maszynowych, ang. \emph{monospaced fonts},
    wszystkie znaki mają taką samą  szerokość. Za pomocą takich
    fontów składane są listingi lub kod programów.

    \section{Poziom średnio zaawansowany}\label{sec:intermediate}

    W książce ,,\LaTeX\ Web Companion'' opisano
    format \LaTeX\ i podstawowe pakiety do niego.

    \section{Rzeczy zaawansowane}\label{sec:advanced}

    DocBookXsl jest ciekawym projektem. Więcej na ten temat
    można poczytać w~\cite{wiki.docbookxsl}.

    Do konwersji dokumentu z formatu latex na html najlepszym narzędziem
    jest~\cite[uwaga, system szuka nowego opiekuna]{Gurari.TeX4ht}.

    O fontach maszynowych już było na stronie~\pageref{sec:basics}.

    \bibliography{sp}

    \end{document}

Powyższy kod, po zapisaniu w pliku kompilujemy w taki sposób:

    xelatex pracka
    bibtex pracka
    xelatex pracka
    xelatex pracka

Potrzebne są 4 przebiegi. Dlaczego?

Plik z bibliografią użyty powyżej, *sp.bib*:

    :::bibtex
    @Book{Goossens.lwc,
      author       = "Michel Goossens and Sebastian Rahtz",
      title        = "{\LaTeX} Web Companion",
      publisher    = "Addison-Wesley",
      year         = "2001"
    }

    @Booklet{Gurari.TeX4ht,
      title        = {TeX4ht: {\LaTeX} and {\TeX} for Hypertext},
      author       = "Eitan Gurari",
      howpublished = "\url{http://www.cse.ohio-state.edu/~gurari/TeX4ht/}",
      year         = 2004,
    }

    @Booklet{Veillard.libxslt,
      author       = {Daniel Veillard},
      title        = {{LIBXSLT} --- The {XSLT C} library for {G}nome},
      howpublished = {\url{http://xmlsoft.org/XSLT}},
      year         = 2003,
    }

    @Booklet{wiki.docbookxsl,
      author       = "Wiki",
      title        = "{DocBook} {XSL} {Stylesheets}",
      howpublished = {\url{http://wiki.docbook.org/topic/DocBookXslStylesheets}},
      year         = 2004,
    }

    @Booklet{jsMath.examples,
      title        = {Examples of jsMath},
      author       = "Davide Cervone",
      howpublished = "\url{http://www.math.union.edu/~dpvc/jsMath/examples/welcome.html}",
      year         = 2009,
    }

Uwagi:

* polecenie *\ref{marker}* drukuje liczbę generowaną przez
  polecenie *\label{marker}*;
  jest to zwykle numer rozdziału, obrazka, równania, lub tabelki
* polecenie *\pageref{marker}* drukuje numer strony na której
  umieszczono *\label{marker}*
* *\cite[note]{key}* wypisuje odpowiedni numer z bibliografii
  z opcjonalna notką.


## Korzystamy z pakietów: polecenie \usepackage

Na koniec ,,groch z kapustą'', czyli wstawianie obrazków,
tabelek, korzystanie z koloru, notacja do wpisywania matematyki...

    :::latex
    % !TEX TS-program = xelatex
    % !TEX encoding = UTF-8 Unicode

    \documentclass[12pt]{article}

    \usepackage{geometry}
    \geometry{a4paper}

    \usepackage{fontspec}
    \defaultfontfeatures{Mapping=tex-text,Scale=MatchLowercase}
    \setmainfont[Mapping=tex-text]{Minion Pro:+onum}
    \setsansfont[Mapping=tex-text]{Myriad Pro}
    \setmonofont{Monaco}

    \usepackage{xunicode}
    \usepackage{xltxtra}
    \usepackage{hyperref}
    \usepackage{color}
    \usepackage{url}
    \usepackage{graphicx} % polecenie \includegraphics

    \usepackage[polish]{polyglossia}

    \title{\color{red}{Grafika, tabelki...}}
    \author{Włodzimierz Bzyl}
    \date{\color{blue}{20 października 2009}}

    \begin{document}

      \maketitle
      \tableofcontents
      \listoffigures
      \listoftables

    \section{Podstawy}\label{sec:podstawy}
    Książka ,,Sekunda komputera'' przedstawia to, co komputer
    robi w~ciągu jednej sekundy -- taki jest \emph{bynajmniej} główny
    kierunek rozważań.

    \section{Otoczenie verbatim}\label{sec:verbatim}

    W otoczeniu \emph{verbatim} umieszczamy kod programu,
    wynik wykonania polecenia powloki itp.
    \begin{verbatim}
    $ fc-list | egrep "TeX Gyre Schola"
    TeX Gyre Schola:style=Bold
    TeX Gyre Schola:style=Italic
    TeX Gyre Schola:style=Bold Italic
    TeX Gyre Schola:style=Regular
    \end{verbatim}

    \section{Matematyka}\label{sec:wzory}
    Ten wzór wszyscy znają: \(2+2=4\), a~ten jest znany tylko
    niektórym: \[ e^{2\pi i}=-1 \]
    Oba wzory wpisujemy w prosty sposób z~klawiatury:
    \verb|\(2+2=4\)| oraz
    \begin{verbatim}
    \[ e^{2\pi i}=-1 \]
    \end{verbatim}

    \section{Więcej matematyki}
    Jeszcze kilka wzorów:
    \[
      \int_0^1 f(x)\,dx = 1
    \]
    \[
      {n\choose k} \equiv {\lfloor n/p\rfloor \choose \lfloor k/p\rfloor}
         {{n\bmod p} \choose {k\bmod p}} \pmod p
    \]
    \[
      A = \pmatrix{x-\lambda & 1 & 0\cr
                     0 & x-\lambda & 1\cr
                     0 & 0 & x-\lambda\cr}
       \qquad\qquad
      \left\lgroup\matrix{a&b&c\cr d&e&f}\right\rgroup
      \left\lgroup\matrix{u&x\cr v&y\cr w&z}\right\rgroup
    \]

    \section{Ilustracje}\label{sec:ilustracje}

    Fajna ilustracja:
    \begin{figure}
      \caption{Całkowita wariacja}
      \label{fig:wariacje}
      \begin{center}
      \includegraphics[width=.75\textwidth]{diagram}
      \end{center}
    \end{figure}

    \section{Tabelki}\label{sec:tabelki}

    Moje wydatki umiesciłem w~tabelce:
    \begin{table}
    \caption{Wydatki}
    \label{tab:wydatki}
    \begin{center}
    \begin{tabular}{clr}
      &Pozycja&Kwota\\
    \hline
    1.&Książki&2,000\\
      &Oprogramowanie&500\\
    2.&Prąd&1,000\\
    \cline{3-3}
      &Razem&3,500
    \end{tabular}
    \end{center}
    \end{table}

    \end{document}

Uwaga: brakujący obrazek *diagram* przygotować w trakcie wykładu:

* korzystając z programu *inkscape*
* wstawić jakąś grafikę pobraną z internetu

### Inkscape

Z manuala: „Inkscape − an SVG (Scalable Vector Graphics) editing program.”
Od siebie dodam, że program jest łatwy w obsłudze,
a obejrzenie kilku tutoriali ze strony
[Inkscape tutorials for the novice artist](http://screencasters.heathenx.org/)
powinno przekonać do programu niedowiarków.


#### Linki

[gust]: http://www.gust.org.pl "GUST"
[gust doc]: http://www.gust.org.pl/doc "Dokumentacje — GUST"

[tug]: http://www.tug.org/ "TUG"

[arxiv]: http://arxiv.org/ "arXiv.org"

[amsrefs]: http://www.ams.org/tex/amsrefs.html "amsrefs doc"
