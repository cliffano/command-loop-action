<img align="right" src="https://raw.github.com/cliffano/command-loop-action/master/avatar.jpg" alt="Avatar"/>

[![Build Status](https://github.com/cliffano/command-loop-action/workflows/CI/badge.svg)](https://github.com/cliffano/command-loop-action/actions?query=workflow%3ACI)
<br/>

Command Loop GitHub Action
--------------------------

A simple GitHub Action for running a shell command in a loop against a list of items.

The items are comma and/or space-separated strings. Each item can be referenced in the command using `$ITEM`.

Usage
-----

Looping through a space-separated list of items:

    jobs:
      build:
        steps:
          - name: 'Count from 1 to 10 with space-separated items'
            uses: cliffano/command-loop-action@main
            with:
              items: '1 2 3 4 5 6 7 8 9 10'
              command: 'echo "Count $ITEM"'

Looping through a comma-separated list of items:

    jobs:
      build:
        steps:
          - name: 'Count from 1 to 10 with comma-separated items'
            uses: cliffano/command-loop-action@main
            with:
              items: '1,2,3,4,5,6,7,8,9,10'
              command: 'echo "Count $ITEM"'

Looping through a comma and space-separated list of items:

    jobs:
      build:
        steps:
          - name: 'Count from 1 to 10 with comma and space-separated items'
            uses: cliffano/command-loop-action@main
            with:
              items: '1, 2, 3, 4, 5, 6, 7, 8, 9, 10'
              command: 'echo "Count $ITEM"'

Looping through a list of items from an environment variable:

    env:
      NUMBERS: '1, 2, 3, 4, 5, 6, 7, 8, 9, 10'
    jobs:
      build:
        steps:
          - name: 'Count from 1 to 10 with items from an environment variable'
            uses: cliffano/command-loop-action@main
            with:
              items: ${{ env.NUMBERS }}
              command: 'echo "Count $ITEM"'

Looping through a list of items with custom delimiters:

    jobs:
      build:
        steps:
          - name: 'Count from 1 to 10 with colon-separated items'
            uses: cliffano/command-loop-action@main
            with:
              items: '1:2:3:4:5:6:7:8:9:10'
              command: 'echo "Count $ITEM"'
              delimiters: ':'