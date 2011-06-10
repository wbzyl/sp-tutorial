#### {% title "Laboratorium 4" %}

1\. Wyświetl listę plików z aktualnego katalogu, zamieniając
wszystkie małe litery na duże.

2\. Wyświetl listę praw dostępu do plików w aktualnym katalogu, ich
rozmiar i nazwę.

3\. Wyświetl listę plików w aktualnym katalogu, posortowaną według
rozmiaru pliku.

4\. Wyświetl zawartość pliku */etc/passwd* posortowaną według numerów
UID w kolejności od największego do najmniejszego.

5\. Wyświetl zawartość pliku */etc/passwd* posortowaną najpierw
według numerów GID w kolejności od największego do najmniejszego, a
następnie UID.

6\. Podaj liczbę plików każdego użytkownika.

7\. Sporządź statystykę praw dostępu (dla każdego z praw dostępu
podaj ile razy zostało ono przydzielone).

Czy potrafisz odpowiedzieć jaki będzie efekt wykonania poniższych
poleceń?

    :::bash
    ls -l > lsout.txt                          #  1
    ls -la >> lsout.txt                        #  2
    ps >> psout.txt                            #  3
    free -m >> ~/wynik                         #  4
    kill -1 1234 > killout.txt 2>killerr.txt   #  5
    kill -1 1234 > killout.txt 2>&1            #  6
    kill -1 1234 > /dev/null 2>&1              #  7
    sort psout.txt > pssort.txt                #  8
    ps | sort > pssort.txt                     #  9
    cat lsout.txt | sort > lssort.txt          # 10
    who | sort | more                          # 11
    who | sort | less                          # 12
