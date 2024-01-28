%% ***************************************************************************
%% ** Create an empty musicscore
%% ***************************************************************************

\version "2.24.0"



\header {
  tagline=""
}
\paper {
  #(set-paper-size "a4")
  top-margin = 2.0\cm
}
emptymusic = {
  \repeat unfold 12 % Change this for more lines.
  { s1\break }
}
\layout { 
  indent = 0.0\cm
  pagenumber = no
}
\new Score \with {
  \override TimeSignature.transparent = ##t
  \override Clef.transparent = ##t
  measureBarType = #""
  \remove Bar_number_engraver
  \remove Clef_engraver
} <<
  \context Staff \emptymusic
>>
