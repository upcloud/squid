#!/bin/sh
#
# Usage:
#         calc-must-ids.sh [MustID]
# Given an id it searches for the related Must expression in all
# source files. If no arguments given it returns all Must expressions 
# with its ids and their  exact position in the source files.
#
# Example usage:
#     # ./scripts/calc-must-ids.sh 0xB79EF14
#     ./src/adaptation/ecap/MessageRep.cc:356: 0xB79EF14 Must(false);
#

if test -z "$1"; then
    find . -name "*.cc" -o -name "*.h" -o -name "*.cci" | \
        xargs `dirname $0`/calc-must-ids.pl
else
    find . -name "*.cc" -o -name "*.h" -o -name "*.cci" | \
        xargs `dirname $0`/calc-must-ids.pl | grep ": $1 "
fi

