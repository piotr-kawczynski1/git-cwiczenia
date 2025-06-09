#!/bin/bash

function show_help {
    echo "Dostępne opcje:"
    echo "--date (-d)           : wyświetla dzisiejszą datę"
    echo "--logs [N] (-l [N])   : tworzy N plików logx.txt (domyślnie 100)"
    echo "--error [N] (-e [N])  : tworzy N folderów errorx/errorx.txt (domyślnie 100)"
    echo "--help (-h)           : pokazuje tę pomoc"
    echo "--init                : klonuje repozytorium i ustawia PATH"
}

case "$1" in
    --date|-d)
        date
        ;;
    --logs|-l)
        count=${2:-100}
        for ((i=1; i<=count; i++)); do
            echo -e "Nazwa pliku: log$i.txt\nSkrypt: $0\nData: $(date)" > "log$i.txt"
        done
        ;;
    --error|-e)
        count=${2:-100}
        for ((i=1; i<=count; i++)); do
            mkdir -p "error$i"
            echo -e "Plik: error$i.txt\nSkrypt: $0\nData: $(date)" > "error$i/error$i.txt"
        done
        ;;
    --help|-h)
        show_help
        ;;
    --init)
        git clone https://github.com/piotr-kawczynski1/git-cwiczenia.git
        export PATH=$PATH:$(pwd)/git-cwiczenia
        echo "Repozytorium sklonowane i dodane do PATH"
        ;;
    *)
        echo "Nieznana opcja. Użyj --help, aby zobaczyć dostępne komendy."
        ;;
esac
