\version "2.18.0"

\include "general_def.ly"

\header
{
    title    = "Haven't met you yet"
    %%%composer = "???"
}

%% ***************************************************************************
%% ********************************************************************** Saxo
%% ***************************************************************************

upchahh = \drummode {hh4 <hh sn>8 hh hh4 <hh sn>8 hh }
upchacy = \drummode {cymr4 <cymr sn>8 cymr cymr4 <cymr sn>8 cymr }

dochahh = \drummode { bd4 r4 r4 r8 bd8 }
dochahhb = \drummode { bd4 r4 bd4 r8 bd8 }                         
dochacy = \drummode { bd4 hhp bd hhp}
dochacyb = \drummode { bd4 hhp bd hhp8 bd8 }
                            
upintro = \drummode {
  \numericTimeSignature
  \override Rest #'staff-position = 0                           
  \override Beam.positions = #'(5 . 5)   %% left right
  \compressFullBarRests
  \override MultiMeasureRest.expand-limit = #1
  \override MultiMeasureRest.staff-position = 0
  
  \mark "Swing"
  R1*3
  %%\repeat unfold 3 {r1}
  r2 r8 sn8 sn4
  cymc4 <hh sn>8 hh hh4 <hh sn>8 hh |
  \repeat percent 3 \upchahh
  \break                      

  hh4 r4 r2
  \repeat unfold 2 {r1}
  r2 r8 sn8 sn4                      
  cymc4 <hh sn>8 hh hh4 <hh sn>8 hh |
  \repeat percent 2 \upchahh
  hh4 <hh sn>8 sn sn <cymc sn>8^( <cymc sn>4)
  \break
}

dointro = \drummode {
  \override Rest #'staff-position = -5                            
  \repeat unfold 4 {s1}
  \dochahh
  \repeat percent 3 \dochahh

  bd4 s4 s2
  \repeat unfold 3 {s1}
  \dochahh
  \repeat percent 2 \dochahh
  bd4 bd4 r8 bd8_( bd4)
}

upa = \drummode {
  \bar ".|:"
  %%\mark "17"

  \repeat volta 2 {
  
  \repeat percent 7 \upchacy
  cymr4 cymr8 cymr8 \tuplet 3/2 {<cymc sn>8 sn sn} sn8 cymc8
  \repeat percent 4 \upchacy

  \dynamicUp
  cymr4\< <cymr sn>8 cymr cymr4 <cymr sn>8\! hh
  ss8 ss ss ss ss4 ss8 ss
  r4 r \tuplet 3/2 {tommh8 tommh tommh} \tuplet 3/2 {tomfh8 tomfh tomfh}
  cymc1
  \break
  }

  \alternative {
    %% repeat 1
    {
      \repeat percent 11 \upchahh
      hh4 <hh sn>8 sn sn <cymc sn>8^( <cymc sn>4)
      \break
    }
    %% repeat 2
    {      
      \repeat percent 8 {hh4 <hh sn> hh <hh sn>}
      hh4^"FILL" <hh sn> hh <hh sn>
      \break
    }                                                
  }
}
doa = \drummode {
  \repeat volta 2 {                           
  \repeat percent 7 \dochacyb
  bd4 r4 r bd8 bd8
  \repeat percent 4 \dochacyb

  \dochacyb
  s1
  s1
  bd1
  }

  \alternative {
    {
      %% repeat 1
      \repeat percent 11 \dochahhb
      bd4 bd4 r8 bd8_( bd4)
    }
    {
      %% repeant 2
      \repeat percent 8 \dochahh
      \dochahhb
    }
  }
}

upb = \drummode {
  ss4 ss ss ss
  \upchacy  
  ss4 ss ss ss
  \repeat percent 4 \upchacy
  ss8 ss \tuplet 3/2 {ss8 ss ss} ss8 ss \tuplet 3/2 {ss8 ss ss}
  \break
}
dob = \drummode {
  bd4 bd bd bd
  \dochacy
  bd4 bd bd bd
  \repeat percent 4 \dochacy
  s1 %% fill 61
}

upc = \drummode {
  cymc4 <hh sn>8 hh hh4 <hh sn>8 hh
  \repeat percent 6 \upchahh
  hh4 sn4 \tuplet 3/2 {tommh8 tommh tommh} \tuplet 3/2 {tomfh8 tomfh tomfh}
  cymc1                               
  \break
}
doc = \drummode {
  bd4 hhp bd hhp
  \repeat percent 6 \dochahh
  bd4 s4 s s
  bd1
}

upd = \drummode {
  R1*6
  \upchahh
  \upchahh
  hh4 <hh sn>4 \tuplet 3/2 {sn8\< sn sn} sn8 cymc8^(
  \bar "||"
  cymr4\!) <cymr sn>8 cymr cymr4 <cymr sn>8 cymr       
  \repeat percent 5 \upchacy
  cymr4 <cymr sn>4 \tuplet 3/2 {tommh8 tommh tommh} \tuplet 3/2 {tomfh8 tomfh tomfh}
  cymr1
  \bar "||"      
  \break      

  \repeat percent 15 \upchahh
  <cymc sn>2^"Rythme" <cymc sn>2
  <cymc sn>1                            
}
dod = \drummode {
  \repeat unfold 6 {s1}
  \dochahh
  \dochahh
  bd4 r4 r4 bd8 bd8_(
  bd4) r4 bd r4
  \repeat percent 5 \dochacy
  bd4 hhp s4 s4
  bd1

  \repeat percent 15 \dochahh
  bd2 bd2
  bd1
}


\score
{
  <<
    \set Score.markFormatter = #format-mark-circle-numbers
    \override Score.RehearsalMark #'X-offset = #0.5
    \new DrumStaff
    <<
      \set DrumStaff.drumStyleTable=#(alist->hash-table md)
      \new DrumVoice {
        \voiceOne
        
        \upintro
        \upa
        \upb
        \upc
        \upd
        }
        
      \new DrumVoice {
        \voiceTwo

        \dointro
        \doa
        \dob
        \doc
        \dod
      }
      %%\new DrumVoice {\voiceOne \up}
      %%\new DrumVoice {\voiceTwo \down}
    >>
  >>
  
  \layout {
    \context {
      \Score %%\remove "Bar_number_engraver"
      \override MeasureCounter.direction = #DOWN
    }}
  \header {
    composer = "???"
    url = "???"
    }
}