#!/bin/bash
#
# lytex to pdf, with cleaning options
#

# check arg
if [ $# -eq 0 ]; then
    echo "usage $0 [-nc|--no-clean -oc|--only-clean -h|--help] <filename>"
    exit;
fi

need_compile=true
need_cleaning=true
# check options
while true ; do
    case "$1" in
	-nc|--no-clean)
            need_cleaning=false; shift 1;;
	-oc|--only-clean)
            need_compile=false; shift 1;;
        -h|--help)
	    echo "usage $0 [-nc|--no-clean -oc|--only-clean -h|--help] <filename>"
	    exit;;
        *)
            file=$1;
            break;
    esac
done

if [ -z ${file} ]; then
    echo "Need a filename argument"
    echo "usage $0 [-nc|--no-clean -oc|--only-clean -h|--help] <filename>"
    exit;
fi

# filename strip of .lytex
obj=${file%.lytex}

# Lets compile to PDF
if [ "$need_compile" = true ]; then
   echo "*****************************************************************"
   echo "** Compiling to PDF *********************************************"
   echo "*****************************************************************"
   echo "lilypond-book --format=latex --pdf ${obj}.lytex"
   echo "latexmk --pdf ${obj}.tex"

   lilypond-book --format=latex --pdf ${obj}.lytex && latexmk --pdf $obj.tex
fi

if [ "$need_cleaning" = true ]; then
    echo "*****************************************************************"
    echo "** Cleaning *****************************************************"
    echo "*****************************************************************"
    latexmk -c ${obj}.tex
    # then directories
    list=`grep "\input{.*/lily.*tex}" ${obj}.tex`
    ## echo "${list}"

    for l in ${list}; do
        #echo "ori=${l}"
        nostart=${l#\\input\{}
        #echo "no=${nostart}"
        rep=${nostart%/lily*}
        #echo "rep=${rep}"
        echo "rm -rf ${rep}"
        rm -rf ${rep}
    done

    echo "rm ${obj}.dep ${obj}.tex"
    rm -f ${obj}.dep ${obj}.tex
    echo "rm snippet*.ly"
    rm -f snippet*.ly

    rm -f tmp*.pdf tmp*.out
fi

