
\version "2.18.2"

noteCibleTransposition =   d,   % c         % d pour Si b %  a, pour Mi b

ton = " - Si b"

\include "main.ly"

% pour générer du MIDI
\score {
  <<
    \new Staff \with {midiInstrument = #"electric piano 1"}
        <<
            \transpose c \noteCibleTransposition {
              \unfoldRepeats{\melodie}
            }
        >>
    \new Staff \with {midiInstrument = #"electric piano 1"}
        <<
            \unfoldRepeats{\harmonie}
        >>
  >>
\midi{ \tempo 4 = 140 }
}
