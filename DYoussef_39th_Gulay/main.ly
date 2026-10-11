indent = 0

melodie =  \relative c''{
  \key b \minor
  \numericTimeSignature
  \repeat volta 2 { \time 11/8
  fis4 a a g8[ fis g fis16 fis e8] |
  fis4 a a g8[ fis g fis16 fis e8] | \break
  fis8[ g16 fis] e4 d8 fis8[ g16 fis] e2 |\break
  \time 6/8 fis8 e d8 d4 d8 |
  \time 13/8 d8[ des d e] c8[ c16 d c8 b b~] b2 |
  \time 8/8 d8[ des d e] c8[ c16 d c8 b8] | d[ des d e8~] e2 |
  \time 10/8 d8[ des d e] c8[ c16 d c8 b] b4 \break }
}



harmonie =  \chordmode{  
  \repeat volta 2 {\time 11/8
b1:min7 s4. |
b1:min7 s4. |
g1:maj7 s4.  | 
  \time 6/8 b2.:min7 |
  \time 13/8 g2:maj7 c2:7 b2:min7 s8   |
  \time 8/8  g2:maj7 c2:7 | b1:min7  |
  \time 10/8 g2:maj7 c2:7 b4:min7 }
}



\header {
  title = #(string-append "39th Gulay" ton )
  tagline =  ""
  composer = "Dhafer Youssef"
}



\score{
  <<
    \new ChordNames {
      \transpose c \noteCibleTransposition{
	\harmonie
      }
    }
    \new Staff { 
      \transpose c \noteCibleTransposition {
      \melodie
      }
    }
  >>
  \layout{ \context {      \Score      proportionalNotationDuration = #(ly:make-moment 4 30     )   } }
}





