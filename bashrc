# Histfile
HISTSIZE=-1        # Nieograniczona liczba linii w historii
HISTFILESIZE=-1     # Nieograniczona wielkość pliku historii
HISTTIMEFORMAT="%F %T " # Opcjonalnie: Dodaje znacznik czasu do każdej komendy w historii (YYYY-MM-DD HH:MM:SS)
PROMPT_COMMAND="history -a" # Dodaje komendy do pliku historii po każdym poleceniu
shopt -s histappend # Dodaje nowe komendy do pliku historii, zamiast go nadpisywać
shopt -s checkwinsize # Zmienia rozmiar okna terminala, aktualizuje historię

# Funkcja do pobierania nazwy brancha Git
git_branch() {
  branch=$(git branch 2>/dev/null | grep "^\*" | cut -c 3-)
  if [[ ! -z "$branch" ]]; then
    echo " ($branch)"
  fi
}

# Ustawienie kolorów
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
NORMAL="\[\033[0m\]"

# Ustawienie prompta
PS1="$GREEN\u@\h$BLUE \w$RED\$(git_branch)$NORMAL \$ "