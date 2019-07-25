#!/bin/sh

if [ $# -eq 1 ] && [ $1 = "clean" ]
then
	rm gtk_window gtk_window_oop term_emu
else
	valac --pkg gtk+-3.0 gtk_window.vala
	valac --pkg gtk+-3.0 oop/gtk_window_oop.vala
	valac --pkg gtk+-3.0 --pkg vte-2.91 term_emu_gtk_vte/term_emu.vala
fi
