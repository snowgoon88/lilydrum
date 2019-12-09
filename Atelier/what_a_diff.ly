\version "2.18.0"

\include "general_def.ly"

\header
{
    title    = "What a difference a day made"
    %%composer = "???"
}


%% ***************************************************************************
%% ********************************************************************** Saxo
%% ***************************************************************************
drumup = \drummode {
  \override Beam.positions = #'(4 . 4)   %% left right
  \compressFullBarRests
  
  %% intro
  s1 |

  %% UMARK 1
  \repeat unfold 15 {
    s1
  }
  \override Rest #'staff-position = 0
  r2 r4 r8 sn16 sn

    %% UMARK 2
  \repeat percent 14 {
    \override Stem #'transparent = ##t
    whl4 whl whl whl
    \revert Stem #'transparent
    %sn4 sn8 sn sn4 sn8 sn
  } |
  r8 sn4. sn4 sn | sn8 r8 \tuplet 3/2 {sn8 sn sn} sn4 r8 sn8
  \break
  
  %% UMARK 3
  \repeat percent 7 {
    \override Stem #'transparent = ##t
    whl4 whl whl whl
    \revert Stem #'transparent
  }
  r4 r r r8 sn

  %% UMARK 4
  \repeat percent 8 {
    \override Stem #'transparent = ##t
    whl4 whl whl whl
    \revert Stem #'transparent
  }

  %% UMARK 5
  \repeat percent 6 {
    \override Stem #'transparent = ##t
    whl4 whl whl whl
    \revert Stem #'transparent
  }
  r8 sn4 sn4 sn8\noBeam sn sn |
  s1

  %% UMARK 6
  \repeat unfold 5 {
    s1
    }
   \repeat percent 3 {
    \override Stem #'transparent = ##t
    whl4 whl whl whl
    \revert Stem #'transparent
  }

  %% UMARK 7
  \repeat percent 10 {
    \override Stem #'transparent = ##t
    whl4 whl whl whl
    \revert Stem #'transparent
  }
  r8 sn\noBeam sn r sn[ sn] r sn |
  sn8 r sn8 sn_( sn2)_( |
  sn1 )
}

drumdown = \drummode {
  %%\stemUp
  %%\slurDown
  \numericTimeSignature
  \override Rest #'staff-position = -5
  %%\override Rest #'staff-position = 0
  \override MultiMeasureRest #'staff-position = 0
  %%\compressFullBarRests
  %% Notes using 'oneup'
  s1 |

  %% end, middle, start
  \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \set Score.currentBarNumber = #1
  
  %% DMARK 1
  \mark \markup {\box 1}
  %%\compressFullBarRests

  \repeat unfold 16 {
    s1
    }
  \break

  %% DMARK 2

  \mark \markup {\box 2}
  % \repeat unfold 8 {
  %   \override Stem #'transparent = ##t
  %   whl4 whl whl whl
  %   \revert Stem #'transparent
                                % } |
  \repeat percent 14 {
    %%r4 hhp r hhp
    s1
  } |
  s1 | s1 |
  % \repeat unfold 4 {
  %   \override Stem #'transparent = ##t
  %   whl4^"???" whl whl whl
  %   \revert Stem #'transparent
  % } |

  %% DMARK 3
  \mark \markup {\box 3}
  \repeat unfold 8 {
    s1
  } |
  \break

  %% DMARK 4
  \mark \markup {\box 4}
  \repeat unfold 8 {
    s1
  } |
  \break

  %% DMARK 5
  \mark \markup {\box 5}
  \repeat unfold 8 {
    s1
  }
  \break

  %% DMARK 6
  \mark \markup {\box 6}
  \repeat unfold 8 {
    s1
  } |
  %%\break

   %% DMARK 7
  \mark \markup {\box 7}
  \repeat unfold 13 {
    s1
  } |
  %%\break
  
  % ua2. ua8 ua  |
  % ua1 |
  % r8 ua4. r4 ua8 ua |
  % ua1 |

  % %% DUMM
  % \mark \markup {DUMMY}
  % ua4 r ua8 ua ua4 |
  % \override Stem #'transparent = ##t
  % whl4 whl whl whl
  % \revert Stem #'transparent
}



saxo = \drummode {
  \override Rest #'staff-position = 0
  \override MultiMeasureRest #'staff-position = 0
  \compressFullBarRests
  
  %% intro
  R1 |

  %% SMARK 1
  R1 * 8
  R1 * 7
  s1

  %% SMARK 2
  \repeat unfold 8 {
    s1
  } |
  \break
  \override Rest #'staff-position = 5
  r8 ua4.( ua4) ua8 ua( | ua1 )
  r8 ua4.( ua4) ua8 ua( | ua1 )
  r4 r  ua8 ua r4
  \repeat unfold 3 {
    s1
  }
  
  %% SMARK 3
  r8 ua r ua r4 r | r4 r r r8 ua | r8 ua r ua r4 r
  r4 r r r8 ua | r8 ua r ua r4 r |
  r4 r r r8 ua( | ua8[) ua] ua[ ua(^\act] ua8[) ua8] ua8[ ua8^\act]
  \repeat unfold 1 {
    s1
  }

  %% SMARK 4
  s1 | s1 |
  r8 ua r4 r r | s1
  r8 ua r4 r r | s1
  ua8[ ua^\act] r4 ua8[ ua^\act] r4 |
  \dynamicUp
  r8 ua8_( ua2)\< r4\!

  %% SMARK 5
   \repeat unfold 7 {
    s1
  }
  %%r8 ua4 ua4 ua8\noBeam ua ua |
  \override Rest #'staff-position = 0
  r1 |

  %% SMARK 6
  \repeat unfold 5 {
    r1
  }
   \repeat unfold 2 {
    s1
  }
  \override Rest #'staff-position = 5
  r4 ua ua ua
  \break

  %% SMARK 7
  \repeat unfold 13 {
    s1
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
      
      \new DrumVoice {\voiceOne \drumup}
      \new DrumVoice {\voiceTwo \drumdown}
      \new DrumVoice {\voiceThree \saxo}
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