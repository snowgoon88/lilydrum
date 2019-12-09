\version "2.12.2"

\include "english.ly"

\header
{
    title    = "Chop marks example"
    composer = "Colin Hall"
}

timeandtempo = 
{
  \time 4/4
  \tempo 4 = 115
}

keytimeandtempo = 
{
  \key bf \minor
  \timeandtempo
}

date = #(strftime "%d-%b-%Y" (localtime (current-time))) 

commonEndnotes = \markup
{
  \column
  {
    \small
    {
      \line { " " }
      \line { "Example of how to create chop marks using the slash notehead" }
      \line { \date }
    }
  }
}

harmonyIntro = \chordmode
{
  bf1:m |
  bf1:m |
  bf1:m |
  c2:7 f2:7 |
}

pianoRightIntro =
{
  <bf df' f'>2_\markup \small { "L.H."} ~ <a df' f'>2 |
  <af! df' f'>2 ~ <g df' f'>2 |
  <gf! df' f'>2 ~ <f df' f'>2 |
  \override NoteHead #'style = #'slash
  \override Stem #'transparent = ##t
  bf'4 bf'4 bf'4 bf'4 |
  \revert NoteHead #'style
  \revert Stem #'transparent

}

pianoLeftIntro =
{
  s1 |
  s1 |
  s1 |
  <e bf>2 <ef a>2 |
}


\score
{
  <<
    \new ChordNames
    {
      \set chordChanges = ##f
      \override ChordName #'font-size = #0.75
      \harmonyIntro
    }
    
    \new PianoStaff
    <<
      \override Score.MetronomeMark #'padding = #5.0
      \set Score.skipBars = ##t
      \set PianoStaff.instrumentName = #"Piano"
      \set PianoStaff.connectArpeggios = ##t

      \new Staff
      {
        \clef treble
        {
	  \keytimeandtempo
          \pianoRightIntro
        }
      }
      
      \new Staff
      {
        \clef bass
        {
	  \keytimeandtempo
          \pianoLeftIntro
        }
      }
    >>
  >>

  \layout {}
}

\commonEndnotes
