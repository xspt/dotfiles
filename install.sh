#!/bin/bash

if [ ! "${0%/*}" = "." ]; then
   cd "${0%/*}"
fi

BACKUPDIR="$HOME/dotfiles_old"

for D in */; do
   dir="${D::-1}"
   path="$HOME/.config/$dir"

    # verifica se o caminho existe
    if [ -d "$path" ]; then
       # o caminho existe e é um link simbólico
       if [ -L "$path" ]; then
          printf "removendo link simbólico: $path\n\n"
          unlink $path
          # o caminho existe e é um diretório
       else
          backup="$BACKUPDIR/$dir"
          printf "Movendo $path para $backup\n\n"
          if [ ! -d "$backup" ]; then
             mkdir -p "$backup"
          fi
          mv $path $backup
       fi
    fi

    printf "Criando link simbólico em $HOME/.config/ para $dir\n\n"
    ln -sr $dir "$HOME/.config"
 done
