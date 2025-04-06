# $1: name of the c file to compile to assembly
# $2 output path
opt="$(echo $3 | sed -e "s/-O0/$(cat /etc/gcc.opt)/g") -fno-inline -Wno-error -finline-limit=2"
if ! cc -g -Wall -S -masm=intel -I3rd/lua $opt -fPIC --shared "$1" -o "$2" -Iskynet-src; then
	echo "error compile to asm"
	exit 1
fi
