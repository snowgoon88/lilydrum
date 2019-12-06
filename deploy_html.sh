#!/bin/bash
#
# make html from latex in docs
# cleanup docs
# cssify nodesXX.html pages using python script
# copy an exended css style file
# copy cours.pdf

echo "**** LaTeX2HTML ******************"
latex2html -html_version 4.0,latin1,unicode -dir docs cours.tex
#BACK_PID=$!
#wait for cmd to end
#wait $BACK_PID

echo "**** Cleanin up ******************"
rm docs/images*

echo "**** CSSify nodes files **********"
./cssify.py

echo "**** Copy CSS and PDF ************"
cp cours.css docs
cp cours.pdf docs
