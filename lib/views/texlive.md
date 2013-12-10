#### {% title "Nie tylko TeXLive" %}

<blockquote>
  {%= image_tag "/images/forgetting-curve.png", :alt => "[Hermann Ebbinghaus forgetting curve]" %}
  <p>The forgetting curve illustrates the decline of memory retention in time. […]
    In 1885, <a href="http://en.wikipedia.org/wiki/Forgetting_curve">Hermann Ebbinghaus</a>
    discovered the exponential nature of forgetting.</p>
</blockquote>

Na *Sigmie* zainstalowany jest system TeX z paczki *TeXLive*.
Dokumentację do systemu można pobrać z serwera
[Polskiej Grupy Użytkowników Systemu TeX] [gust doc].

W pracowniach będziemy korzystać z najnowszej wersji
systemu TeX zawartej w „TeXLive 2010” z programem
*xetex* w wersji 3.1415926-2.2-0.9995.2
i biblioteką kpathsea version 5.1.0.

Do pracy z dokumentami techowymi będziemy używać programu
*texworks* w wersji co najmniej 0.3 (r.511).


## Konfiguracja systemu TeXLive

Tylko podstawowe informacje.

TeX Live to ok. 35000 plików (razem, +1GB).
Pliki te są umieszczone w „drzewach katalogów” o korzeniach:

    <D> directories:
       TEXDIR (the main TeX directory):
         /usr/local/texlive/2013
       TEXMFLOCAL (directory for site-wide local files):
         /usr/local/texlive/texmf-local
       TEXMFSYSVAR (directory for variable and automatically generated data):
         /usr/local/texlive/2013/texmf-var
       TEXMFSYSCONFIG (directory for local config):
         /usr/local/texlive/2013/texmf-config
       TEXMFVAR (personal directory for variable and automatically generated data):
         ~/.texlive2013/texmf-var
       TEXMFCONFIG (personal directory for local config):
         ~/.texlive2013/texmf-config
       TEXMFHOME (directory for user-specific files):
         ~/texmf

Listę korzeni drzewek otrzymamy wykonując polecenie:

    kpsewhich -expand-var \$TEXMF

System TeX konfigurujemy edytując plik *texmf.cnf*.
Plik ten odszukujemy w systemie w taki sposób:

    kpsewhich texmf.cnf
    /usr/share/texmf/web2c/texmf.cnf

Zawartość tego pliku można podejrzeć w taki sposób:

    less $(kpsewhich texmf.cnf)


## Instalacja TeXLive bezpośrednio z internetu

Na stronie [TeX Live availability](http://www.tug.org/texlive/acquire.html)
znajdziemy link do instalki systemu bezpośrednio z internetu
„TeX Live installation over the Internet”:
[Linux](http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz)
[Windows](http://mirror.ctan.org/systems/texlive/tlnet/install-tl.zip).

Po rozpakowaniu archiwum, uruchamiamy skrypt:

    sudo ./install-tl

i po chwili widzimy, że będziemy musieli czekać z tydzień, zanim
zostaną ściągnięte wszystkie pakiety. Aby przyspieszyć instalację
wymieniamy domyślnie ustawiony serwer z którego pobierane są pakiety:

    sudo ./install-tl -location ftp://ftp.gust.org.pl/tex-archive/systems/texlive/tlnet/tlpkg/

Domyślne ustawienie drzewek techowych w TeXLive:

    TEXDIR (the main TeX directory):
      /usr/local/texlive/2008
    TEXMFLOCAL (directory for site-wide local files):
      /usr/local/texlive/texmf-local
    TEXMFSYSVAR (directory for variable and automatically generated data):
      /usr/local/texlive/2008/texmf-var
    TEXMFSYSCONFIG (directory for local config):
      /usr/local/texlive/2008/texmf-config
    TEXMFHOME (directory for user-specific files):
      ~/texmf

### tlmgr – TeX Live package manager

System uaktualniamy korzystając z programu
[tlmgr](http://www.tug.org/texlive/tlmgr.html):

Kilka poleceń na dobry początek:

    tlmgr update --all
      Make your local TeX installation correspond to what
      is in the package repository (typically on CTAN).
    tlmgr update --list
      Report what would be updated without actually updating anything.
    tlmgr show pkgname
      Display detailed information about pkgname,
      such as the installation status and description

\([dokumentacja](http://www.tug.org/texlive/doc/tlmgr.html)\)


<blockquote>
  {%= image_tag "/images/TeXworks.png", :alt => "[TeXworks]" %}
</blockquote>

## TeXworks – IDE dla systemu TeX

Do kompilacji programu *texworks* będą potrzebne pakiety devel:

    x-software-development
    development-tools
    poppler-devel poppler-qt4-devel
    qt-devel
    hunspell-devel
    dbus-devel

oraz system kontroli wersji *subversion*.

Zaczynamy od pobrania z repozytorium najnowszej wersji:

    svn checkout http://texworks.googlecode.com/svn/trunk/ texworks-read-only

Zmieniamy katalog, generujemy plik *Makefile*, kompilujemy sam program:

    cd texworks-read-only
    qmake-qt4
    make

Jeśli nie było błędów uruchamiamy program:

    ./texworks

Na koniec kopiujemy program, ikonkę programu oraz ikonkę na pulpit:

    sudo cp ./texworks /usr/local/bin/
    sudo cp ./res/images/TeXworks-doc-48.png /usr/share/pixmaps/
    cp ./texworks.desktop ~/Desktop/


<blockquote>
  {%= image_tag "/images/marcin_wolinski.jpg", :alt => "[Marcin Woliński]" %}
  <p class="center">Marcin Woliński</p>
</blockquote>

## Obłożenie klawiatury dla programisty

„Starannie zaprojektowane obłożenie klawiatury, zapewniające dostęp do
wszystkich potrzebnych symboli, jest istotnym elementem wygodnego
środowiska pracy osoby zajmującej się składem tekstu. W wypadku TeX-a
wiele symboli można uzyskać za pomocą poleceń, ale ponieważ powoli
standardem kodowania tekstu staje się Unicode, tych znaków, które
zostały uwzględnione w Unikodzie, wygodniej jest używać
bezpośrednio. Oczywiście pod warunkiem, że nie wymaga to szukania
znaków w «tablicy symboli».”
Marcin Woliński. [Racjonalna polska klawiatura dla programisty i&nbsp;typografa] [mw keyboard].

Opis instalacji łatki dla Ubuntu ze strony autora:

W terminalu przejść do katalogu */usr/share/X11/xkb/*:

    cd /usr/share/X11/xkb/

Nałożyć pobraną łatę na pliki definicyjne klawiatury poleceniem *patch*:

    sudo patch -b -p1 < ...ścieżka/do/mwplkeyb.ubuntu9.04.diff

Dla bezpieczeństwa można najprzód wykonać powyższe polecenie na próbę:

    patch --dry-run -b -p1 < ...ścieżka/do/mwplkeyb.ubuntu9.04.diff

i dopiero jeśli odpowie, że może z powodzeniem nałożyć wszystkie
łatki, wykonać polecenie powyżej.

Uaktywnić ten układ klawiatury w sposób właściwy dla danego środowiska
graficznego. W GNOME można go wyklikać z menu

    System ↦ Preferencje ↦ Klawiatura
      Układy ↦ Dodaj ↦ Kraj: Polska, Wariant: «International (with dead keys)».

Z terminala można aktywować nasz układ klawiatury dla bieżącej sesji poleceniem:

    setxkbmap 'pl(intl)'

Dla trwałego efektu trzeba by je dodać do jakiegoś skryptu
inicjującego sesję X Window.


<blockquote>
  {%= image_tag "/images/bop.jpg", :alt => "[autorzy Latin Modern]" %}
  <p class="center">od lewej: P.&nbsp;Strzelczyk, B. Jackowski, J.&nbsp;M. Nowacki</p>
</blockquote>

## Fonty Latin Modern

[Rodzina fontów Latin Modern w formacie OTF] [lm].
Ręczna instalacja w systemie? Kopiujemy archiwum do drzewka
*lokalnego* i tam je rozpakowujemy. Na koniec wykonujemy
polecenie: `mktexlsr` (albo `texhash`).


## I-Ching

Ściągamy mój pakiet [I-ching Divinations] [i-ching].
Instalujemy go i poprawiamy skrypt *dod.sh*, tak
aby korzystał z fontów PFB (a nie z fontów PK).

Teraz uruchamiamy skrypt i po jego wykonaniu oglądamy wróżbę:

    gv your-divination.ps

Skrypt *dod.sh* korzysta z programu *tex*.
Czy zamiast programu *tex* można użyć programu *xetex*?


## Inkscape

Z manuala: „Inkscape − an SVG (Scalable Vector Graphics) editing program.”

Od siebie dodam, że program jest łatwy w obsłudze,
a obejrzenie kilku tutoriali ze strony
[Inkscape tutorials for the novice artist](http://screencasters.heathenx.org/)
powinno przekonać do programu niedowiarków.


## Pandoc

[Cytat] [pandoc]: „Pandoc is a Haskell library for converting from one markup
format to another, and a command-line tool that uses this library. It
can read markdown and (subsets of) reStructuredText, HTML, and LaTeX,
and it can write markdown, reStructuredText, HTML, LaTeX, ConTeXt,
PDF, RTF, DocBook XML, OpenDocument XML, ODT, GNU Texinfo, MediaWiki
markup, groff man pages, and S5 HTML slide shows.”


#### Linki

[gust doc]: http://www.gust.org.pl/doc "Dokumentacje — GUST"
[lm]: http://www.gust.org.pl/projects/e-foundry/latin-modern/download "Latin Modern collection"
[mw keyboard]: http://marcinwolinski.pl/keyboard/ "Racjonalna polska klawiatura dla programisty…"

[i-ching]: http://www.ctan.org/tex-archive/fonts/psfonts/i-ching/ "I-Ching Divinations"

[pandoc]: http://johnmacfarlane.net/pandoc/ "Pandoc"
