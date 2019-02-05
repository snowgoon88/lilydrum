\version "2.18.0"

\include "general_def.ly"

%% ***************************************************************************
%% ***************************************************** Fifty Ways Steve GADD
%% ***************************************************************************
fiftyways = \drummode { 
  % Customizations
  \stemUp
  \slurDown
  \numericTimeSignature
  
  % Tempo and rehearsal marks
  % \mark #1

  \override Beam.positions = #'(5 . 5)   %% left right
  % Notes
  s4 s s s8 sn32_"R" sn_"R" sn_"L" sn_"L"
  \bar ".|:"
  <bd hhp>16 hh_"L" sn_"R" hhp
  hh_"L" sn_"R" hh_"L" bd 
  <bd tomfh>4
  sn32^>_"R" sn32^>_"R" sn16_"L" sn16_"R" sn16_"L" |

  <bd hhp>16 hh_"L" sn_"R" hhp
  hh_"L" sn_"R" hh_"L" bd 
  bd4
  <tomfh tomml>8^> sn32_"R" sn_"R" sn_"L" sn_"L"
  
  \bar ":|."
}
% ====== Layout customizations
\score
{
  <<
    \set Score.markFormatter = #format-mark-circle-numbers
    \override Score.RehearsalMark #'X-offset = #0.5
    \new DrumStaff
    <<
      \set DrumStaff.drumStyleTable=#(alist->hash-table md)
      \fiftyways
      %%\new DrumVoice {\voiceOne \up}
      %%\new DrumVoice {\voiceTwo \down}
    >>
  >>
  
  \layout {\context {\Score \remove "Bar_number_engraver"}}
  \header {
    piece = "50 ways to leave your lover"
    composer = "Steve GADD"
    url = "http://www.drummerworld.com/Videos/stevegadd50ways.html"
    }
}

%% ***************************************************************************
%% ******************************************************** linear Rick LATHAM
%% ***************************************************************************
lineargroove = \drummode {
  \stemUp
  \slurDown
  \numericTimeSignature
  \override Beam.positions = #'(5 . 5)   %% left right
  % Notes
  \bar ".|:"

  <bd hh>16_"R" \ghost sn_"L" hh_"R" sn^>_"L"
  hh_"R" hh_"R" \ghost sn_"L" bd
  hh_"R" \ghost sn_"L" <bd hh>_"R" hh_"R"
  sn^>_"L" hh_"R" hh_"R" \ghost sn_"L"
  |
  <bd hh>16_"R" \ghost sn_"L" hh_"R" sn^>_"L"
  hh_"R" hh_"R" \ghost sn_"L" bd
  hh_"R" \ghost sn_"L" <bd hh>_"R" hh_"R"
  sn^>_"L" hh_"R" hho8\laissezVibrer

  \bar ":|."
}
\score
{
  <<
    \set Score.markFormatter = #format-mark-circle-numbers
    \override Score.RehearsalMark #'X-offset = #0.5
    \new DrumStaff
    <<
      \set DrumStaff.drumStyleTable=#(alist->hash-table md)
      \lineargroove
    >>
  >>
  \layout {
    ragged-right = ##f    %% fin au bout de la ligne
    \context {\Score \remove "Bar_number_engraver"}
  }
  \header {
    piece = "Ex.40 Linear Groove"
    composer = "Rick LATHAM"
    url = "http://www.drummerworld.com/Videos/ricklathamlineargrooves.html"
    }
}

%% ***************************************************************************
%% ************************************* Variation «Indifference» Mike PORTNOY
%% ***************************************************************************
hhpnvar = \drummode {
   \stemUp
  \slurDown
  \numericTimeSignature
  \override Beam.positions = #'(5 . 5)   %% left right
  % Notes
  \mark #1 
   \bar ".|:"
   hh8[ hh] hh[ hh] hh[ hho] hhc[ hh] |
   hh8[ hh] hh[ hh] hh[ hh]  hh[ hh]

   \bar ":..:" \break

   \mark #2
   hh8[ hh] hh[ hh] hh[ hho] hhc[ hho] |
   hhc8[ hh] hh[ hh] hh[ hh]  hh \tuplet 3/2 {hh16 hh hh}

   \bar ":..:" \break

   \mark #3
   hh8[ hh] hh[ hh] hh[ hho] hhc[ hho] |
   hhc8[ hh] hh[ hh16 hh] hh16 hh16 hh8 r hh

   \bar ":..:" \break
   
   \mark #4
   hh8[ hh] hh[ hh] hh[ hho] hhc[ hh] |
   hh8[ hh] hh \tuplet 3/2 {hh16 hh hh} hh8[ hh] hh[ hh]

   \bar ":..:" \break

   \mark #5
   hh8[ hh] hh[ hh] hh[ hho] hhc[ hh] |
   hh8[ hh] hh[ hh16 hh] hh16 hh16 hh8 r cymc

   \bar ":..:" \break

   \mark #6
   hh8[ hh] hh[ hh] hh[ hho] hhc[ hho] |
   hhc8[ hh] hh[ hh16 hh] hh16 hh16 hh8 r hh16 hh16

   \bar ":..:" \break

   \mark #7
   hh8[ hh] hh[ hh] hh[ hho] hhc[ hho] |
   hhc8[ hh] hh[ hh16 hh] hh16 hh16 hh8 r4

   \bar ":|."
 }
sbpnvar = \drummode {  
  % Customizations
  \stemDown

  % Notes 1
  bd4 sn r8 bd r bd |
  r4 sn r sn

  % Notes 2
  bd4 sn r8 bd r bd |
  r4 sn r8 bd8 sn4

  % Notes 3
  bd4 sn r8 bd r bd |
  r4 sn bd8[ bd] sn[ bd]

  % Notes 4
  bd4 sn sn8[ bd] r8 bd | 
  r8 bd sn4 r8 bd sn8[ bd]

  % Notes 5
  bd4 sn sn8[ bd] r8 bd | 
  r8 bd sn4 bd8[ bd] sn8[ bd]

  % Notes 6
  bd4 sn sn8[ bd] r8 bd | 
  r8 bd sn4 bd8[ bd] sn4

  % Notes 7
  bd4 sn sn8[ bd] r8 bd | 
  r8 bd sn4 bd8[ bd] sn8[ bd]
}

\score
{
  <<
    \set Score.markFormatter = #format-mark-circle-numbers
    \override Score.RehearsalMark #'X-offset = #0.5
    \new DrumStaff
    <<
      \set DrumStaff.drumStyleTable=#(alist->hash-table md)
      \new DrumVoice {\voiceOne \hhpnvar}
      \new DrumVoice {\voiceTwo \sbpnvar}
    >>
  >>
  \layout {\context {\Score \remove "Bar_number_engraver"}}
  \header {
    piece = "Variation around «Indifferent»"
    composer = "Mike PORTNOY"
    url = "http://www.drummerworld.com/Videos/mikeportnoy4groovesdrumguru.html"
    }
}

%% ***************************************************************************
%% ************************************* Variation «Indifference» Mike PORTNOY
%% ***************************************************************************
tripletsoloroach = \drummode {
  \stemUp
  \slurDown
  \numericTimeSignature
  %\override Beam.positions = #'(5 . 5)   %% left right

  % Notes
  \tuplet 3/2 { tommh8 tommh sn }
  \tuplet 3/2 { sn tomfh tomfh }
  \tuplet 3/2 { tomfh sn sn }
  \tuplet 3/2 { sn tommh tommh }
  |
  \tuplet 3/2 { tomfh tomfh tomfh }
  \tuplet 3/2 { sn sn sn }
  \tuplet 3/2 { tommh tommh sn }
  \tuplet 3/2 { sn sn sn }
}
\score
{
  <<
    \set Score.markFormatter = #format-mark-circle-numbers
    \override Score.RehearsalMark #'X-offset = #0.5
    \new DrumStaff
    <<
      \set DrumStaff.drumStyleTable=#(alist->hash-table md)
      \tripletsoloroach
    >>
  >>
  \layout {
    \context {\Score \remove "Bar_number_engraver"}
    ragged-right = ##f    %% fin au bout de la ligne
  }
  \header {
    piece = "Classic triplet solo phrase"
    composer = "Max ROACH"
    url = "http://www.drummerworld.com/Videos/johnrileymaxroach.html"
    }
}
  
%% ***************************************************************************
%% ********************************************* DoubleCroche HH de Steve Gadd
%% ***************************************************************************
\pageBreak
snaresg = \drummode {
  \stemUp
  \slurDown
  \numericTimeSignature

  % Notes
  sn16_"R"^"Entrainement caisse claire" sn_"L" sn_"R" sn_"L"
  \acciaccatura sn8 sn16_"R" sn_"L" sn_"R" sn_"L"
  sn_"R" sn_"L" sn_"R" sn_"L"
  \acciaccatura sn8 sn16_"R" sn_"L" sn_"R" sn_"L" 
}
hhgrovesg = \drummode {
  \stemUp
  \slurDown
  \numericTimeSignature

  % Notes
  \bar ".|:"
  \mark #1
  hh16^"R" hh^"L" hh^"R" hh^"L"
  hh^"L"   hh^"L" hh^"R" hh^"L"
  hh16^"R" hh^"L" hh^"R" hh^"L"
  hh^"L"   hh^"L" hh^"R" hh^"L"

  \mark #2
  \bar ":..:"
  % Notes
  cymr16^"R" hh^"L" hh^"R" hh^"L"
  cymr^"R"   hh^"L" hh^"R" hh^"L"
  cymr^"R" hh^"L" hh^"R" hh^"L"
  cymr^"L"   hh^"L" hh^"R" hh^"L"

  \bar ":|."
}
snbdgrovesg = \drummode {
  \stemDown

  % Notes
  bd4 sn_"R" bd sn_"R"

  bd4 sn_"L" bd sn_"L"

  
}
  
\score
{
  <<
    \set Score.markFormatter = #format-mark-circle-numbers
    \override Score.RehearsalMark #'X-offset = #0.5
    \new DrumStaff
    <<
      \set DrumStaff.drumStyleTable=#(alist->hash-table md)
      \snaresg
    >>
  >>
  \layout {\context {\Score \remove "Bar_number_engraver"}}
  \header {
    piece = "Hihat Groove en double croche"
    composer = "Steve GADD"
    url = "https://www.youtube.com/watch?v=ZSiuK4Mt9gs"
    }
}

\score
{
  <<
    \set Score.markFormatter = #format-mark-circle-numbers
    \override Score.RehearsalMark #'X-offset = #0.5
    \new DrumStaff
    <<
      \set DrumStaff.drumStyleTable=#(alist->hash-table md)
      \new DrumVoice {\voiceOne \hhgrovesg}
      \new DrumVoice {\voiceTwo \snbdgrovesg}
    >>
  >>
}


% ===== Page customizations
\paper{
  #(set-paper-size "a4")
  indent=#0
  line-width=#200
  %%oddFooterMarkup=##f
  %%oddHeaderMarkup=##f
  %%bookTitleMarkup = ##f
  scoreTitleMarkup = \markup {
    \column {
      \fill-line {
        \fromproperty #'header:piece
        \bold \fromproperty #'header:composer
      }
      \line {
        \fromproperty #'header:url
      }
    }
  }
}