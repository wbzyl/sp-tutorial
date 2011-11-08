#### {% title "Odpowiedzi do ćwiczeń" %}

<blockquote>
  {%= image_tag "/images/algorithm.png", :alt => "[Rozwiązanie…]" %}
</blockquote>


1\. Rozpakowywanie „w locie” archiwum na zdalnym komputerze.

Przykład:

    :::bash
    tar cf - . | ( cd /home/backup ; tar xf - )

Tworzymy drzewko z plikami do testowania:


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
