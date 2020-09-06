#!/usr/bin/env bats

load ../helper

@test 'bash with homeshick_dir override' {
  castle 'dotfiles'
  local result
  result=$( HOMESHICK_DIR=$_TMPDIR/nowhere homeshick 2>&1 >/dev/null ) || true
  [[ "$result" =~ "/nowhere/" ]] || false
}

@test 'fish with homeshick_dir override' {
  [ "$(type -t fish)" = "file" ] || skip "fish not installed"
  cmd="source \"$HOMESHICK_DIR/homeshick.fish\"; set HOMESHICK_DIR \"$_TMPDIR/nowhere\"; homeshick"
  local result
  result=$( fish <<< "$cmd" 2>&1 >/dev/null ) || true
  [[ "$result" =~ "/nowhere/" ]] || false
}

@test 'csh with homeshick_dir override' {
  [ "$(type -t csh)" = "file" ] || skip "csh not installed"
  cmd="set HOMESHICK_DIR=/nowhere; source \"${HOMESHICK_FN_SRC_CSH}\""
  local result
  result=$( csh <<< "$cmd" 2>&1 >/dev/null )
  [[ "$result" =~ "/nowhere/" ]] || false
}
