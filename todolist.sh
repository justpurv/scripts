#!/bin/bash

DIR="$HOME/Documents/java_codes/projects"

cd "$DIR" || exit 1

javac toDoList.java "$@" && java toDoList "$@"
