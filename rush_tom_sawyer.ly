\version "2.24.0"

\include "general_def.ly"

%% ***************************************************************************
%% *********************************************************** RUSH Tom Sawyer
%% ***************************************************************************

vonehh = \drummode {
  % Customizations
  \stemUp
  \slurDown
  \numericTimeSignature
  \time 4/4

  hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] |
  hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] |
  hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] |
  hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] |
  hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] |
  hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] |
  hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] |
  hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] |
  hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] |
  hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] |
  hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] |
  hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] hh16[ hh hh hh] |
  cymc8.[ cymc16] s8 cymc8 r16 cymc8 r16 cymc4
  
}

vonemel = \drummode {
  % Customizations
  \stemDown
  \override Beam.positions = #'(-4 . -4)   %% left right

  bd4 sn4 r8 bd8 sn4 |                                  %%1
  bd4 sn4 r8 bd8 sn16[ bd16] r8 |
  bd4 sn4 bd8[ bd] sn4 |
  bd4 sn4 bd8[ bd] sn16[ bd16] r8|
  bd16[ bd8 bd16] sn4 r8 bd8 sn4 |                      %%5
  bd16[ bd8 bd16] sn4 r8 bd8 sn16[ bd16] r8 |
  bd16[ bd8 bd16] sn4 r8 bd16[ bd] sn8[ bd] |
  bd16[ bd8 bd16] sn4 r8 bd16[ bd] sn16[ bd16 bd8] |
  bd16[ bd8 bd16] sn4 r8 bd8 sn4 |                      %%9
  bd16[ bd8 bd16] sn4 r8 bd8 sn16[ bd16] r8 | 
  bd16[ bd8 bd16] sn4 r8 bd16[ bd] sn8[ bd] |
  bd16[ bd8 bd16] sn4 r8 bd16[ bd] sn16[ bd16 bd8] |
  bd8 sn16[ bd16] r8 bd8 sn16[ bd8 sn16] bd16[ bd sn sn]  
}

\score
{
  <<
    \set Score.rehearsalMarkFormatter = #format-mark-circle-numbers
    \override Score.RehearsalMark.X-offset = #0.5
    \new DrumStaff
    <<
      \set DrumStaff.drumStyleTable=#(alist->hash-table md)
      \new DrumVoice {\voiceOne \vonehh}
      \new DrumVoice {\voiceTwo \vonemel}
    >>
  >>
}