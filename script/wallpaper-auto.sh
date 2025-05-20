#!/bin/bash

# Caminho da pasta com seus wallpapers
WALLPAPER_DIR="$HOME/Imagens/wallpaper/FMAB"

# Tempo entre cada troca (em segundos)
INTERVAL=300  # 5 minutos

# Verifica se o swww está rodando
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    sleep 1
fi

# Loop para percorrer todos os wallpapers em ordem
while true; do
    # Percorre todos os arquivos de imagem na pasta
    for IMG in "$WALLPAPER_DIR"/*.{jpg,png}; do
        if [[ -f "$IMG" ]]; then
            # Aplica o wallpaper com transição suave (transição fade)
            swww img "$IMG" --transition-type fade --transition-duration 2
            sleep "$INTERVAL"
        fi
    done
done
