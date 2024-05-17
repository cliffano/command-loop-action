<img align="right" src="https://raw.github.com/cliffano/command-loop-action/master/avatar.jpg" alt="Avatar"/>

[![Build Status](https://github.com/cliffano/command-loop-action/workflows/CI/badge.svg)](https://github.com/cliffano/command-loop-action/actions?query=workflow%3ACI)
<br/>

Command Loop GitHub Action
--------------------------

A simple GitHub Action for running a command in a loop against a list of items.

The items are comma or space-separated strings. The items can be referenced in the command using `$ITEM`.

Usage
-----

    jobs:
      build:
        steps:
          - uses: cliffano/command-loop-action@main
            with:
              items: '1 2 3'
              command: 'echo "Count $ITEM"'
