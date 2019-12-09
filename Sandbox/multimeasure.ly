#(define (whiteunder grob) (grob-interpret-markup grob 
  (markup #:vcenter #:whiteout #:pad-x 1 (ly:grob-property grob 'text))))

inlineMMRN = {
  \once \override Score.MultiMeasureRest #'layer = #-2
  \once \override Score.MultiMeasureRestNumber #'layer = #-1
  \once \override Score.MultiMeasureRestNumber #'Y-offset = #0
  \once \override Score.MultiMeasureRestNumber #'stencil = #whiteunder
}


solos = {
  \override Score.MultiMeasureRest #'minimum-length = #20 
  \bar "|:"
  \inlineMMRN R2.*4 
  \inlineMMRN R2.*4 
  \inlineMMRN R2.*4 
  \inlineMMRN R2.*4 
  \inlineMMRN R2.*4 
  \inlineMMRN R2.*4 
  \bar ":|"
}

{
  \time 3/4
  \set Score.markFormatter = #format-mark-box-alphabet 
  \set Score.skipBars = ##t
  \override MultiMeasureRest #'expand-limit = 1
  s2.*8 
  \mark \default  
  s2.*8 
  \mark \default  
  s2.*8 
  \mark \default  
  s2.*12 
  \mark \default  
  s2.*8 
  \mark \default  
  \solos
}
