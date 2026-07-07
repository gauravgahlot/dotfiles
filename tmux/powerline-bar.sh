#!/bin/sh
# Palette-inheriting powerline status bar for tmux (loaded from ~/.tmux.conf).
# Separator glyphs are produced with printf (octal UTF-8) so this file stays
# pure ASCII -- an editor/linter in this environment strips literal glyphs.
#   U+E0B0 = \356\202\260   (right-pointing separator, for left-aligned items)
#   U+E0B2 = \356\202\262   (left-pointing separator,  for right-aligned items)
#
# tmux replaces non-ASCII option values with "_" unless the invoking client is
# in a UTF-8 locale, so force one here (scoped to this script; harmless).
export LC_ALL=en_US.UTF-8
L=$(printf '\356\202\260')
R=$(printf '\356\202\262')

tmux set -g window-status-separator ""
tmux set -g status-justify absolute-centre
tmux set -g status-left "#[fg=black,bg=green,bold] #S #[fg=green,bg=default,nobold]${L} "
tmux set -g window-status-format "#[fg=default,bg=default] #I:#W#F "
tmux set -g window-status-current-format "#[fg=black,bg=green,bold] #I:#W#F #[fg=default,bg=default,nobold]"
# tmux-continuum auto-save trigger: runs on each status refresh and saves every
# @continuum-save-interval minutes. Embedded here (rather than relying on
# continuum to inject it) so auto-save survives regardless of plugin load order.
# Guarded to be a no-op if continuum isn't installed; uses the same absolute
# path continuum uses, so continuum de-dupes it instead of adding a second copy.
CONT_SAVE="$HOME/.tmux/plugins/tmux-continuum/scripts/continuum_save.sh"
[ -x "$CONT_SAVE" ] && SAVE_HOOK="#($CONT_SAVE)" || SAVE_HOOK=""
tmux set -g status-right "${SAVE_HOOK}#[fg=brightblack,bg=default]${R}#[fg=default,bg=brightblack] %H:%M #[fg=green,bg=brightblack]${R}#[fg=black,bg=green,bold] %d-%b #[fg=brightblack,bg=green]${R}#[fg=default,bg=brightblack] #H "
