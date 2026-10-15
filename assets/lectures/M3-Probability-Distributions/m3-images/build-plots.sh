#!/bin/sh
# Rebuild the precomputed plot PDFs used in the M3 lectures.
# Usage: ./build-plots.sh [name ...]   (default: every plot listed below)
# All pages of a plot are cropped to the same bounding box so it doesn't shift between overlays.
set -e
cd "$(dirname "$0")"
[ $# -gt 0 ] || set -- joint-marginal-surface water-levels-joint-pdf
for name in "$@"; do
  pdflatex -interaction=nonstopmode "$name.tex" >/dev/null
  bbox=$(gs -q -dNOPAUSE -dBATCH -sDEVICE=bbox "$name.pdf" 2>&1 |
    awk '/%%BoundingBox/ { if (!n++ || $2<x0) x0=$2; if (n==1 || $3<y0) y0=$3;
                           if (n==1 || $4>x1) x1=$4; if (n==1 || $5>y1) y1=$5 }
         END { print x0, y0, x1, y1 }')
  pdfcrop --bbox "$bbox" "$name.pdf" "$name.pdf" >/dev/null
  rm -f "$name.aux" "$name.log" "$name.nav" "$name.out" "$name.snm" "$name.toc"
done
