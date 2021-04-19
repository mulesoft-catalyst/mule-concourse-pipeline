#!/usr/bin/env bash

_get_current_sem_ver() {
    cat $1/$2
}

_get_git_ref() {
    cat $1/.git/refs/heads/$2
}

get_build_version() {
    echo $(_get_current_sem_ver $1 $2)-$(_get_git_ref $3 $4)
}