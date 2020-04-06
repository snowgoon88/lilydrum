%% ***************************************************************************
%% ** notes, \swing, \ghost sn ***********************************************
%% ***************************************************************************
% ====== Drum notations customized
#(define md '(
  (ridecymbal    cross    #f          6)
  (ridebell      triangle   #f          5)
  (crashcymbal   xcircle      #f          6)
  (splashcymbal  harmonic   #f          6)
  (pedalhihat    cross      #f         -5)
  (hihat         cross      #f          5)
  (halfopenhihat cross      "halfopen"  5)
  (closedhihat   cross      "stopped"   5)
  (openhihat     cross      "open"      5)
  (snare         default    #f          1)
  (sidestick     harmonic   #f          1)
  (cowbell       triangle   #f          6)
  (himidtom      diamond    #f          2)
  (lowmidtom     diamond    #f          0)
  (highfloortom  diamond    #f         -1)
  (lowfloortom   diamond    #f         -2)
  (bassdrum      default    #f         -4)
  (oneup         default    #f          5)
  (longwhistle   slash      #t          0)
))

allheads = \drummode { 
  \stemUp
  sn4 
  \override NoteHead #'style = #'cross sn4
  \override NoteHead #'style = #'xcircle sn4
  \override NoteHead #'style = #'diamond sn4
  \override NoteHead #'style = #'slash sn4
  \override NoteHead #'style = #'harmonic sn4
  \override NoteHead #'style = #'triangle sn4
}

defnote = \drummode {
  sn4^"snare" ss s2 |
  bd4^"feet" s hhp s |
  hh4^"hat" hho hhho hhc
  cymr4^"ride" s rb s |  
  tommh4^"tom" tomml tomfh tomfl |
  cymc4^"crash" cb s2 |
}

defname = \lyricmode {
  sn ss |
  bd hhp |
  hh hho hhho hhc |
  cymr rb |
  tommh tomml tomfh tomfl |
  cymc cb
}


%% function to add an accent
%% usage sn^\act
act = \markup { \left-align \musicglyph #"scripts.sforzato" }

%% function to add right or left (open or filled circle) below notes
%% usage sn_\left
left = \markup {\center-column {\draw-circle #0.5 #0.1 ##t }}
right= \markup {\center-column {\draw-circle #0.5 #0.1 ##f }}

%% function to add a ghost note
%% usage \ghost sn
ghost = #(define-music-function
          (parser location note)
          (ly:music?)
          #{
          \parenthesize \tweak font-size -4 #note
          #})

%% Function to add a single Percent
%% usage \makePercent note
makePercent =
#(define-music-function
  (parser location note) (ly:music?)
  "Make a percent repeat the same length as NOTE."
  (make-music 'PercentEvent
   'length (ly:music-length note)))


%% Function that display Percent with repeat
%% usage  \makePercentRepeat "     x2" s1
makePercentRepeat =
#(define-music-function
  (parser location txt note) (string? ly:music?)
  "Make a percent repeat the same length as NOTE."
  #{
  \mark \markup { #txt }
  \makePercent #note
  #}
)
% ======= Swing ======================================
swing = \mark \markup { 
  \line \general-align #Y #DOWN { \score { 
  \new Staff \with {
    fontSize = #-2
    \override StaffSymbol #'line-count = #0 
    \override VerticalAxisGroup #'Y-extent = #'(0 . 0)
  }
  \relative { 
    \stemUp 
    \override Score.SpacingSpanner 
      #'common-shortest-duration = #(ly:make-moment 3 16) 
    \override Beam #'positions = #'(2.5 . 2.5)
    b'8[ b8] 
  }
  \layout {
    ragged-right= ##t
    indent = 0
    \context { 
    \Staff \remove "Clef_engraver" 
    \remove "Time_signature_engraver" }
  }} " ="
  \score { \new Staff \with {
    fontSize = #-2
    \override StaffSymbol #'line-count = #0 
    \override VerticalAxisGroup #'Y-extent = #'(0 . 0)
  }
  \relative { 
    \stemUp 
    \override Score.SpacingSpanner 
      #'common-shortest-duration = #(ly:make-moment 3 16)
    \override Beam #'positions = #'(2.5 . 2.5)
    \times 2/3 { b'8[ r b8] } 
  }
  \layout {
    ragged-right= ##t
    indent = 0
    \context { 
      \Staff 
      \remove "Clef_engraver" 
      \remove "Time_signature_engraver" }
    }}
  \fontsize #-2
  \italic { "  swing" }
  }
}
%% ***************************************************************************