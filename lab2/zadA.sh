#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 2
#
# Celem zajęć jest nabranie doświadczenia w podstawowej pracy z powłoką Bash,
# w szczególności w nawigowaniu po drzewie katalogów i sprawdzaniu uprawnień.
# Proszę unikać wykorzystywania narzędzia `find` w ramach bieżących zajęć.
#
# Nie przywiązujemy wagi do środowiska roboczego – zakładamy, że jego pliki,
# inne niż te podane wprost w treści zadań, mogą ulec zmianie, a przygotowane
# rozwiązania nadal powinny działać poprawnie (robić to, o czym zadanie mówi).
#
# Wszystkie chwyty dozwolone, ale ostatecznie w wyniku ma powstać tylko to,
# o czym mowa w treści zadania – tworzone samodzielnie ewentualne tymczasowe
# pliki pomocnicze należy usunąć.
#

#
# Zadanie 10.
# W katalogu `dane/deep/` i wszystkich jego podkatalogach odnaleźć wszystkie
# pliki zwykłe, których nie możemy przeczytać ze względu na brak uprawnień
# dostępu. Zwrócić ścieżki do odnalezionych plików względem katalogu `dane/`.
# Opracowany skrypt powinien działać niezależnie od istniejącej liczby
# i poziomów podkatalogów.
#
# Wskazówka: pomocne może być zdefiniowanie funkcji i jej rekurencje wywołanie.
#

check_directory() {
    for f in $(pwd)/*; do
        if [ -f "$f" ] && [ ! -r "$f" ]; then
            echo $f | sed 's/\/home\/antoni\/so2\/lab2\/dane\///'
        elif [ -d "$f" ]; then
            cd $f
            check_directory
        fi
    done;
}

shopt -s dotglob
cd dane/deep
check_directory
