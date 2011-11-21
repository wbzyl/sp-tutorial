#### {% title "Odpowiedzi do ćwiczeń" %}

<blockquote>
  {%= image_tag "/images/algorithm.png", :alt => "[Rozwiązanie…]" %}
</blockquote>


1\. Rozpakowywanie „w locie” archiwum na zdalnym komputerze.

Przykład:

    :::bash
    tar cf - . | ( cd /home/backup ; tar xf - )

Tworzymy drzewko z plikami do testowania:

    :::bash
    mkdir -p secret/{a,b/{c,d}}
    touch  secret/{a/x,b/c/y}

Krok po kroku:

    :::bash
    tar cf secret.tar secret
    cat secret.tar | ssh wbzyl@backup.sigma.ug.edu.pl "cat > backup/secret.tar"

albo krótko:

    :::bash
    tar -c secret --to-stdout | ssh wbzyl@backup.sigma.edu.pl "cat > backup/secret.tar"

Z rozpakowaniem w locie:

    :::bash
    tar -c secret --to-stdout | ssh wbzyl@backup.sigma.edu.pl "tar x --"

Z rozpakowaniem w locie i zmianą katalogu::

    :::bash
    tar -c secret --to-stdout | ssh wbzyl@backup.sigma.ug.edu.pl "( cd backup ; tar x -- )"

Polecenia na deser:

    :::bash
    ssh wbzyl@backup.sigma.ug.edu.pl "tree backup/secret"
    ssh wbzyl@backup.sigma.ug.edu.pl "rm -r secret"

2\. [HOWTO Log Bash History to Syslog](http://jablonskis.org/2011/howto-log-bash-history-to-syslog/).
Po co? „You may wonder what problem I was trying to solve? Right, the
issue is that I want to log root users bash history from multiple
servers to a central syslog box. I also want to preserve root users
history on each server for convenience purposes.

    :::bash
    PROMPT_COMMAND='history -a >(logger -t "$USER[$$] $SSH_CONNECTION")'

3\. [Give me that one command you wish you knew years ago](http://www.reddit.com/r/linux/comments/mi80x/give_me_that_one_command_you_wish_you_knew_years/).

Dopisujemy swój klucz publiczny do pliku z listą autoryzowanych kluczy
na innym komputerze:

    :::bash
    cat ~/.ssh/id_dsa.pub | ssh me@remotebox "cat >> ~/.ssh/authorized_keys"

To samo co:

    ssh-copy-id

Zapisz info o działających procesów z innego komputera:

    :::bash
    ssh ja@innykomputer "ps auxf" | cat > ~/ProccessesForRemoteBox

Też fajne:

    :::bash
    cp some_file $OLDPWD
    dmidecode

Ciekawe:

    lscpi
    lsusb
    lsof

Dużo przykładów z [lsof](http://danielmiessler.com/study/lsof/).

Ekstra fajny *find*:

    :::bash
    find -name "*.rb" -exec ls {} +

Zamiennik na to samo z *xargs*: „gather up your matches and run your
command on them in batches”.

Inne polecenia: *pstree*, *sl*.
