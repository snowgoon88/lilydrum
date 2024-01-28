\version "2.24.0"

%% Affiche tous les frappes possibles

\include "general_def.ly"

%% Toutes les têtes de notes
\score {
  <<
    \new DrumStaff \with {
      \remove "Time_signature_engraver"
    }
    << \allheads >>
  >>
}

%% 
\score {
  <<
    \new DrumStaff \with {
      %%\remove "Bar_engraver"
      \remove "Time_signature_engraver"
      %%\hide Stem
      \override Stem.Y-extent = ##f
    }
    <<
      \set DrumStaff.drumStyleTable = #(alist->hash-table md)
      \new DrumVoice = "mus" { \defnote }
      \new Lyrics \lyricsto "mus" \defname
    >>
  >>
}

% ===== Empty page
\paper{
  indent=#0
  line-width=#200
  oddFooterMarkup=##f
  oddHeaderMarkup=##f
  bookTitleMarkup = ##f
  scoreTitleMarkup = ##f
}