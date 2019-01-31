#!/usr/bin/env bash
# jirrezdex@gmail.com
# Jirrez Matheus

titulo="."
app="maim"
params="-u"
data=$(date +%Y-%m-%d--%H-%M-%S)
nome="Screenshot--${data}"
extensao=".png"
tipo="image/png"

if [ -f $HOME/.config/user-dirs.dirs ]; then
	source $HOME/.config/user-dirs.dirs
	dir="${XDG_PICTURES_DIR}/Screenshots/"
else
	dir="${HOME}/Imagens/Screenshots/"
fi

[ ! -d $dir ] && mkdir -p $dir

command -v $app >/dev/null 2>&1 || {
	msg="O aplicativo $app não está instalado" 

	command -v notify-send >/dev/null 2>&1 && {
		notify-send "ERRO" "$msg";
	} || {
		echo $msg;
	}

	exit 1;
}

	params="$params -u"
	arquivo="${nome}${extensao}"
	$app -d 2 $params ${arquivo}
	msg="$arquivo"

if [ ! -z $arquivo ]; then
	if [ $(pwd) != $dir ]; then
		mv $arquivo $dir
	fi
	xclip -selection c -t $tipo -i $dir$arquivo
fi

notify-send -i $titulo "Captura realizada" "$msg" -i $HOME/.config/dunst/icones/screenshot.png
exit 0
