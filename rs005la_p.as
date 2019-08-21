.***************************************************************************
.*=== AS GROUP ===         : ASE_010100X3Q 2016/02/04 17:57
.*USER IF AS               : UASE010100X3Q 2016/02/04 17:57
.*USER IF TP               : UTPE010100X3Q 2016/02/04 17:56
.*ARM CONTROL AS           : AASE010100X3Q 2016/02/04 17:57
.*USER IF AS MESSAGE FILE  : MASE0100X3QEN 2016/02/04 17:57
.*USER IF TP MESSAGE FILE  : MTPE0100X3QEN 2016/02/04 17:56
.*ARM DATA FILE            : ARME010100X3Q 2016/02/04 17:56
.*KERNEL                   : _KNL102600000 2015/07/31
.*DRIVER                   : _DRV104200000 2015/01/30
.*RFS                      : _RFS100800100 2012/07/27
.*=== SERVO GROUP ===      : SVE_08000004H 2016/06/29 22:46
.*ARM CONTROL SERVO        : ASVE08000004H 2016/06/29 22:44
.*SRV DATA FILE            : ASPE08000004H 2016/06/29 22:44
.*ARM CONTROL SERVO FPGA   : ASFE08000000A 2015/04/01 09:29
.*
.*Cpu board type           : 1VA
.*=== WEB SERVER ===       : WBE_000000005
.*   [Shipment setting data] 
.*There is no Shipment setting data.
.***************************************************************************
.NETCONF     192.168.0.2,"timesys-",255.255.255.0,192.168.0.1,0.0.0.0,0.0.0.0," "
.NETCONF2     192.168.11.2,255.255.255.0,0.0.0.0
.PROGRAM a.home() #9744
  HOME
.END
.PROGRAM a.main() #0
;input if statement to do offset
; IF DEMO_MODE = TRUE
; THEN
; CALL m.params(rbt_spd, pgm_accu)
; CALL go.home
; STABLE 0.2
; CALL demo.m.upper
; STABLE 0.2
; CALL demo.m.lower
; STABLE 0.2
; CALL go.home
; ELSE
;.PROGRAM gen.offset()
  demo_mode = 17
  IF FALSE THEN
    LMOVE f.o;Frame origin point
    LMOVE f.x;Frame x-axis
    LMOVE f.y;Frame y-axis
  END
  POINT .frame = FRAME(f.o,f.x,f.y,f.o) ;Create the reference frame
  .no.letters = 14  ;Total number of letters
  .no.lp[1] = 8   ;Number of taught points for that letter 
  .no.lp[2] = 4
  .no.lp[3] = 32
  .no.lp[4] = 35
  .no.lp[5] = 15
  .no.lp[6] = 16
  .no.lp[7] = 34
  .no.lp[8] = 21
  .no.lp[9] = 31
  .no.lp[10] = 31
  .no.lp[11] = 13
  .no.lp[12] = 8
  .no.lp[13] = 9
  .no.lp[14] = 9
  FOR .i = 1 TO .no.letters         ;For each letter
    FOR .j = 0 TO .no.lp[.i]        ;For each point within the current letter
      POINT .p[.i,.j] = letter[.i,.j]     ;Duplicate each point so we can manipulate it without losing the original point
;        POINT p.offset[.i,.j] = -.frame + .p[.i,.j] ;Moved to intialise program
      POINT .p.rel[.i,.j] = .frame+p.offset[.i,.j]
      IF SIG(demo_mode) THEN
        POINT .p.rel[.i,.j] = TRANS(0,0,25)+.p.rel[.i,.j]
      END
    END
  END
;W1SET 1 = 20,200,40,0,0  ;volts,amps,travel speed,ww,wf
  CALL trace.part(.&p.rel[,])
  CALL go.home
; STABLE 0.2
; CALL m.upper
; STABLE 0.2
; CALL m.lower
; STABLE 0.2
; CALL go.home
; END
.END
.PROGRAM a.prime() #30227
  JOINT SPEED9 ACCU1 TIMER0 TOOL1 WORK0 CLAMP1 (OFF,0,0,O) OX= WX= #[36.46,37.629,-50.962,-67.778,-90.073,-1.3664] ;
.END
.PROGRAM a.run() #0
  CALL demo.upper.t
  DELAY 1
  CALL demo.upper.i
  DELAY 1
  CALL demo.upper.g
  DELAY 1
  CALL demo.upper.b
  DELAY 1
  CALL demo.upper.r
  DELAY 1
  CALL demo.upper.u
  DELAY 1
  CALL demo.upper.s
  DELAY 1
  CALL demo.upper.h
  DELAY 1
  CALL demo.l.s
  DELAY 1
  CALL demo.l.ss
  DELAY 1
  CALL demo.l.a
  DELAY 1
  CALL demo.l.l
  DELAY 1
  CALL demo.l.ll
  DELAY 1
  CALL demo.l.y
.END
.PROGRAM a.run_demo() #0
  WHILE 1 DO
    CALL a.home
    DELAY 1
    CALL demo.upper.t
    DELAY 1
    CALL demo.upper.i
    DELAY 1
    CALL demo.upper.g
    DELAY 1
    CALL demo.upper.b
    DELAY 1
    CALL demo.upper.r
    DELAY 1
    CALL demo.upper.u
    DELAY 1
    CALL demo.upper.s
    DELAY 1
    CALL demo.upper.h
    DELAY 1
    CALL demo.lower.s
    DELAY 1
    CALL demo.lower.ss
    DELAY 1
    CALL demo.lower.a
    DELAY 1
    CALL demo.lower.l
    DELAY 1
    CALL demo.lower.ll
    DELAY 1
    CALL demo.lower.y
    DELAY 1
    CALL a.home
  END
.END
.PROGRAM a.run_part() #0
  CALL a.home
  DELAY 1
  CALL part.upper.t
  DELAY 1
  CALL part.upper.i
  DELAY 1
  CALL part.upper.g
  DELAY 1
  CALL part.upper.b
  DELAY 1
  CALL part.upper.r
  DELAY 1
  CALL part.upper.u
  DELAY 1
  CALL part.upper.s
  DELAY 1
  CALL part.upper.h
  DELAY 1
  CALL part.lower.s
  DELAY 1
  CALL part.lower.ss
  DELAY 1
  CALL part.lower.a
  DELAY 1
  CALL part.lower.l
  DELAY 1
  CALL part.lower.ll
  DELAY 1
  CALL part.lower.y
  DELAY 1
  CALL a.home
.END
.PROGRAM all.points() #0
;Datum Points
  LMOVE datumpoint1
  LMOVE datumpoint2
  LMOVE datumpoint3
  LMOVE datumpoint4
;Home Position
  LMOVE homepoint
;Approach Points
  LMOVE tigbrushapproac
  LMOVE ssallyapproach
;Points for Letter T in Tigbrush
  LMOVE ulettert_point0
  LMOVE ulettert_point1
  LMOVE ulettert_point2
  LMOVE ulettert_point3
  LMOVE ulettert_point4
  LMOVE ulettert_point5
  LMOVE ulettert_point6
  LMOVE ulettert_point7
  LMOVE ulettert_point8
;Points for Letter I in Tigbrush
  LMOVE uletteri_point0
  LMOVE uletteri_point1
  LMOVE uletteri_point2
  LMOVE uletteri_point3
  LMOVE uletteri_point4
;Points for Letter G in Tigbrush
  LMOVE uletterg_point0
  LMOVE uletterg_point1
  LMOVE uletterg_point2
  LMOVE uletterg_point3
  LMOVE uletterg_point4
  LMOVE uletterg_point5
  LMOVE uletterg_point6
  LMOVE uletterg_point7
  LMOVE uletterg_point8
  LMOVE uletterg_point9
  LMOVE uletterg_point1
  LMOVE uletterg_point1
  LMOVE uletterg_point1
  LMOVE uletterg_point1
  LMOVE uletterg_point1
  LMOVE uletterg_point1
  LMOVE uletterg_point1
  LMOVE uletterg_point1
  LMOVE uletterg_point1
  LMOVE uletterg_point1
  LMOVE uletterg_point2
  LMOVE uletterg_point2
  LMOVE uletterg_point2
  LMOVE uletterg_point2
  LMOVE uletterg_point2
  LMOVE uletterg_point2
  LMOVE uletterg_point2
  LMOVE uletterg_point2
  LMOVE uletterg_point2
  LMOVE uletterg_point2
  LMOVE uletterg_point3
  LMOVE uletterg_point3
  LMOVE uletterg_point3
;Points for Letter B in Tigbrush
  LMOVE uletterb_point0
  LMOVE uletterb_point1
  LMOVE uletterb_point2
  LMOVE uletterb_point3
  LMOVE uletterb_point4
  LMOVE uletterb_point5
  LMOVE uletterb_point6
  LMOVE uletterb_point7
  LMOVE uletterb_point8
  LMOVE uletterb_point9
  LMOVE uletterb_point1
  LMOVE uletterb_point1
  LMOVE uletterb_point1
  LMOVE uletterb_point1
  LMOVE uletterb_point1
  LMOVE uletterb_point1
  LMOVE uletterb_point1
  LMOVE uletterb_point1
  LMOVE uletterb_point1
  LMOVE uletterb_point1
  LMOVE uletterb_point2
  LMOVE uletterb_point2
  LMOVE uletterb_point2
  LMOVE uletterb_point2
  LMOVE uletterb_point2
  LMOVE uletterb_point2
  LMOVE uletterb_point2
  LMOVE uletterb_point2
  LMOVE uletterb_point2
  LMOVE uletterb_point2
  LMOVE uletterb_point3
  LMOVE uletterb_point3
  LMOVE uletterb_point3
  LMOVE uletterb_point3
  LMOVE uletterb_point3
  LMOVE uletterb_point3
;Points for Letter R in Tigbrush
  LMOVE uletterr_point0
  LMOVE uletterr_point1
  LMOVE uletterr_point2
  LMOVE uletterr_point3
  LMOVE uletterr_point4
  LMOVE uletterr_point5
  LMOVE uletterr_point6
  LMOVE uletterr_point7
  LMOVE uletterr_point8
  LMOVE uletterr_point9
  LMOVE uletterr_point1
  LMOVE uletterr_point1
  LMOVE uletterr_point1
  LMOVE uletterr_point1
  LMOVE uletterr_point1
  LMOVE uletterr_point1
;Points for Letter U in Tigbrush
  LMOVE uletteru_point0
  LMOVE uletteru_point1
  LMOVE uletteru_point2
  LMOVE uletteru_point3
  LMOVE uletteru_point4
  LMOVE uletteru_point5
  LMOVE uletteru_point6
  LMOVE uletteru_point7
  LMOVE uletteru_point8
  LMOVE uletteru_point9
  LMOVE uletteru_point1
  LMOVE uletteru_point1
  LMOVE uletteru_point1
  LMOVE uletteru_point1
  LMOVE uletteru_point1
  LMOVE uletteru_point1
  LMOVE uletteru_point1
;Points for Letter S in Tigbrush
  LMOVE uletters_point0
  LMOVE uletters_point1
  LMOVE uletters_point2
  LMOVE uletters_point3
  LMOVE uletters_point4
  LMOVE uletters_point5
  LMOVE uletters_point6
  LMOVE uletters_point7
  LMOVE uletters_point8
  LMOVE uletters_point9
  LMOVE uletters_point1
  LMOVE uletters_point1
  LMOVE uletters_point1
  LMOVE uletters_point1
  LMOVE uletters_point1
  LMOVE uletters_point1
  LMOVE uletters_point1
  LMOVE uletters_point1
  LMOVE uletters_point1
  LMOVE uletters_point1
  LMOVE uletters_point2
  LMOVE uletters_point2
  LMOVE uletters_point2
  LMOVE uletters_point2
  LMOVE uletters_point2
  LMOVE uletters_point2
  LMOVE uletters_point2
  LMOVE uletters_point2
  LMOVE uletters_point2
  LMOVE uletters_point2
  LMOVE uletters_point3
  LMOVE uletters_point3
  LMOVE uletters_point3
  LMOVE uletters_point3
  LMOVE uletters_point3
  LMOVE uletters_point3
  LMOVE uletters_point3
  LMOVE uletters_point3
  LMOVE uletters_point3
  LMOVE uletters_point3
  LMOVE uletters_point4
  LMOVE uletters_point4
  LMOVE uletters_point4
  LMOVE uletters_point4
  LMOVE uletters_point4
  LMOVE uletters_point4
  LMOVE uletters_point4
  LMOVE uletters_point4
  LMOVE uletters_point4
  LMOVE uletters_point4
  LMOVE uletters_point5
  LMOVE uletters_point5
  LMOVE uletters_point5
  LMOVE uletters_point5
  LMOVE uletters_point5
  LMOVE uletters_point5
  LMOVE uletters_point5
  LMOVE uletters_point5
  LMOVE uletters_point5
;Points for Letter H in Tigbrush
  LMOVE uletterh_point0
  LMOVE uletterh_point1
  LMOVE uletterh_point2
  LMOVE uletterh_point3
  LMOVE uletterh_point4
  LMOVE uletterh_point5
  LMOVE uletterh_point6
  LMOVE uletterh_point7
  LMOVE uletterh_point8
  LMOVE uletterh_point9
  LMOVE uletterh_point1
  LMOVE uletterh_point1
  LMOVE uletterh_point1
  LMOVE uletterh_point1
  LMOVE uletterh_point1
  LMOVE uletterh_point1
  LMOVE uletterh_point1
  LMOVE uletterh_point1
  LMOVE uletterh_point1
  LMOVE uletterh_point1
  LMOVE uletterh_point2
  LMOVE uletterh_point2
;Points for Letter S (First) in SSally
  LMOVE lletters_point0
  LMOVE lletters_point1
  LMOVE lletters_point2
  LMOVE lletters_point3
  LMOVE lletters_point4
  LMOVE lletters_point5
  LMOVE lletters_point6
  LMOVE lletters_point7
  LMOVE lletters_point8
  LMOVE lletters_point9
  LMOVE lletters_point1
  LMOVE lletters_point1
  LMOVE lletters_point1
  LMOVE lletters_point1
  LMOVE lletters_point1
  LMOVE lletters_point1
  LMOVE lletters_point1
  LMOVE lletters_point1
  LMOVE lletters_point1
  LMOVE lletters_point1
  LMOVE lletters_point2
  LMOVE lletters_point2
  LMOVE lletters_point2
  LMOVE lletters_point2
  LMOVE lletters_point2
  LMOVE lletters_point2
  LMOVE lletters_point2
  LMOVE lletters_point2
  LMOVE lletters_point2
  LMOVE lletters_point2
  LMOVE lletters_point3
  LMOVE lletters_point3
;Points for Letter S (Second) in SSally
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
  LMOVE lletterss_point
;Points for Letter A in SSally
  LMOVE llettera_point0
  LMOVE llettera_point1
  LMOVE llettera_point2
  LMOVE llettera_point3
  LMOVE llettera_point4
  LMOVE llettera_point5
  LMOVE llettera_point6
  LMOVE llettera_point7
  LMOVE llettera_point8
  LMOVE llettera_point9
  LMOVE llettera_point1
  LMOVE llettera_point1
  LMOVE llettera_point1
  LMOVE llettera_point1
  LMOVE llettera_point1
  LMOVE llettera_point1
;Points for Letter L (First) in SSally
  LMOVE lletterl_point0
  LMOVE lletterl_point1
  LMOVE lletterl_point2
  LMOVE lletterl_point3
  LMOVE lletterl_point4
  LMOVE lletterl_point5
  LMOVE lletterl_point6
  LMOVE lletterl_point7
  LMOVE lletterl_point8
  LMOVE lletterl_point9
  LMOVE lletterl_point1
;Points for Letter L (Second) in SSally
  LMOVE lletterll_point
  LMOVE lletterll_point
  LMOVE lletterll_point
  LMOVE lletterll_point
  LMOVE lletterll_point
  LMOVE lletterll_point
  LMOVE lletterll_point
  LMOVE lletterll_point
  LMOVE lletterll_point
  LMOVE lletterll_point
  LMOVE lletterll_point
;Points for Letter Y in SSally
  LMOVE llettery_point0
  LMOVE llettery_point1
  LMOVE llettery_point2
  LMOVE llettery_point3
  LMOVE llettery_point4
  LMOVE llettery_point5
  LMOVE llettery_point6
  LMOVE llettery_point7
  LMOVE llettery_point8
  LMOVE llettery_point9
  LMOVE llettery_point1
  LMOVE llettery_point1
.END
.PROGRAM all.points1() #0
  JOINT SPEED9 ACCU1 TIMER0 TOOL1 WORK0 CLAMP1 (OFF,0,0,O) OX= WX= #[96.256,-19.468,-100.21,-222.34,42.963,135.96] ;
;Datum Point
  LMOVE datum[0,1]
  LMOVE datum[0,2]
  LMOVE datum[0,3]
  LMOVE datum[0,4]
;Home Position
  LMOVE homepoint
;Approach Points
  JMOVE lapproach;TIGBrush
  LMOVE uapproach;SSally
;Points for Letter T in Tigbrush
  LMOVE letter[1,0]
  LMOVE letter[1,1]
  LMOVE letter[1,2]
  LMOVE letter[1,3]
  LMOVE letter[1,4]
  LMOVE letter[1,5]
  LMOVE letter[1,6]
  LMOVE letter[1,7]
  LMOVE letter[1,8]
;Points for Letter I in Tigbrush
  LMOVE letter[2,0]
  LMOVE letter[2,1]
  LMOVE letter[2,2]
  LMOVE letter[2,3]
  LMOVE letter[2,4]
;Points for Letter G in Tigbrush
  LMOVE letter[3,0]
  LMOVE letter[3,1]
  LMOVE letter[3,2]
  LMOVE letter[3,3]
  LMOVE letter[3,4]
  LMOVE letter[3,5]
  LMOVE letter[3,6]
  LMOVE letter[3,7]
  LMOVE letter[3,8]
  LMOVE letter[3,9]
  LMOVE letter[3,10]
  LMOVE letter[3,11]
  LMOVE letter[3,12]
  LMOVE letter[3,13]
  LMOVE letter[3,14]
  LMOVE letter[3,15]
  LMOVE letter[3,16]
  LMOVE letter[3,17]
  LMOVE letter[3,18]
  LMOVE letter[3,19]
  LMOVE letter[3,20]
  LMOVE letter[3,21]
  LMOVE letter[3,22]
  LMOVE letter[3,23]
  LMOVE letter[3,24]
  LMOVE letter[3,25]
  LMOVE letter[3,26]
  LMOVE letter[3,27]
  LMOVE letter[3,28]
  LMOVE letter[3,29]
  LMOVE letter[3,30]
  LMOVE letter[3,31]
  LMOVE letter[3,32]
;Points for Letter B in Tigbrush
  LMOVE letter[4,0]
  LMOVE letter[4,1]
  LMOVE letter[4,2]
  LMOVE letter[4,3]
  LMOVE letter[4,4]
  LMOVE letter[4,5]
  LMOVE letter[4,6]
  LMOVE letter[4,7]
  LMOVE letter[4,8]
  LMOVE letter[4,9]
  LMOVE letter[4,10]
  LMOVE letter[4,11]
  LMOVE letter[4,12]
  LMOVE letter[4,13]
  LMOVE letter[4,14]
  LMOVE letter[4,15]
  LMOVE letter[4,16]
  LMOVE letter[4,17]
  LMOVE letter[4,18]
  LMOVE letter[4,19]
  LMOVE letter[4,20]
  LMOVE letter[4,21]
  LMOVE letter[4,22]
  LMOVE letter[4,23]
  LMOVE letter[4,24]
  LMOVE letter[4,25]
  LMOVE letter[4,26]
  LMOVE letter[4,27]
  LMOVE letter[4,28]
  LMOVE letter[4,29]
  LMOVE letter[4,30]
  LMOVE letter[4,31]
  LMOVE letter[4,32]
  LMOVE letter[4,33]
  LMOVE letter[4,34]
  LMOVE letter[4,35]
; ;Points for Letter R in Tigbrush
  LMOVE letter[5,0]
  LMOVE letter[5,1]
  LMOVE letter[5,2]
  LMOVE letter[5,3]
  LMOVE letter[5,4]
  LMOVE letter[5,5]
  LMOVE letter[5,6]
  LMOVE letter[5,7]
  LMOVE letter[5,8]
  LMOVE letter[5,9]
  LMOVE letter[5,10]
  LMOVE letter[5,11]
  LMOVE letter[5,12]
  LMOVE letter[5,13]
  LMOVE letter[5,14]
  LMOVE letter[5,15]
; ;Points for Letter U in Tigbrush
  LMOVE letter[6,0]
  LMOVE letter[6,1]
  LMOVE letter[6,2]
  LMOVE letter[6,3]
  LMOVE letter[6,4]
  LMOVE letter[6,5]
  LMOVE letter[6,6]
  LMOVE letter[6,7]
  LMOVE letter[6,8]
  LMOVE letter[6,9]
  LMOVE letter[6,10]
  LMOVE letter[6,11]
  LMOVE letter[6,12]
  LMOVE letter[6,13]
  LMOVE letter[6,14]
  LMOVE letter[6,15]
  LMOVE letter[6,16]
; ;Points for Letter S in Tigbrush
  LMOVE letter[7,0]
  LMOVE letter[7,1]
  LMOVE letter[7,2]
  LMOVE letter[7,3]
  LMOVE letter[7,4]
  LMOVE letter[7,5]
  LMOVE letter[7,6]
  LMOVE letter[7,7]
  LMOVE letter[7,8]
  LMOVE letter[7,9]
  LMOVE letter[7,10]
  LMOVE letter[7,11]
  LMOVE letter[7,12]
  LMOVE letter[7,13]
  LMOVE letter[7,14]
  LMOVE letter[7,15]
  LMOVE letter[7,16]
  LMOVE letter[7,17]
  LMOVE letter[7,18]
  LMOVE letter[7,19]
  LMOVE letter[7,20]
  LMOVE letter[7,21]
  LMOVE letter[7,22]
  LMOVE letter[7,23]
  LMOVE letter[7,24]
  LMOVE letter[7,25]
  LMOVE letter[7,26]
  LMOVE letter[7,27]
  LMOVE letter[7,28]
  LMOVE letter[7,29]
  LMOVE letter[7,30]
  LMOVE letter[7,31]
  LMOVE letter[7,32]
  LMOVE letter[7,33]
  LMOVE letter[7,34]
  LMOVE letter[7,35]
; ;Points for Letter H in Tigbrush
  LMOVE letter[8,0]
  LMOVE letter[8,1]
  LMOVE letter[8,2]
  LMOVE letter[8,3]
  LMOVE letter[8,4]
  LMOVE letter[8,5]
  LMOVE letter[8,6]
  LMOVE letter[8,7]
  LMOVE letter[8,8]
  LMOVE letter[8,9]
  LMOVE letter[8,10]
  LMOVE letter[8,11]
  LMOVE letter[8,12]
  LMOVE letter[8,13]
  LMOVE letter[8,14]
  LMOVE letter[8,15]
  LMOVE letter[8,16]
  LMOVE letter[8,17]
  LMOVE letter[8,18]
  LMOVE letter[8,19]
  LMOVE letter[8,20]
  LMOVE letter[8,21]
; ;Points for Letter S (First) in SSally
  LMOVE letter[9,0]
  LMOVE letter[9,1]
  LMOVE letter[9,2]
  LMOVE letter[9,3]
  LMOVE letter[9,4]
  LMOVE letter[9,5]
  LMOVE letter[9,6]
  LMOVE letter[9,7]
  LMOVE letter[9,8]
  LMOVE letter[9,9]
  LMOVE letter[9,10]
  LMOVE letter[9,11]
  LMOVE letter[9,12]
  LMOVE letter[9,13]
  LMOVE letter[9,14]
  LMOVE letter[9,15]
  LMOVE letter[9,16]
  LMOVE letter[9,17]
  LMOVE letter[9,18]
  LMOVE letter[9,19]
  LMOVE letter[9,20]
  LMOVE letter[9,21]
  LMOVE letter[9,22]
  LMOVE letter[9,23]
  LMOVE letter[9,24]
  LMOVE letter[9,25]
  LMOVE letter[9,26]
  LMOVE letter[9,27]
  LMOVE letter[9,28]
  LMOVE letter[9,29]
  LMOVE letter[9,30]
  LMOVE letter[9,31]
; ;Points for Letter S (Second) in SSally
  LMOVE letter[10,0]
  LMOVE letter[10,1]
  LMOVE letter[10,2]
  LMOVE letter[10,3]
  LMOVE letter[10,4]
  LMOVE letter[10,5]
  LMOVE letter[10,6]
  LMOVE letter[10,7]
  LMOVE letter[10,8]
  LMOVE letter[10,9]
  LMOVE letter[10,10]
  LMOVE letter[10,11]
  LMOVE letter[10,12]
  LMOVE letter[10,13]
  LMOVE letter[10,14]
  LMOVE letter[10,15]
  LMOVE letter[10,16]
  LMOVE letter[10,17]
  LMOVE letter[10,18]
  LMOVE letter[10,19]
  LMOVE letter[10,20]
  LMOVE letter[10,21]
  LMOVE letter[10,22]
  LMOVE letter[10,23]
  LMOVE letter[10,24]
  LMOVE letter[10,25]
  LMOVE letter[10,26]
  LMOVE letter[10,27]
  LMOVE letter[10,28]
  LMOVE letter[10,29]
  LMOVE letter[10,30]
  LMOVE letter[10,31]
; ;Points for Letter A in SSally
  LMOVE letter[11,0]
  LMOVE letter[11,1]
  LMOVE letter[11,2]
  LMOVE letter[11,3]
  LMOVE letter[11,4]
  LMOVE letter[11,5]
  LMOVE letter[11,6]
  LMOVE letter[11,7]
  LMOVE letter[11,8]
  LMOVE letter[11,9]
  LMOVE letter[11,10]
  LMOVE letter[11,11]
  LMOVE letter[11,12]
  LMOVE letter[11,13]
; ;Points for Letter L (First) in SSally
  LMOVE letter[12,0]
  LMOVE letter[12,1]
  LMOVE letter[12,2]
  LMOVE letter[12,3]
  LMOVE letter[12,4]
  LMOVE letter[12,5]
  LMOVE letter[12,6]
  LMOVE letter[12,7]
  LMOVE letter[12,8]
; ;Points for Letter L (Second) in SSally
  LMOVE letter[13,0]
  LMOVE letter[13,1]
  LMOVE letter[13,2]
  LMOVE letter[13,3]
  LMOVE letter[13,4]
  LMOVE letter[13,5]
  LMOVE letter[13,6]
  LMOVE letter[13,7]
  LMOVE letter[13,8]
  LMOVE letter[13,9]
; ;Points for Letter Y in SSally
  LMOVE letter[14,0]
  LMOVE letter[14,1]
  LMOVE letter[14,2]
  LMOVE letter[14,3]
  LMOVE letter[14,4]
  LMOVE letter[14,5]
  LMOVE letter[14,6]
  LMOVE letter[14,7]
  LMOVE letter[14,8]
  LMOVE letter[14,9]
.END
.PROGRAM datum() #0
  CALL m.params(rbt_spd_slow,pgm_accu)
  PRINT "Check Datum Points of Workpiece"
  PRINT "Going to Datum Point 1"
  JMOVE datum[0,1]
  STABLE (0.25)
;There may be an issue with going to points 2 and 3 as this may contact cell wall
  PRINT "Going to Datum Point 2"
  JMOVE datum[0,2];Replace this with the bottom point of the S
  STABLE (0.25)
;There may be an issue with going to points 2 and 3 as this may contact cell wall
  PRINT "Going to Datum Point 3"
  JMOVE datum[0,3];Replace this with the bottom point of the Y
  STABLE (0.25)
  PRINT "Going to Datum Point 4"
  JMOVE datum[0,4]
  STABLE (0.25)
.END
.PROGRAM demo.l.a() #0
  PRINT "Starting A"
  PRINT "Approaching Starting Point of A"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE demo[11,0]
  LMOVE demo[11,1]
  LMOVE demo[11,2]
  LMOVE demo[11,3]
  LMOVE demo[11,4]
  LMOVE demo[11,5]
  LMOVE demo[11,6]
  LMOVE demo[11,7]
  LMOVE demo[11,8]
  LMOVE demo[11,9]
  LMOVE demo[11,10]
  LMOVE demo[11,11]
  LMOVE demo[11,12]
  LMOVE demo[11,13]
  LMOVE demo[11,1]
  JMOVE demo[11,0]
  PRINT "SSA Complete"
.END
.PROGRAM demo.l.l() #0
  PRINT "Starting L"
  PRINT "Approaching Starting Point of L"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE demo[12,0]
  LMOVE demo[12,1]
  LMOVE demo[12,2]
  LMOVE demo[12,3]
  LMOVE demo[12,4]
  LMOVE demo[12,5]
  LMOVE demo[12,6]
  LMOVE demo[12,7]
  LMOVE demo[12,8]
  LMOVE demo[12,1]
  JMOVE demo[12,0]
  PRINT "SSAL Complete"
.END
.PROGRAM demo.l.ll() #0
  PRINT "Starting L"
  PRINT "Approaching Starting Point of L"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE demo[13,0]
  LMOVE demo[13,1]
  LMOVE demo[13,2]
  LMOVE demo[13,3]
  LMOVE demo[13,4]
  LMOVE demo[13,5]
  LMOVE demo[13,6]
  LMOVE demo[13,7]
  LMOVE demo[13,8]
  LMOVE demo[13,9]
  LMOVE demo[13,1]
  JMOVE demo[13,0]
  PRINT "SSALL Complete"
.END
.PROGRAM demo.l.s() #0
  PRINT "Starting S"
  PRINT "Approaching Starting Point of S"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE demo[9,0]
  LMOVE demo[9,1]
  LMOVE demo[9,2]
  LMOVE demo[9,3]
  LMOVE demo[9,4]
  LMOVE demo[9,5]
  LMOVE demo[9,6]
  LMOVE demo[9,7]
  LMOVE demo[9,8]
  LMOVE demo[9,9]
  LMOVE demo[9,10]
  LMOVE demo[9,11]
  LMOVE demo[9,12]
  LMOVE demo[9,13]
  LMOVE demo[9,14]
  LMOVE demo[9,15]
  LMOVE demo[9,16]
  LMOVE demo[9,17]
  LMOVE demo[9,18]
  LMOVE demo[9,19]
  LMOVE demo[9,20]
  LMOVE demo[9,21]
  LMOVE demo[9,22]
  LMOVE demo[9,23]
  LMOVE demo[9,24]
  LMOVE demo[9,25]
  LMOVE demo[9,26]
  LMOVE demo[9,27]
  LMOVE demo[9,28]
  LMOVE demo[9,29]
  LMOVE demo[9,30]
  LMOVE demo[9,31]
  LMOVE demo[9,1]
  JMOVE demo[9,0]
  PRINT "S Complete"
.END
.PROGRAM demo.l.ss() #0
  PRINT "Starting S"
  PRINT "Approaching Starting Point of S"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE demo[10,0]
  LMOVE demo[10,1]
  LMOVE demo[10,2]
  LMOVE demo[10,3]
  LMOVE demo[10,4]
  LMOVE demo[10,5]
  LMOVE demo[10,6]
  LMOVE demo[10,7]
  LMOVE demo[10,8]
  LMOVE demo[10,9]
  LMOVE demo[10,10]
  LMOVE demo[10,11]
  LMOVE demo[10,12]
  LMOVE demo[10,13]
  LMOVE demo[10,14]
  LMOVE demo[10,15]
  LMOVE demo[10,16]
  LMOVE demo[10,17]
  LMOVE demo[10,18]
  LMOVE demo[10,19]
  LMOVE demo[10,20]
  LMOVE demo[10,21]
  LMOVE demo[10,22]
  LMOVE demo[10,23]
  LMOVE demo[10,24]
  LMOVE demo[10,25]
  LMOVE demo[10,26]
  LMOVE demo[10,27]
  LMOVE demo[10,28]
  LMOVE demo[10,29]
  LMOVE demo[10,30]
  LMOVE demo[10,31]
  LMOVE demo[10,1]
  JMOVE demo[10,0]
  PRINT "SS Complete"
.END
.PROGRAM demo.l.y() #0
  PRINT "Starting Y"
  PRINT "Approaching Starting Point of Y"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE demo[14,0]
  LMOVE demo[14,1]
  LMOVE demo[14,2]
  LMOVE demo[14,3]
  LMOVE demo[14,4]
  LMOVE demo[14,5]
  LMOVE demo[14,6]
  LMOVE demo[14,7]
  LMOVE demo[14,8]
  LMOVE demo[14,9]
  LMOVE demo[14,1]
  JMOVE demo[14,0]
  PRINT "SSALLY Complete"
.END
.PROGRAM demo.lower() #0
  CALL demo.m.params(rbt_spd,pgm_accu)
  JMOVE uapproach
  CALL demo.l.s
  STABLE 0.2
  CALL demo.l.ss
  STABLE 0.2
  CALL demo.l.a
  STABLE 0.2
  CALL demo.l.l
  STABLE 0.2
  CALL demo.l.ll
  STABLE 0.2
  CALL demo.l.y
  STABLE 0.2
  JMOVE uapproach
.END
.PROGRAM demo.lower.a() #304
  PRINT "Starting A"
  PRINT "Approaching Starting Point of A"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE demo[11,0]
  LMOVE demo[11,1]
  LMOVE demo[11,2]
  LMOVE demo[11,3]
  LMOVE demo[11,4]
  LMOVE demo[11,5]
  LMOVE demo[11,6]
  LMOVE demo[11,7]
  LMOVE demo[11,8]
  LMOVE demo[11,9]
  LMOVE demo[11,10]
  LMOVE demo[11,11]
  LMOVE demo[11,12]
  LMOVE demo[11,13]
  LMOVE demo[11,1]
  JMOVE demo[11,0]
  PRINT "SSA Complete"
.END
.PROGRAM demo.lower.l() #304
  PRINT "Starting L"
  PRINT "Approaching Starting Point of L"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE demo[12,0]
  LMOVE demo[12,1]
  LMOVE demo[12,2]
  LMOVE demo[12,3]
  LMOVE demo[12,4]
  LMOVE demo[12,5]
  LMOVE demo[12,6]
  LMOVE demo[12,7]
  LMOVE demo[12,8]
  LMOVE demo[12,1]
  JMOVE demo[12,0]
  PRINT "SSAL Complete"
.END
.PROGRAM demo.lower.ll() #302
  PRINT "Starting L"
  PRINT "Approaching Starting Point of L"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE demo[13,0]
  LMOVE demo[13,1]
  LMOVE demo[13,2]
  LMOVE demo[13,3]
  LMOVE demo[13,4]
  LMOVE demo[13,5]
  LMOVE demo[13,6]
  LMOVE demo[13,7]
  LMOVE demo[13,8]
  LMOVE demo[13,9]
  LMOVE demo[13,1]
  JMOVE demo[13,0]
  PRINT "SSALL Complete"
.END
.PROGRAM demo.lower.s() #305
  PRINT "Starting S"
  PRINT "Approaching Starting Point of S"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE demo[9,0]
  LMOVE demo[9,1]
  LMOVE demo[9,2]
  LMOVE demo[9,3]
  LMOVE demo[9,4]
  LMOVE demo[9,5]
  LMOVE demo[9,6]
  LMOVE demo[9,7]
  LMOVE demo[9,8]
  LMOVE demo[9,9]
  LMOVE demo[9,10]
  LMOVE demo[9,11]
  LMOVE demo[9,12]
  LMOVE demo[9,13]
  LMOVE demo[9,14]
  LMOVE demo[9,15]
  LMOVE demo[9,16]
  LMOVE demo[9,17]
  LMOVE demo[9,18]
  LMOVE demo[9,19]
  LMOVE demo[9,20]
  LMOVE demo[9,21]
  LMOVE demo[9,22]
  LMOVE demo[9,23]
  LMOVE demo[9,24]
  LMOVE demo[9,25]
  LMOVE demo[9,26]
  LMOVE demo[9,27]
  LMOVE demo[9,28]
  LMOVE demo[9,29]
  LMOVE demo[9,30]
  LMOVE demo[9,31]
  LMOVE demo[9,1]
  JMOVE demo[9,0]
  PRINT "S Complete"
.END
.PROGRAM demo.lower.ss() #304
  PRINT "Starting S"
  PRINT "Approaching Starting Point of S"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE demo[10,0]
  LMOVE demo[10,1]
  LMOVE demo[10,2]
  LMOVE demo[10,3]
  LMOVE demo[10,4]
  LMOVE demo[10,5]
  LMOVE demo[10,6]
  LMOVE demo[10,7]
  LMOVE demo[10,8]
  LMOVE demo[10,9]
  LMOVE demo[10,10]
  LMOVE demo[10,11]
  LMOVE demo[10,12]
  LMOVE demo[10,13]
  LMOVE demo[10,14]
  LMOVE demo[10,15]
  LMOVE demo[10,16]
  LMOVE demo[10,17]
  LMOVE demo[10,18]
  LMOVE demo[10,19]
  LMOVE demo[10,20]
  LMOVE demo[10,21]
  LMOVE demo[10,22]
  LMOVE demo[10,23]
  LMOVE demo[10,24]
  LMOVE demo[10,25]
  LMOVE demo[10,26]
  LMOVE demo[10,27]
  LMOVE demo[10,28]
  LMOVE demo[10,29]
  LMOVE demo[10,30]
  LMOVE demo[10,31]
  LMOVE demo[10,1]
  JMOVE demo[10,0]
  PRINT "SS Complete"
.END
.PROGRAM demo.lower.y() #301
  PRINT "Starting Y"
  PRINT "Approaching Starting Point of Y"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE demo[14,0]
  LMOVE demo[14,1]
  LMOVE demo[14,2]
  LMOVE demo[14,3]
  LMOVE demo[14,4]
  LMOVE demo[14,5]
  LMOVE demo[14,6]
  LMOVE demo[14,7]
  LMOVE demo[14,8]
  LMOVE demo[14,9]
  LMOVE demo[14,1]
  JMOVE demo[14,0]
  PRINT "SSALLY Complete"
.END
.PROGRAM demo.u.b() #0
  PRINT "Starting B"
  PRINT "Approaching Starting Point of B"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE demo[4,0]
  LMOVE demo[4,1]
  LMOVE demo[4,2]
  LMOVE demo[4,3]
  LMOVE demo[4,4]
  LMOVE demo[4,5]
  LMOVE demo[4,6]
  LMOVE demo[4,7]
  LMOVE demo[4,8]
  LMOVE demo[4,9]
  LMOVE demo[4,10]
  LMOVE demo[4,11]
  LMOVE demo[4,12]
  LMOVE demo[4,13]
  LMOVE demo[4,14]
  LMOVE demo[4,15]
  LMOVE demo[4,16]
  LMOVE demo[4,17]
  LMOVE demo[4,18]
  LMOVE demo[4,19]
  LMOVE demo[4,1]
  JMOVE demo[4,0]
  STABLE (0.5)
  LMOVE demo[4,20]
  LMOVE demo[4,21]
  LMOVE demo[4,22]
  LMOVE demo[4,23]
  LMOVE demo[4,24]
  LMOVE demo[4,25]
  LMOVE demo[4,26]
  LMOVE demo[4,27]
  LMOVE demo[4,28]
  LMOVE demo[4,20]
  JMOVE demo[4,0]
  LMOVE demo[4,29]
  LMOVE demo[4,30]
  LMOVE demo[4,31]
  LMOVE demo[4,32]
  LMOVE demo[4,33]
  LMOVE demo[4,34]
  LMOVE demo[4,35]
  LMOVE demo[4,29]
  JMOVE demo[4,0]
  PRINT "B Complete"
  PRINT "Tig B Complete"
.END
.PROGRAM demo.u.g() #0
  PRINT "Starting G"
  PRINT "Approaching Starting Point of G"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE demo[3,0]
  LMOVE demo[3,1]
  LMOVE demo[3,2]
  LMOVE demo[3,3]
  LMOVE demo[3,4]
  LMOVE demo[3,5]
  LMOVE demo[3,6]
  LMOVE demo[3,7]
  LMOVE demo[3,8]
  LMOVE demo[3,9]
  LMOVE demo[3,10]
  LMOVE demo[3,11]
  LMOVE demo[3,12]
  LMOVE demo[3,13]
  LMOVE demo[3,14]
  LMOVE demo[3,15]
  LMOVE demo[3,16]
  LMOVE demo[3,17]
  LMOVE demo[3,18]
  LMOVE demo[3,19]
  LMOVE demo[3,20]
  LMOVE demo[3,21]
  LMOVE demo[3,22]
  LMOVE demo[3,23]
  LMOVE demo[3,24]
  LMOVE demo[3,25]
  LMOVE demo[3,26]
  LMOVE demo[3,27]
  LMOVE demo[3,28]
  LMOVE demo[3,29]
  LMOVE demo[3,30]
  LMOVE demo[3,31]
  LMOVE demo[3,32]
  LMOVE demo[3,1]
  JMOVE demo[3,0]
  PRINT "G Complete"
  PRINT "Tig Complete"
.END
.PROGRAM demo.u.h() #0
  PRINT "Starting H"
  PRINT "Approaching Starting Point of H"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE demo[8,0]
  LMOVE demo[8,1]
  LMOVE demo[8,2]
  LMOVE demo[8,3]
  LMOVE demo[8,4]
  LMOVE demo[8,5]
  LMOVE demo[8,6]
  LMOVE demo[8,7]
  LMOVE demo[8,8]
  LMOVE demo[8,9]
  LMOVE demo[8,10]
  LMOVE demo[8,11]
  LMOVE demo[8,12]
  LMOVE demo[8,13]
  LMOVE demo[8,14]
  LMOVE demo[8,15]
  LMOVE demo[8,16]
  LMOVE demo[8,17]
  LMOVE demo[8,18]
  LMOVE demo[8,19]
  LMOVE demo[8,20]
  LMOVE demo[8,21]
  LMOVE demo[8,1]
  JMOVE demo[8,0]
  PRINT "H Complete"
  PRINT "Tig Brush Complete"
.END
.PROGRAM demo.u.i() #0
  PRINT "Starting I"
  PRINT "Approaching Starting Point of I"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE demo[2,0]
  LMOVE demo[2,1]
  LMOVE demo[2,2]
  LMOVE demo[2,3]
  LMOVE demo[2,4]
  LMOVE demo[2,1]
  JMOVE demo[2,0]
  PRINT "I Complete"
  PRINT "Ti Complete"
.END
.PROGRAM demo.u.r() #0
  PRINT "Starting R"
  PRINT "Approaching Starting Point of R"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE demo[5,0]
  LMOVE demo[5,1]
  LMOVE demo[5,2]
  LMOVE demo[5,3]
  LMOVE demo[5,4]
  LMOVE demo[5,5]
  LMOVE demo[5,6]
  LMOVE demo[5,7]
  LMOVE demo[5,8]
  LMOVE demo[5,9]
  LMOVE demo[5,10]
  LMOVE demo[5,11]
  LMOVE demo[5,12]
  LMOVE demo[5,13]
  LMOVE demo[5,14]
  LMOVE demo[5,15]
  LMOVE demo[5,1]
  JMOVE demo[5,0]
  PRINT "R Complete"
  PRINT "Tig Br Complete"
.END
.PROGRAM demo.u.s() #0
  PRINT "Starting S"
  PRINT "Approaching Starting Point of S"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE demo[7,0]
  LMOVE demo[7,1]
  LMOVE demo[7,2]
  LMOVE demo[7,3]
  LMOVE demo[7,4]
  LMOVE demo[7,5]
  LMOVE demo[7,6]
  LMOVE demo[7,7]
  LMOVE demo[7,8]
  LMOVE demo[7,9]
  LMOVE demo[7,10]
  LMOVE demo[7,11]
  LMOVE demo[7,12]
  LMOVE demo[7,13]
  LMOVE demo[7,14]
  LMOVE demo[7,15]
  LMOVE demo[7,16]
  LMOVE demo[7,17]
  LMOVE demo[7,18]
  LMOVE demo[7,19]
  LMOVE demo[7,20]
  LMOVE demo[7,21]
  LMOVE demo[7,22]
  LMOVE demo[7,23]
  LMOVE demo[7,24]
  LMOVE demo[7,25]
  LMOVE demo[7,26]
  LMOVE demo[7,27]
  LMOVE demo[7,28]
  LMOVE demo[7,29]
  LMOVE demo[7,30]
  LMOVE demo[7,31]
  LMOVE demo[7,32]
  LMOVE demo[7,33]
  LMOVE demo[7,34]
  LMOVE demo[7,35]
  LMOVE demo[7,1]
  JMOVE demo[7,0]
  PRINT "S Complete"
  PRINT "Tig Brus Complete"
.END
.PROGRAM demo.u.t() #0
  PRINT "Starting T"
  PRINT "Approaching Starting Point of T"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE demo[1,0]
  LMOVE demo[1,1]
  LMOVE demo[1,2]
  LMOVE demo[1,3]
  LMOVE demo[1,4]
  LMOVE demo[1,5]
  LMOVE demo[1,6]
  LMOVE demo[1,7]
  LMOVE demo[1,8]
  LMOVE demo[1,1]
  JMOVE demo[1,0]
  PRINT "T Complete"
.END
.PROGRAM demo.u.u() #0
  PRINT "Starting U"
  PRINT "Approaching Starting Point of U"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE demo[6,0]
  LMOVE demo[6,1]
  LMOVE demo[6,2]
  LMOVE demo[6,3]
  LMOVE demo[6,4]
  LMOVE demo[6,5]
  LMOVE demo[6,6]
  LMOVE demo[6,7]
  LMOVE demo[6,8]
  LMOVE demo[6,9]
  LMOVE demo[6,10]
  LMOVE demo[6,11]
  LMOVE demo[6,12]
  LMOVE demo[6,13]
  LMOVE demo[6,14]
  LMOVE demo[6,15]
  LMOVE demo[6,16]
  LMOVE demo[6,1]
  JMOVE demo[6,0]
  PRINT "U Complete"
  PRINT "Tig Bru Complete"
.END
.PROGRAM demo.upper() #0
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE lapproach
  CALL demo.u.t
  STABLE 0.2
  CALL demo.u.i
  STABLE 0.2
  CALL demo.u.g
  STABLE 0.2
  CALL demo.u.b
  STABLE 0.2
  CALL demo.u.r
  STABLE 0.2
  CALL demo.u.u
  STABLE 0.2
  CALL demo.u.s
  STABLE 0.2
  CALL demo.u.h
  STABLE 0.2
  JMOVE lapproach
.END
.PROGRAM demo.upper.b() #317
  PRINT "Starting B"
  PRINT "Approaching Starting Point of B"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE demo[4,0]
  JMOVE demo[4,1]
  JMOVE demo[4,2]
  JMOVE demo[4,3]
  JMOVE demo[4,4]
  JMOVE demo[4,5]
  JMOVE demo[4,6]
  JMOVE demo[4,7]
  JMOVE demo[4,8]
  JMOVE demo[4,9]
  JMOVE demo[4,10]
  JMOVE demo[4,11]
  JMOVE demo[4,12]
  JMOVE demo[4,13]
  JMOVE demo[4,14]
  JMOVE demo[4,15]
  JMOVE demo[4,16]
  JMOVE demo[4,17]
  JMOVE demo[4,18]
  JMOVE demo[4,19]
  LMOVE demo[4,1]
  JMOVE demo[4,0]
  STABLE (0.5)
  JMOVE demo[4,20]
  JMOVE demo[4,21]
  JMOVE demo[4,22]
  JMOVE demo[4,23]
  JMOVE demo[4,24]
  JMOVE demo[4,25]
  JMOVE demo[4,26]
  JMOVE demo[4,27]
  JMOVE demo[4,28]
  JMOVE demo[4,20]
  JMOVE demo[4,0]
  JMOVE demo[4,29]
  JMOVE demo[4,30]
  JMOVE demo[4,31]
  JMOVE demo[4,32]
  JMOVE demo[4,33]
  JMOVE demo[4,34]
  JMOVE demo[4,35]
  JMOVE demo[4,29]
  JMOVE demo[4,0]
  PRINT "B Complete"
  PRINT "Tig B Complete"
.END
.PROGRAM demo.upper.g() #322
  PRINT "Starting G"
  PRINT "Approaching Starting Point of G"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE demo[3,0]
  JMOVE demo[3,1]
  JMOVE demo[3,2]
  JMOVE demo[3,3]
  JMOVE demo[3,4]
  JMOVE demo[3,5]
  JMOVE demo[3,6]
  JMOVE demo[3,7]
  JMOVE demo[3,8]
  JMOVE demo[3,9]
  JMOVE demo[3,10]
  JMOVE demo[3,11]
  JMOVE demo[3,12]
  JMOVE demo[3,13]
  JMOVE demo[3,14]
  JMOVE demo[3,15]
  JMOVE demo[3,16]
  JMOVE demo[3,17]
  JMOVE demo[3,18]
  JMOVE demo[3,19]
  JMOVE demo[3,20]
  JMOVE demo[3,21]
  JMOVE demo[3,22]
  JMOVE demo[3,23]
  JMOVE demo[3,24]
  JMOVE demo[3,25]
  JMOVE demo[3,26]
  JMOVE demo[3,27]
  JMOVE demo[3,28]
  JMOVE demo[3,29]
  JMOVE demo[3,30]
  JMOVE demo[3,31]
  JMOVE demo[3,32]
  JMOVE demo[3,1]
  JMOVE demo[3,0]
  PRINT "G Complete"
  PRINT "Tig Complete"
.END
.PROGRAM demo.upper.h() #309
  PRINT "Starting H"
  PRINT "Approaching Starting Point of H"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE demo[8,0]
  LMOVE demo[8,1]
  LMOVE demo[8,2]
  LMOVE demo[8,3]
  LMOVE demo[8,4]
  LMOVE demo[8,5]
  LMOVE demo[8,6]
  LMOVE demo[8,7]
  LMOVE demo[8,8]
  LMOVE demo[8,9]
  LMOVE demo[8,10]
  LMOVE demo[8,11]
  LMOVE demo[8,12]
  LMOVE demo[8,13]
  LMOVE demo[8,14]
  LMOVE demo[8,15]
  LMOVE demo[8,16]
  LMOVE demo[8,17]
  LMOVE demo[8,18]
  LMOVE demo[8,19]
  LMOVE demo[8,20]
  LMOVE demo[8,21]
  LMOVE demo[8,1]
  JMOVE demo[8,0]
  PRINT "H Complete"
  PRINT "Tig Brush Complete"
.END
.PROGRAM demo.upper.i() #326
  PRINT "Starting I"
  PRINT "Approaching Starting Point of I"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE demo[2,0]
  LMOVE demo[2,1]
  LMOVE demo[2,2]
  LMOVE demo[2,3]
  LMOVE demo[2,4]
  LMOVE demo[2,1]
  JMOVE demo[2,0]
  PRINT "I Complete"
  PRINT "Ti Complete"
.END
.PROGRAM demo.upper.r() #318
  PRINT "Starting R"
  PRINT "Approaching Starting Point of R"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE demo[5,0]
  LMOVE demo[5,1]
  LMOVE demo[5,2]
  LMOVE demo[5,3]
  LMOVE demo[5,4]
  LMOVE demo[5,5]
  LMOVE demo[5,6]
  LMOVE demo[5,7]
  LMOVE demo[5,8]
  LMOVE demo[5,9]
  LMOVE demo[5,10]
  LMOVE demo[5,11]
  LMOVE demo[5,12]
  LMOVE demo[5,13]
  LMOVE demo[5,14]
  LMOVE demo[5,15]
  LMOVE demo[5,1]
  JMOVE demo[5,0]
  PRINT "R Complete"
  PRINT "Tig Br Complete"
.END
.PROGRAM demo.upper.s() #311
  PRINT "Starting S"
  PRINT "Approaching Starting Point of S"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE demo[7,0]
  LMOVE demo[7,1]
  LMOVE demo[7,2]
  LMOVE demo[7,3]
  LMOVE demo[7,4]
  LMOVE demo[7,5]
  LMOVE demo[7,6]
  LMOVE demo[7,7]
  LMOVE demo[7,8]
  LMOVE demo[7,9]
  LMOVE demo[7,10]
  LMOVE demo[7,11]
  LMOVE demo[7,12]
  LMOVE demo[7,13]
  LMOVE demo[7,14]
  LMOVE demo[7,15]
  LMOVE demo[7,16]
  LMOVE demo[7,17]
  LMOVE demo[7,18]
  LMOVE demo[7,19]
  LMOVE demo[7,20]
  LMOVE demo[7,21]
  LMOVE demo[7,22]
  LMOVE demo[7,23]
  LMOVE demo[7,24]
  LMOVE demo[7,25]
  LMOVE demo[7,26]
  LMOVE demo[7,27]
  LMOVE demo[7,28]
  LMOVE demo[7,29]
  LMOVE demo[7,30]
  LMOVE demo[7,31]
  LMOVE demo[7,32]
  LMOVE demo[7,33]
  LMOVE demo[7,34]
  LMOVE demo[7,1]
  JMOVE demo[7,0]
  PRINT "S Complete"
  PRINT "Tig Brus Complete"
.END
.PROGRAM demo.upper.t() #329
  PRINT "Starting T"
  PRINT "Approaching Starting Point of T"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE demo[1,0]
  LMOVE demo[1,1]
  LMOVE demo[1,2]
  LMOVE demo[1,3]
  LMOVE demo[1,4]
  LMOVE demo[1,5]
  LMOVE demo[1,6]
  LMOVE demo[1,7]
  LMOVE demo[1,8]
  LMOVE demo[1,1]
  JMOVE demo[1,0]
  PRINT "T Complete"
.END
.PROGRAM demo.upper.u() #317
  PRINT "Starting U"
  PRINT "Approaching Starting Point of U"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE demo[6,0]
  LMOVE demo[6,1]
  LMOVE demo[6,2]
  LMOVE demo[6,3]
  LMOVE demo[6,4]
  LMOVE demo[6,5]
  LMOVE demo[6,6]
  LMOVE demo[6,7]
  LMOVE demo[6,8]
  LMOVE demo[6,9]
  LMOVE demo[6,10]
  LMOVE demo[6,11]
  LMOVE demo[6,12]
  LMOVE demo[6,13]
  LMOVE demo[6,14]
  LMOVE demo[6,15]
  LMOVE demo[6,16]
  LMOVE demo[6,1]
  JMOVE demo[6,0]
  PRINT "U Complete"
  PRINT "Tig Bru Complete"
.END
.PROGRAM gen.offset() #0
  IF FALSE THEN
    LMOVE f.o;Frame origin point bottom right corner of plate when standing in front of robot
    LMOVE f.x;Frame x-axis bottom left corner of plate when standing in front of robot
    LMOVE f.y;Frame y-axis top right corner of plate when standing in front of robot
  END
  POINT .frame = FRAME(f.o,f.x,f.y,f.o) ;Create the reference frame
  .no.letters = 14  ;Total number of letters
  .no.lp[1] = 8   ;Number of taught points for that letter 
  .no.lp[2] = 4
  .no.lp[3] = 32
  .no.lp[4] = 35
  .no.lp[5] = 15
  .no.lp[6] = 16
  .no.lp[7] = 34
  .no.lp[8] = 21
  .no.lp[9] = 31
  .no.lp[10] = 31
  .no.lp[11] = 13
  .no.lp[12] = 8
  .no.lp[13] = 9
  .no.lp[14] = 9
  FOR .i = 1 TO .no.letters         ;For each letter
    PRINT 2: "i = ",.i
    FOR .j = 0 TO .no.lp[.i]        ;For each point within the current letter
      PRINT 2: "j = ",.j
      POINT .p[.i,.j] = letter[.i,.j]     ;Duplicate each point so we can manipulate it without losing the original point
      POINT p.offset[.i,.j] = .p[.i,.j]-.frame ;Moved to intialise program
;POINT .p.rel[.i,.j] = .frame + p.offset[.i,.j]
    END
  END
.END
.PROGRAM initialise() #0
  pgm_accu = 1
  rbt_spd = 100
  rbt_spd_slow = 10
;DEMO_MODE = 
;POINT p.offset[.i,.j] = -.frame + .p[.i,.j]
.END
.PROGRAM m.l.a() #0
  PRINT "Starting A"
  PRINT "Approaching Starting Point of A"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE letter[11,0]
  LMOVE letter[11,1]
  LMOVE letter[11,2]
  LMOVE letter[11,3]
  LMOVE letter[11,4]
  LMOVE letter[11,5]
  LMOVE letter[11,6]
  LMOVE letter[11,7]
  LMOVE letter[11,8]
  LMOVE letter[11,9]
  LMOVE letter[11,10]
  LMOVE letter[11,11]
  LMOVE letter[11,12]
  LMOVE letter[11,13]
  LMOVE letter[11,1]
  JMOVE letter[11,0]
  PRINT "SSA Complete"
.END
.PROGRAM m.l.l() #0
  PRINT "Starting L"
  PRINT "Approaching Starting Point of L"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE letter[12,0]
  LMOVE letter[12,1]
  LMOVE letter[12,2]
  LMOVE letter[12,3]
  LMOVE letter[12,4]
  LMOVE letter[12,5]
  LMOVE letter[12,6]
  LMOVE letter[12,7]
  LMOVE letter[12,8]
  LMOVE letter[12,1]
  JMOVE letter[12,0]
  PRINT "SSAL Complete"
.END
.PROGRAM m.l.ll() #0
  PRINT "Starting L"
  PRINT "Approaching Starting Point of L"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE letter[13,0]
  LMOVE letter[13,1]
  LMOVE letter[13,2]
  LMOVE letter[13,3]
  LMOVE letter[13,4]
  LMOVE letter[13,5]
  LMOVE letter[13,6]
  LMOVE letter[13,7]
  LMOVE letter[13,8]
  LMOVE letter[13,9]
  LMOVE letter[13,1]
  JMOVE letter[13,0]
  PRINT "SSALL Complete"
.END
.PROGRAM m.l.s() #0
  PRINT "Starting S"
  PRINT "Approaching Starting Point of S"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE letter[9,0]
  LMOVE letter[9,1]
  LMOVE letter[9,2]
  LMOVE letter[9,3]
  LMOVE letter[9,4]
  LMOVE letter[9,5]
  LMOVE letter[9,6]
  LMOVE letter[9,7]
  LMOVE letter[9,8]
  LMOVE letter[9,9]
  LMOVE letter[9,10]
  LMOVE letter[9,11]
  LMOVE letter[9,12]
  LMOVE letter[9,13]
  LMOVE letter[9,14]
  LMOVE letter[9,15]
  LMOVE letter[9,16]
  LMOVE letter[9,17]
  LMOVE letter[9,18]
  LMOVE letter[9,19]
  LMOVE letter[9,20]
  LMOVE letter[9,21]
  LMOVE letter[9,22]
  LMOVE letter[9,23]
  LMOVE letter[9,24]
  LMOVE letter[9,25]
  LMOVE letter[9,26]
  LMOVE letter[9,27]
  LMOVE letter[9,28]
  LMOVE letter[9,29]
  LMOVE letter[9,30]
  LMOVE letter[9,31]
  LMOVE letter[9,1]
  JMOVE letter[9,0]
  PRINT "S Complete"
.END
.PROGRAM m.l.ss() #0
  PRINT "Starting S"
  PRINT "Approaching Starting Point of S"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE letter[10,0]
  LMOVE letter[10,1]
  LMOVE letter[10,2]
  LMOVE letter[10,3]
  LMOVE letter[10,4]
  LMOVE letter[10,5]
  LMOVE letter[10,6]
  LMOVE letter[10,7]
  LMOVE letter[10,8]
  LMOVE letter[10,9]
  LMOVE letter[10,10]
  LMOVE letter[10,11]
  LMOVE letter[10,12]
  LMOVE letter[10,13]
  LMOVE letter[10,14]
  LMOVE letter[10,15]
  LMOVE letter[10,16]
  LMOVE letter[10,17]
  LMOVE letter[10,18]
  LMOVE letter[10,19]
  LMOVE letter[10,20]
  LMOVE letter[10,21]
  LMOVE letter[10,22]
  LMOVE letter[10,23]
  LMOVE letter[10,24]
  LMOVE letter[10,25]
  LMOVE letter[10,26]
  LMOVE letter[10,27]
  LMOVE letter[10,28]
  LMOVE letter[10,29]
  LMOVE letter[10,30]
  LMOVE letter[10,31]
  LMOVE letter[10,1]
  JMOVE letter[10,0]
  PRINT "SS Complete"
.END
.PROGRAM m.l.y() #0
  PRINT "Starting Y"
  PRINT "Approaching Starting Point of Y"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE letter[14,0]
  LMOVE letter[14,1]
  LMOVE letter[14,2]
  LMOVE letter[14,3]
  LMOVE letter[14,4]
  LMOVE letter[14,5]
  LMOVE letter[14,6]
  LMOVE letter[14,7]
  LMOVE letter[14,8]
  LMOVE letter[14,9]
  LMOVE letter[14,1]
  JMOVE letter[14,0]
  PRINT "SSALLY Complete"
.END
.PROGRAM m.lower() #0
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE uapproach
  CALL m.l.s
  STABLE 0.2
  CALL m.l.ss
  STABLE 0.2
  CALL m.l.a
  STABLE 0.2
  CALL m.l.l
  STABLE 0.2
  CALL m.l.ll
  STABLE 0.2
  CALL m.l.y
  STABLE 0.2
  JMOVE uapproach
.END
.PROGRAM m.params(.spd,.accu) #0
  ACCURACY .accu ALWAYS
  SPEED .spd MM/S ALWAYS
END
RIGHTY
ABOVE
DWRIST
.END
.PROGRAM m.u.b() #0
  PRINT "Starting B"
  PRINT "Approaching Starting Point of B"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE letter[4,0]
  LMOVE letter[4,1]
  LMOVE letter[4,2]
  LMOVE letter[4,3]
  LMOVE letter[4,4]
  LMOVE letter[4,5]
  LMOVE letter[4,6]
  LMOVE letter[4,7]
  LMOVE letter[4,8]
  LMOVE letter[4,9]
  LMOVE letter[4,10]
  LMOVE letter[4,11]
  LMOVE letter[4,12]
  LMOVE letter[4,13]
  LMOVE letter[4,14]
  LMOVE letter[4,15]
  LMOVE letter[4,16]
  LMOVE letter[4,17]
  LMOVE letter[4,18]
  LMOVE letter[4,19]
  LMOVE letter[4,1]
  JMOVE letter[4,0]
  STABLE (0.5)
  LMOVE letter[4,20]
  LMOVE letter[4,21]
  LMOVE letter[4,22]
  LMOVE letter[4,23]
  LMOVE letter[4,24]
  LMOVE letter[4,25]
  LMOVE letter[4,26]
  LMOVE letter[4,27]
  LMOVE letter[4,28]
  LMOVE letter[4,20]
  JMOVE letter[4,0]
  LMOVE letter[4,29]
  LMOVE letter[4,30]
  LMOVE letter[4,31]
  LMOVE letter[4,32]
  LMOVE letter[4,33]
  LMOVE letter[4,34]
  LMOVE letter[4,35]
  LMOVE letter[4,29]
  JMOVE letter[4,0]
  PRINT "B Complete"
  PRINT "Tig B Complete"
.END
.PROGRAM m.u.g() #0
  PRINT "Starting G"
  PRINT "Approaching Starting Point of G"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE letter[3,0]
  LMOVE letter[3,1]
  LMOVE letter[3,2]
  LMOVE letter[3,3]
  LMOVE letter[3,4]
  LMOVE letter[3,5]
  LMOVE letter[3,6]
  LMOVE letter[3,7]
  LMOVE letter[3,8]
  LMOVE letter[3,9]
  LMOVE letter[3,10]
  LMOVE letter[3,11]
  LMOVE letter[3,12]
  LMOVE letter[3,13]
  LMOVE letter[3,14]
  LMOVE letter[3,15]
  LMOVE letter[3,16]
  LMOVE letter[3,17]
  LMOVE letter[3,18]
  LMOVE letter[3,19]
  LMOVE letter[3,20]
  LMOVE letter[3,21]
  LMOVE letter[3,22]
  LMOVE letter[3,23]
  LMOVE letter[3,24]
  LMOVE letter[3,25]
  LMOVE letter[3,26]
  LMOVE letter[3,27]
  LMOVE letter[3,28]
  LMOVE letter[3,29]
  LMOVE letter[3,30]
  LMOVE letter[3,31]
  LMOVE letter[3,32]
  LMOVE letter[3,1]
  JMOVE letter[3,0]
  PRINT "G Complete"
  PRINT "Tig Complete"
.END
.PROGRAM m.u.h() #0
  PRINT "Starting H"
  PRINT "Approaching Starting Point of H"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE letter[8,0]
  LMOVE letter[8,1]
  LMOVE letter[8,2]
  LMOVE letter[8,3]
  LMOVE letter[8,4]
  LMOVE letter[8,5]
  LMOVE letter[8,6]
  LMOVE letter[8,7]
  LMOVE letter[8,8]
  LMOVE letter[8,9]
  LMOVE letter[8,10]
  LMOVE letter[8,11]
  LMOVE letter[8,12]
  LMOVE letter[8,13]
  LMOVE letter[8,14]
  LMOVE letter[8,15]
  LMOVE letter[8,16]
  LMOVE letter[8,17]
  LMOVE letter[8,18]
  LMOVE letter[8,19]
  LMOVE letter[8,20]
  LMOVE letter[8,21]
  LMOVE letter[8,1]
  JMOVE letter[8,0]
  PRINT "H Complete"
  PRINT "Tig Brush Complete"
.END
.PROGRAM m.u.i() #0
  PRINT "Starting I"
  PRINT "Approaching Starting Point of I"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE letter[2,0]
  LMOVE letter[2,1]
  LMOVE letter[2,2]
  LMOVE letter[2,3]
  LMOVE letter[2,4]
  LMOVE letter[2,1]
  JMOVE letter[2,0]
  PRINT "I Complete"
  PRINT "Ti Complete"
.END
.PROGRAM m.u.r() #0
  PRINT "Starting R"
  PRINT "Approaching Starting Point of R"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE letter[5,0]
  LMOVE letter[5,1]
  LMOVE letter[5,2]
  LMOVE letter[5,3]
  LMOVE letter[5,4]
  LMOVE letter[5,5]
  LMOVE letter[5,6]
  LMOVE letter[5,7]
  LMOVE letter[5,8]
  LMOVE letter[5,9]
  LMOVE letter[5,10]
  LMOVE letter[5,11]
  LMOVE letter[5,12]
  LMOVE letter[5,13]
  LMOVE letter[5,14]
  LMOVE letter[5,15]
  LMOVE letter[5,1]
  JMOVE letter[5,0]
  PRINT "R Complete"
  PRINT "Tig Br Complete"
.END
.PROGRAM m.u.s() #0
  PRINT "Starting S"
  PRINT "Approaching Starting Point of S"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE letter[7,0]
  LMOVE letter[7,1]
  LMOVE letter[7,2]
  LMOVE letter[7,3]
  LMOVE letter[7,4]
  LMOVE letter[7,5]
  LMOVE letter[7,6]
  LMOVE letter[7,7]
  LMOVE letter[7,8]
  LMOVE letter[7,9]
  LMOVE letter[7,10]
  LMOVE letter[7,11]
  LMOVE letter[7,12]
  LMOVE letter[7,13]
  LMOVE letter[7,14]
  LMOVE letter[7,15]
  LMOVE letter[7,16]
  LMOVE letter[7,17]
  LMOVE letter[7,18]
  LMOVE letter[7,19]
  LMOVE letter[7,20]
  LMOVE letter[7,21]
  LMOVE letter[7,22]
  LMOVE letter[7,23]
  LMOVE letter[7,24]
  LMOVE letter[7,25]
  LMOVE letter[7,26]
  LMOVE letter[7,27]
  LMOVE letter[7,28]
  LMOVE letter[7,29]
  LMOVE letter[7,30]
  LMOVE letter[7,31]
  LMOVE letter[7,32]
  LMOVE letter[7,33]
  LMOVE letter[7,34]
  LMOVE letter[7,35]
  LMOVE letter[7,1]
  JMOVE letter[7,0]
  PRINT "S Complete"
  PRINT "Tig Brus Complete"
.END
.PROGRAM m.u.t() #0
  PRINT "Starting T"
  PRINT "Approaching Starting Point of T"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE letter[1,0]
  LMOVE letter[1,1]
  LMOVE letter[1,2]
  LMOVE letter[1,3]
  LMOVE letter[1,4]
  LMOVE letter[1,5]
  LMOVE letter[1,6]
  LMOVE letter[1,7]
  LMOVE letter[1,8]
  LMOVE letter[1,1]
  JMOVE letter[1,0]
  PRINT "T Complete"
.END
.PROGRAM m.u.u() #0
  PRINT "Starting U"
  PRINT "Approaching Starting Point of U"
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE letter[6,0]
  LMOVE letter[6,1]
  LMOVE letter[6,2]
  LMOVE letter[6,3]
  LMOVE letter[6,4]
  LMOVE letter[6,5]
  LMOVE letter[6,6]
  LMOVE letter[6,7]
  LMOVE letter[6,8]
  LMOVE letter[6,9]
  LMOVE letter[6,10]
  LMOVE letter[6,11]
  LMOVE letter[6,12]
  LMOVE letter[6,13]
  LMOVE letter[6,14]
  LMOVE letter[6,15]
  LMOVE letter[6,16]
  LMOVE letter[6,1]
  JMOVE letter[6,0]
  PRINT "U Complete"
  PRINT "Tig Bru Complete"
.END
.PROGRAM m.upper() #0
  CALL m.params(rbt_spd,pgm_accu)
  JMOVE lapproach
  CALL m.u.t
  STABLE 0.2
  CALL m.u.i
  STABLE 0.2
  CALL m.u.g
  STABLE 0.2
  CALL m.u.b
  STABLE 0.2
  CALL m.u.r
  STABLE 0.2
  CALL m.u.u
  STABLE 0.2
  CALL m.u.s
  STABLE 0.2
  CALL m.u.h
  STABLE 0.2
  JMOVE lapproach
.END
.PROGRAM motion.lower() #0
  CALL motion.params(rbt_spd,pgm_accu)
  JMOVE uapproach
  CALL motion.lower.s
  STABLE 0.2
  CALL motion.lower.ss
  STABLE 0.2
  CALL motion.lower.a
  STABLE 0.2
  CALL motion.lower.l
  STABLE 0.2
  CALL motion.lower.ll
  STABLE 0.2
  CALL motion.lower.y
  STABLE 0.2
  JMOVE uapproach
.END
.PROGRAM motion.lower.a() #0
  PRINT "Starting A"
  PRINT "Approaching Starting Point of A"
  CALL motion.params(rbt_spd,pgm_accu)
  JMOVE letter[11,0]
  LMOVE letter[11,1]
  LMOVE letter[11,2]
  LMOVE letter[11,3]
  LMOVE letter[11,4]
  LMOVE letter[11,5]
  LMOVE letter[11,6]
  LMOVE letter[11,7]
  LMOVE letter[11,8]
  LMOVE letter[11,9]
  LMOVE letter[11,10]
  LMOVE letter[11,11]
  LMOVE letter[11,12]
  LMOVE letter[11,13]
  LMOVE letter[11,1]
  JMOVE letter[11,0]
  PRINT "SSA Complete"
.END
.PROGRAM motion.lower.l() #0
  PRINT "Starting L"
  PRINT "Approaching Starting Point of L"
  CALL motion.params(rbt_spd,pgm_accu)
  JMOVE letter[12,0]
  LMOVE letter[12,1]
  LMOVE letter[12,2]
  LMOVE letter[12,3]
  LMOVE letter[12,4]
  LMOVE letter[12,5]
  LMOVE letter[12,6]
  LMOVE letter[12,7]
  LMOVE letter[12,8]
  LMOVE letter[12,1]
  JMOVE letter[12,0]
  PRINT "SSAL Complete"
.END
.PROGRAM motion.lower.ll() #0
  PRINT "Starting L"
  PRINT "Approaching Starting Point of L"
  CALL motion.params(rbt_spd,pgm_accu)
  JMOVE letter[13,0]
  LMOVE letter[13,1]
  LMOVE letter[13,2]
  LMOVE letter[13,3]
  LMOVE letter[13,4]
  LMOVE letter[13,5]
  LMOVE letter[13,6]
  LMOVE letter[13,7]
  LMOVE letter[13,8]
  LMOVE letter[13,9]
  LMOVE letter[13,1]
  JMOVE letter[13,0]
  PRINT "SSALL Complete"
.END
.PROGRAM motion.lower.s() #0
  PRINT "Starting S"
  PRINT "Approaching Starting Point of S"
  CALL motion.params(rbt_spd,pgm_accu)
  JMOVE letter[9,0]
  LMOVE letter[9,1]
  LMOVE letter[9,2]
  LMOVE letter[9,3]
  LMOVE letter[9,4]
  LMOVE letter[9,5]
  LMOVE letter[9,6]
  LMOVE letter[9,7]
  LMOVE letter[9,8]
  LMOVE letter[9,9]
  LMOVE letter[9,10]
  LMOVE letter[9,11]
  LMOVE letter[9,12]
  LMOVE letter[9,13]
  LMOVE letter[9,14]
  LMOVE letter[9,15]
  LMOVE letter[9,16]
  LMOVE letter[9,17]
  LMOVE letter[9,18]
  LMOVE letter[9,19]
  LMOVE letter[9,20]
  LMOVE letter[9,21]
  LMOVE letter[9,22]
  LMOVE letter[9,23]
  LMOVE letter[9,24]
  LMOVE letter[9,25]
  LMOVE letter[9,26]
  LMOVE letter[9,27]
  LMOVE letter[9,28]
  LMOVE letter[9,29]
  LMOVE letter[9,30]
  LMOVE letter[9,31]
  LMOVE letter[9,1]
  JMOVE letter[9,0]
  PRINT "S Complete"
.END
.PROGRAM motion.lower.ss() #0
  PRINT "Starting S"
  PRINT "Approaching Starting Point of S"
  CALL motion.params(rbt_spd,pgm_accu)
  JMOVE letter[10,0]
  LMOVE letter[10,1]
  LMOVE letter[10,2]
  LMOVE letter[10,3]
  LMOVE letter[10,4]
  LMOVE letter[10,5]
  LMOVE letter[10,6]
  LMOVE letter[10,7]
  LMOVE letter[10,8]
  LMOVE letter[10,9]
  LMOVE letter[10,10]
  LMOVE letter[10,11]
  LMOVE letter[10,12]
  LMOVE letter[10,13]
  LMOVE letter[10,14]
  LMOVE letter[10,15]
  LMOVE letter[10,16]
  LMOVE letter[10,17]
  LMOVE letter[10,18]
  LMOVE letter[10,19]
  LMOVE letter[10,20]
  LMOVE letter[10,21]
  LMOVE letter[10,22]
  LMOVE letter[10,23]
  LMOVE letter[10,24]
  LMOVE letter[10,25]
  LMOVE letter[10,26]
  LMOVE letter[10,27]
  LMOVE letter[10,28]
  LMOVE letter[10,29]
  LMOVE letter[10,30]
  LMOVE letter[10,31]
  LMOVE letter[10,1]
  JMOVE letter[10,0]
  PRINT "SS Complete"
.END
.PROGRAM motion.lower.y() #0
  PRINT "Starting Y"
  PRINT "Approaching Starting Point of Y"
  CALL motion.params(rbt_spd,pgm_accu)
  JMOVE letter[14,0]
  LMOVE letter[14,1]
  LMOVE letter[14,2]
  LMOVE letter[14,3]
  LMOVE letter[14,4]
  LMOVE letter[14,5]
  LMOVE letter[14,6]
  LMOVE letter[14,7]
  LMOVE letter[14,8]
  LMOVE letter[14,9]
  LMOVE letter[14,1]
  JMOVE letter[14,0]
  PRINT "SSALLY Complete"
.END
.PROGRAM motion.params(.spd,.accu) #0
  ACCURACY .accu ALWAYS
  SPEED .spd MM/S ALWAYS
END
RIGHTY
ABOVE
DWRIST
.END
.PROGRAM motion.upper() #0
  CALL motion.params(rbt_spd,pgm_accu)
  JMOVE lapproach
  CALL motion.upper.t
  STABLE 0.2
  CALL motion.upper.i
  STABLE 0.2
  CALL motion.upper.g
  STABLE 0.2
  CALL motion.upper.b
  STABLE 0.2
  CALL motion.upper.r
  STABLE 0.2
  CALL motion.upper.u
  STABLE 0.2
  CALL motion.upper.s
  STABLE 0.2
  CALL motion.upper.h
  STABLE 0.2
  JMOVE lapproach
.END
.PROGRAM motion.upper.b() #0
  PRINT "Starting B"
  PRINT "Approaching Starting Point of B"
  CALL motion.params(rbt_spd,pgm_accu)
  JMOVE letter[4,0]
  LMOVE letter[4,1]
  LMOVE letter[4,2]
  LMOVE letter[4,3]
  LMOVE letter[4,4]
  LMOVE letter[4,5]
  LMOVE letter[4,6]
  LMOVE letter[4,7]
  LMOVE letter[4,8]
  LMOVE letter[4,9]
  LMOVE letter[4,10]
  LMOVE letter[4,11]
  LMOVE letter[4,12]
  LMOVE letter[4,13]
  LMOVE letter[4,14]
  LMOVE letter[4,15]
  LMOVE letter[4,16]
  LMOVE letter[4,17]
  LMOVE letter[4,18]
  LMOVE letter[4,19]
  LMOVE letter[4,1]
  JMOVE letter[4,0]
  STABLE (0.5)
  LMOVE letter[4,20]
  LMOVE letter[4,21]
  LMOVE letter[4,22]
  LMOVE letter[4,23]
  LMOVE letter[4,24]
  LMOVE letter[4,25]
  LMOVE letter[4,26]
  LMOVE letter[4,27]
  LMOVE letter[4,28]
  LMOVE letter[4,20]
  JMOVE letter[4,0]
  LMOVE letter[4,29]
  LMOVE letter[4,30]
  LMOVE letter[4,31]
  LMOVE letter[4,32]
  LMOVE letter[4,33]
  LMOVE letter[4,34]
  LMOVE letter[4,35]
  LMOVE letter[4,29]
  JMOVE letter[4,0]
  PRINT "B Complete"
  PRINT "Tig B Complete"
.END
.PROGRAM motion.upper.g() #0
  PRINT "Starting G"
  PRINT "Approaching Starting Point of G"
  CALL motion.params(rbt_spd,pgm_accu)
  JMOVE letter[3,0]
  LMOVE letter[3,1]
  LMOVE letter[3,2]
  LMOVE letter[3,3]
  LMOVE letter[3,4]
  LMOVE letter[3,5]
  LMOVE letter[3,6]
  LMOVE letter[3,7]
  LMOVE letter[3,8]
  LMOVE letter[3,9]
  LMOVE letter[3,10]
  LMOVE letter[3,11]
  LMOVE letter[3,12]
  LMOVE letter[3,13]
  LMOVE letter[3,14]
  LMOVE letter[3,15]
  LMOVE letter[3,16]
  LMOVE letter[3,17]
  LMOVE letter[3,18]
  LMOVE letter[3,19]
  LMOVE letter[3,20]
  LMOVE letter[3,21]
  LMOVE letter[3,22]
  LMOVE letter[3,23]
  LMOVE letter[3,24]
  LMOVE letter[3,25]
  LMOVE letter[3,26]
  LMOVE letter[3,27]
  LMOVE letter[3,28]
  LMOVE letter[3,29]
  LMOVE letter[3,30]
  LMOVE letter[3,31]
  LMOVE letter[3,32]
  LMOVE letter[3,1]
  JMOVE letter[3,0]
  PRINT "G Complete"
  PRINT "Tig Complete"
.END
.PROGRAM motion.upper.h() #0
  PRINT "Starting H"
  PRINT "Approaching Starting Point of H"
  CALL motion.params(rbt_spd,pgm_accu)
  JMOVE letter[8,0]
  LMOVE letter[8,1]
  LMOVE letter[8,2]
  LMOVE letter[8,3]
  LMOVE letter[8,4]
  LMOVE letter[8,5]
  LMOVE letter[8,6]
  LMOVE letter[8,7]
  LMOVE letter[8,8]
  LMOVE letter[8,9]
  LMOVE letter[8,10]
  LMOVE letter[8,11]
  LMOVE letter[8,12]
  LMOVE letter[8,13]
  LMOVE letter[8,14]
  LMOVE letter[8,15]
  LMOVE letter[8,16]
  LMOVE letter[8,17]
  LMOVE letter[8,18]
  LMOVE letter[8,19]
  LMOVE letter[8,20]
  LMOVE letter[8,21]
  LMOVE letter[8,1]
  JMOVE letter[8,0]
  PRINT "H Complete"
  PRINT "Tig Brush Complete"
.END
.PROGRAM motion.upper.i() #0
  PRINT "Starting I"
  PRINT "Approaching Starting Point of I"
  CALL motion.params(rbt_spd,pgm_accu)
  JMOVE letter[2,0]
  LMOVE letter[2,1]
  LMOVE letter[2,2]
  LMOVE letter[2,3]
  LMOVE letter[2,4]
  LMOVE letter[2,1]
  JMOVE letter[2,0]
  PRINT "I Complete"
  PRINT "Ti Complete"
.END
.PROGRAM motion.upper.r() #0
  PRINT "Starting R"
  PRINT "Approaching Starting Point of R"
  CALL motion.params(rbt_spd,pgm_accu)
  JMOVE letter[5,0]
  LMOVE letter[5,1]
  LMOVE letter[5,2]
  LMOVE letter[5,3]
  LMOVE letter[5,4]
  LMOVE letter[5,5]
  LMOVE letter[5,6]
  LMOVE letter[5,7]
  LMOVE letter[5,8]
  LMOVE letter[5,9]
  LMOVE letter[5,10]
  LMOVE letter[5,11]
  LMOVE letter[5,12]
  LMOVE letter[5,13]
  LMOVE letter[5,14]
  LMOVE letter[5,15]
  LMOVE letter[5,1]
  JMOVE letter[5,0]
  PRINT "R Complete"
  PRINT "Tig Br Complete"
.END
.PROGRAM motion.upper.s() #0
  PRINT "Starting S"
  PRINT "Approaching Starting Point of S"
  CALL motion.params(rbt_spd,pgm_accu)
  JMOVE letter[7,0]
  LMOVE letter[7,1]
  LMOVE letter[7,2]
  LMOVE letter[7,3]
  LMOVE letter[7,4]
  LMOVE letter[7,5]
  LMOVE letter[7,6]
  LMOVE letter[7,7]
  LMOVE letter[7,8]
  LMOVE letter[7,9]
  LMOVE letter[7,10]
  LMOVE letter[7,11]
  LMOVE letter[7,12]
  LMOVE letter[7,13]
  LMOVE letter[7,14]
  LMOVE letter[7,15]
  LMOVE letter[7,16]
  LMOVE letter[7,17]
  LMOVE letter[7,18]
  LMOVE letter[7,19]
  LMOVE letter[7,20]
  LMOVE letter[7,21]
  LMOVE letter[7,22]
  LMOVE letter[7,23]
  LMOVE letter[7,24]
  LMOVE letter[7,25]
  LMOVE letter[7,26]
  LMOVE letter[7,27]
  LMOVE letter[7,28]
  LMOVE letter[7,29]
  LMOVE letter[7,30]
  LMOVE letter[7,31]
  LMOVE letter[7,32]
  LMOVE letter[7,33]
  LMOVE letter[7,34]
  LMOVE letter[7,35]
  LMOVE letter[7,1]
  JMOVE letter[7,0]
  PRINT "S Complete"
  PRINT "Tig Brus Complete"
.END
.PROGRAM motion.upper.t() #0
  PRINT "Starting T"
  PRINT "Approaching Starting Point of T"
  CALL motion.params(rbt_spd,pgm_accu)
  JMOVE letter[1,0]
  LMOVE letter[1,1]
  LMOVE letter[1,2]
  LMOVE letter[1,3]
  LMOVE letter[1,4]
  LMOVE letter[1,5]
  LMOVE letter[1,6]
  LMOVE letter[1,7]
  LMOVE letter[1,8]
  LMOVE letter[1,1]
  JMOVE letter[1,0]
  PRINT "T Complete"
.END
.PROGRAM motion.upper.u() #0
  PRINT "Starting U"
  PRINT "Approaching Starting Point of U"
  CALL motion.params(rbt_spd,pgm_accu)
  JMOVE letter[6,0]
  LMOVE letter[6,1]
  LMOVE letter[6,2]
  LMOVE letter[6,3]
  LMOVE letter[6,4]
  LMOVE letter[6,5]
  LMOVE letter[6,6]
  LMOVE letter[6,7]
  LMOVE letter[6,8]
  LMOVE letter[6,9]
  LMOVE letter[6,10]
  LMOVE letter[6,11]
  LMOVE letter[6,12]
  LMOVE letter[6,13]
  LMOVE letter[6,14]
  LMOVE letter[6,15]
  LMOVE letter[6,16]
  LMOVE letter[6,1]
  JMOVE letter[6,0]
  PRINT "U Complete"
  PRINT "Tig Bru Complete"
.END
.PROGRAM part.lower.a() #0
  PRINT "Starting A"
  PRINT "Approaching Starting Point of A"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE part[11,0]
  LMOVE part[11,1]
  LMOVE part[11,2]
  LMOVE part[11,3]
  LMOVE part[11,4]
  LMOVE part[11,5]
  LMOVE part[11,6]
  LMOVE part[11,7]
  LMOVE part[11,8]
  LMOVE part[11,9]
  LMOVE part[11,10]
  LMOVE part[11,11]
  LMOVE part[11,12]
  LMOVE part[11,13]
  LMOVE part[11,1]
  JMOVE part[11,0]
  PRINT "SSA Complete"
.END
.PROGRAM part.lower.l() #0
  PRINT "Starting L"
  PRINT "Approaching Starting Point of L"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE part[12,0]
  LMOVE part[12,1]
  LMOVE part[12,2]
  LMOVE part[12,3]
  LMOVE part[12,4]
  LMOVE part[12,5]
  LMOVE part[12,6]
  LMOVE part[12,7]
  LMOVE part[12,8]
  LMOVE part[12,1]
  JMOVE part[12,0]
  PRINT "SSAL Complete"
.END
.PROGRAM part.lower.ll() #0
  PRINT "Starting L"
  PRINT "Approaching Starting Point of L"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE part[13,0]
  LMOVE part[13,1]
  LMOVE part[13,2]
  LMOVE part[13,3]
  LMOVE part[13,4]
  LMOVE part[13,5]
  LMOVE part[13,6]
  LMOVE part[13,7]
  LMOVE part[13,8]
  LMOVE part[13,9]
  LMOVE part[13,1]
  JMOVE part[13,0]
  PRINT "SSALL Complete"
.END
.PROGRAM part.lower.s() #0
  PRINT "Starting S"
  PRINT "Approaching Starting Point of S"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE part[9,0]
  LMOVE part[9,1]
  LMOVE part[9,2]
  LMOVE part[9,3]
  LMOVE part[9,4]
  LMOVE part[9,5]
  LMOVE part[9,6]
  LMOVE part[9,7]
  LMOVE part[9,8]
  LMOVE part[9,9]
  LMOVE part[9,10]
  LMOVE part[9,11]
  LMOVE part[9,12]
  LMOVE part[9,13]
  LMOVE part[9,14]
  LMOVE part[9,15]
  LMOVE part[9,16]
  LMOVE part[9,17]
  LMOVE part[9,18]
  LMOVE part[9,19]
  LMOVE part[9,20]
  LMOVE part[9,21]
  LMOVE part[9,22]
  LMOVE part[9,23]
  LMOVE part[9,24]
  LMOVE part[9,25]
  LMOVE part[9,26]
  LMOVE part[9,27]
  LMOVE part[9,28]
  LMOVE part[9,29]
  LMOVE part[9,30]
  LMOVE part[9,31]
  LMOVE part[9,1]
  JMOVE part[9,0]
  PRINT "S Complete"
.END
.PROGRAM part.lower.ss() #0
  PRINT "Starting S"
  PRINT "Approaching Starting Point of S"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE part[10,0]
  LMOVE part[10,1]
  LMOVE part[10,2]
  LMOVE part[10,3]
  LMOVE part[10,4]
  LMOVE part[10,5]
  LMOVE part[10,6]
  LMOVE part[10,7]
  LMOVE part[10,8]
  LMOVE part[10,9]
  LMOVE part[10,10]
  LMOVE part[10,11]
  LMOVE part[10,12]
  LMOVE part[10,13]
  LMOVE part[10,14]
  LMOVE part[10,15]
  LMOVE part[10,16]
  LMOVE part[10,17]
  LMOVE part[10,18]
  LMOVE part[10,19]
  LMOVE part[10,20]
  LMOVE part[10,21]
  LMOVE part[10,22]
  LMOVE part[10,23]
  LMOVE part[10,24]
  LMOVE part[10,25]
  LMOVE part[10,26]
  LMOVE part[10,27]
  LMOVE part[10,28]
  LMOVE part[10,29]
  LMOVE part[10,30]
  LMOVE part[10,31]
  LMOVE part[10,1]
  JMOVE part[10,0]
  PRINT "SS Complete"
.END
.PROGRAM part.lower.y() #0
  PRINT "Starting Y"
  PRINT "Approaching Starting Point of Y"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE part[14,0]
  LMOVE part[14,1]
  LMOVE part[14,2]
  LMOVE part[14,3]
  LMOVE part[14,4]
  LMOVE part[14,5]
  LMOVE part[14,6]
  LMOVE part[14,7]
  LMOVE part[14,8]
  LMOVE part[14,9]
  LMOVE part[14,1]
  JMOVE part[14,0]
  PRINT "SSALLY Complete"
.END
.PROGRAM part.upper.g() #0
  PRINT "Starting G"
  PRINT "Approaching Starting Point of G"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE part[3,0]
  LMOVE part[3,1]
  LMOVE part[3,2]
  LMOVE part[3,3]
  LMOVE part[3,4]
  LMOVE part[3,5]
  LMOVE part[3,6]
  LMOVE part[3,7]
  LMOVE part[3,8]
  LMOVE part[3,9]
  LMOVE part[3,10]
  LMOVE part[3,11]
  LMOVE part[3,12]
  LMOVE part[3,13]
  LMOVE part[3,14]
  LMOVE part[3,15]
  LMOVE part[3,16]
  LMOVE part[3,17]
  LMOVE part[3,18]
  LMOVE part[3,19]
  LMOVE part[3,20]
  LMOVE part[3,21]
  LMOVE part[3,22]
  LMOVE part[3,23]
  LMOVE part[3,24]
  LMOVE part[3,25]
  LMOVE part[3,26]
  LMOVE part[3,27]
  LMOVE part[3,28]
  LMOVE part[3,29]
  LMOVE part[3,30]
  LMOVE part[3,31]
  LMOVE part[3,32]
  LMOVE part[3,1]
  JMOVE part[3,0]
  PRINT "G Complete"
  PRINT "Tig Complete"
.END
.PROGRAM part.upper.h() #0
  PRINT "Starting H"
  PRINT "Approaching Starting Point of H"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE part[8,0]
  LMOVE part[8,1]
  LMOVE part[8,2]
  LMOVE part[8,3]
  LMOVE part[8,4]
  LMOVE part[8,5]
  LMOVE part[8,6]
  LMOVE part[8,7]
  LMOVE part[8,8]
  LMOVE part[8,9]
  LMOVE part[8,10]
  LMOVE part[8,11]
  LMOVE part[8,12]
  LMOVE part[8,13]
  LMOVE part[8,14]
  LMOVE part[8,15]
  LMOVE part[8,16]
  LMOVE part[8,17]
  LMOVE part[8,18]
  LMOVE part[8,19]
  LMOVE part[8,20]
  LMOVE part[8,21]
  LMOVE part[8,1]
  JMOVE part[8,0]
  PRINT "H Complete"
  PRINT "Tig Brush Complete"
.END
.PROGRAM part.upper.i() #0
  PRINT "Starting I"
  PRINT "Approaching Starting Point of I"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE part[2,0]
  LMOVE part[2,1]
  LMOVE part[2,2]
  LMOVE part[2,3]
  LMOVE part[2,4]
  LMOVE part[2,1]
  JMOVE part[2,0]
  PRINT "I Complete"
  PRINT "Ti Complete"
.END
.PROGRAM part.upper.r() #0
  PRINT "Starting R"
  PRINT "Approaching Starting Point of R"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE part[5,0]
  LMOVE part[5,1]
  LMOVE part[5,2]
  LMOVE part[5,3]
  LMOVE part[5,4]
  LMOVE part[5,5]
  LMOVE part[5,6]
  LMOVE part[5,7]
  LMOVE part[5,8]
  LMOVE part[5,9]
  LMOVE part[5,10]
  LMOVE part[5,11]
  LMOVE part[5,12]
  LMOVE part[5,13]
  LMOVE part[5,14]
  LMOVE part[5,15]
  LMOVE part[5,1]
  JMOVE part[5,0]
  PRINT "R Complete"
  PRINT "Tig Br Complete"
.END
.PROGRAM part.upper.s() #0
  PRINT "Starting S"
  PRINT "Approaching Starting Point of S"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE part[7,0]
  LMOVE part[7,1]
  LMOVE part[7,2]
  LMOVE part[7,3]
  LMOVE part[7,4]
  LMOVE part[7,5]
  LMOVE part[7,6]
  LMOVE part[7,7]
  LMOVE part[7,8]
  LMOVE part[7,9]
  LMOVE part[7,10]
  LMOVE part[7,11]
  LMOVE part[7,12]
  LMOVE part[7,13]
  LMOVE part[7,14]
  LMOVE part[7,15]
  LMOVE part[7,16]
  LMOVE part[7,17]
  LMOVE part[7,18]
  LMOVE part[7,19]
  LMOVE part[7,20]
  LMOVE part[7,21]
  LMOVE part[7,22]
  LMOVE part[7,23]
  LMOVE part[7,24]
  LMOVE part[7,25]
  LMOVE part[7,26]
  LMOVE part[7,27]
  LMOVE part[7,28]
  LMOVE part[7,29]
  LMOVE part[7,30]
  LMOVE part[7,31]
  LMOVE part[7,32]
  LMOVE part[7,33]
  LMOVE part[7,34]
  LMOVE part[7,35]
  LMOVE part[7,1]
  JMOVE part[7,0]
  PRINT "S Complete"
  PRINT "Tig Brus Complete"
.END
.PROGRAM part.upper.t() #0
  PRINT "Starting T"
  PRINT "Approaching Starting Point of T"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE part[1,0]
  LMOVE part[1,1]
  LMOVE part[1,2]
  LMOVE part[1,3]
  LMOVE part[1,4]
  LMOVE part[1,5]
  LMOVE part[1,6]
  LMOVE part[1,7]
  LMOVE part[1,8]
  LMOVE part[1,1]
  JMOVE part[1,0]
  PRINT "T Complete"
.END
.PROGRAM part.upper.u() #0
  PRINT "Starting U"
  PRINT "Approaching Starting Point of U"
  SPEED slow_spd ALWAYS
  ACCURACY fine_acc ALWAYS
  JMOVE part[6,0]
  LMOVE part[6,1]
  LMOVE part[6,2]
  LMOVE part[6,3]
  LMOVE part[6,4]
  LMOVE part[6,5]
  LMOVE part[6,6]
  LMOVE part[6,7]
  LMOVE part[6,8]
  LMOVE part[6,9]
  LMOVE part[6,10]
  LMOVE part[6,11]
  LMOVE part[6,12]
  LMOVE part[6,13]
  LMOVE part[6,14]
  LMOVE part[6,15]
  LMOVE part[6,16]
  LMOVE part[6,1]
  JMOVE part[6,0]
  PRINT "U Complete"
  PRINT "Tig Bru Complete"
.END
.PROGRAM setupframe() #0
  JOINT SPEED9 ACCU1 TIMER0 TOOL1 WORK0 CLAMP1 (OFF,0,0,O) OX= WX= #[43.898,4.1625,-116.1,-253.94,72.478,206.24] ;
  JOINT SPEED9 ACCU1 TIMER0 TOOL1 WORK0 CLAMP1 (OFF,0,0,O) OX= WX= #[63.405,61.894,-31.388,-246.65,63.456,172.23] ;
  JOINT SPEED9 ACCU1 TIMER0 TOOL1 WORK0 CLAMP1 (OFF,0,0,O) OX= WX= #[98.24,42.64,-65.32,-255.86,26.379,175.62] ;
  JOINT SPEED9 ACCU1 TIMER0 TOOL1 WORK0 CLAMP1 (OFF,0,0,O) OX= WX= #[107.25,-17.853,-136.76,-287.07,18.119,205.28] ;
.END
.PROGRAM ssally_bot() #0
  SPEED always
  ACCURACY always
  HOME
  DELAY 2
  JMOVE #safe_pos_bot_tx[1]
; steps for letter S (ssally)
  LMOVE bot_txt_app[1]
  SPEED always
  ACCURACY always
  LMOVE bot_txt[1,1]
  JMOVE bot_txt[1,2]
  JMOVE bot_txt[1,3]
  JMOVE bot_txt[1,4]
  JMOVE bot_txt[1,5]
  JMOVE bot_txt[1,6]
  JMOVE bot_txt[1,7]
  JMOVE bot_txt[1,8]
  JMOVE bot_txt[1,9]
  JMOVE bot_txt[1,10]
  JMOVE bot_txt[1,11]
  JMOVE bot_txt[1,12]
  JMOVE bot_txt[1,13]
  JMOVE bot_txt[1,14]
  JMOVE bot_txt[1,15]
  LMOVE bot_txt_dep[1]
;
; steps for letter S second (ssally)
  LMOVE bot_txt_app[2]
  SPEED always
  ACCURACY always
  LMOVE bot_txt[2,1]
  JMOVE bot_txt[2,2]
  JMOVE bot_txt[2,3]
  JMOVE bot_txt[2,4]
  JMOVE bot_txt[2,5]
  JMOVE bot_txt[2,6]
  JMOVE bot_txt[2,7]
  JMOVE bot_txt[2,8]
  JMOVE bot_txt[2,9]
  JMOVE bot_txt[2,10]
  JMOVE bot_txt[2,11]
  JMOVE bot_txt[2,12]
  JMOVE bot_txt[2,13]
  JMOVE bot_txt[2,14]
  JMOVE bot_txt[2,15]
  LMOVE bot_txt_dep[2]
;
; steps for letter A (ssally)
  LMOVE bot_txt_app[3]
  SPEED always
  ACCURACY always
  LMOVE bot_txt[3,1]
  JMOVE bot_txt[3,2]
  JMOVE bot_txt[3,3]
  JMOVE bot_txt[3,4]
  JMOVE bot_txt[3,5]
  JMOVE bot_txt[3,6]
  JMOVE bot_txt[3,7]
  JMOVE bot_txt[3,8]
  JMOVE bot_txt[3,9]
  JMOVE bot_txt[3,10]
  JMOVE bot_txt[3,11]
  JMOVE bot_txt[3,12]
  JMOVE bot_txt[3,13]
  JMOVE bot_txt[3,14]
  JMOVE bot_txt[3,15]
  LMOVE bot_txt_dep[3]
;
; steps for letter L (ssally)
  LMOVE top_txt_app[4]
  SPEED always
  ACCURACY always
  LMOVE bot_txt[4,1]
  JMOVE bot_txt[4,2]
  JMOVE bot_txt[4,3]
  JMOVE bot_txt[4,4]
  JMOVE bot_txt[4,5]
  JMOVE bot_txt[4,6]
  JMOVE bot_txt[4,7]
  JMOVE bot_txt[4,8]
  JMOVE bot_txt[4,9]
  JMOVE bot_txt[4,10]
  JMOVE bot_txt[4,11]
  JMOVE bot_txt[4,12]
  JMOVE bot_txt[4,13]
  JMOVE bot_txt[4,14]
  JMOVE bot_txt[4,15]
  LMOVE bot_txt_dep[4]
;
; steps for letter L second (ssally)
  LMOVE top_txt_app[5]
  SPEED always
  ACCURACY always
  LMOVE bot_txt[5,1]
  JMOVE bot_txt[5,2]
  JMOVE bot_txt[5,3]
  JMOVE bot_txt[5,4]
  JMOVE bot_txt[5,5]
  JMOVE bot_txt[5,6]
  JMOVE bot_txt[5,7]
  JMOVE bot_txt[5,8]
  JMOVE bot_txt[5,9]
  JMOVE bot_txt[5,10]
  JMOVE bot_txt[5,11]
  JMOVE bot_txt[5,12]
  JMOVE bot_txt[5,13]
  JMOVE bot_txt[5,14]
  JMOVE bot_txt[5,15]
  LMOVE bot_txt_dep[5]
;
; steps for letter Y (ssally)
  LMOVE top_txt_app[6]
  SPEED always
  ACCURACY always
  LMOVE bot_txt[6,1]
  JMOVE bot_txt[6,2]
  JMOVE bot_txt[6,3]
  JMOVE bot_txt[6,4]
  JMOVE bot_txt[6,5]
  JMOVE bot_txt[6,6]
  JMOVE bot_txt[6,7]
  JMOVE bot_txt[6,8]
  JMOVE bot_txt[6,9]
  JMOVE bot_txt[6,10]
  JMOVE bot_txt[6,11]
  JMOVE bot_txt[6,12]
  JMOVE bot_txt[6,13]
  JMOVE bot_txt[6,14]
  JMOVE bot_txt[6,15]
  LMOVE bot_txt_dep[6]
  JMOVE #safe_pos_bot_tx[1]
  HOME
.END
.PROGRAM testjb() #0
  JOINT SPEED9 ACCU1 TIMER0 TOOL1 WORK0 CLAMP1 (OFF,0,0,O) OX= WX= #[49.845,-16.229,-126.97,-253.55,69.766,196.58] ;
  JOINT SPEED9 ACCU1 TIMER0 TOOL1 WORK0 CLAMP1 (OFF,0,0,O) OX= WX= #[46.636,-12.788,-124.32,-252.95,72.404,198.3] ;
  JOINT SPEED9 ACCU1 TIMER0 TOOL1 WORK0 CLAMP1 (OFF,0,0,O) OX= WX= #[45.752,-10.389,-122.37,-252.83,73.058,199] ;
  JOINT SPEED9 ACCU1 TIMER0 TOOL1 WORK0 CLAMP1 (OFF,0,0,O) OX= WX= #[46.769,-8.4667,-120.74,-253.21,72.072,199.01] ;
  JOINT SPEED9 ACCU1 TIMER0 TOOL1 WORK0 CLAMP1 (OFF,0,0,O) OX= WX= #[48.195,-8.4674,-120.74,-253.63,70.807,198.61] ;
.END
.PROGRAM trace.part(.&p.rel[,]) #2
  PRINT "Starting T"
  PRINT "Approaching Starting Point of T"
  LAPPRO .p.rel[1,0],20
  JMOVE .p.rel[1,0]
  JMOVE .p.rel[1,1]
  JMOVE .p.rel[1,2]
  JMOVE .p.rel[1,3]
  JMOVE .p.rel[1,4]
  JMOVE .p.rel[1,5]
  JMOVE .p.rel[1,6]
  JMOVE .p.rel[1,7]
  JMOVE .p.rel[1,8]
  JMOVE .p.rel[1,1]
  LDEPART 20
  PRINT "T Complete"
  PRINT "Starting I"
  PRINT "Approaching Starting Point of I"
  LAPPRO .p.rel[2,0],20
  JMOVE .p.rel[2,0]
  JMOVE .p.rel[2,1]
  JMOVE .p.rel[2,2]
  JMOVE .p.rel[2,3]
  JMOVE .p.rel[2,4]
  JMOVE .p.rel[2,1]
  LDEPART 20
  PRINT "I Complete"
  PRINT "Ti Complete"
  PRINT "Starting G"
  PRINT "Approaching Starting Point of G"
  LAPPRO .p.rel[3,0],20
  JMOVE .p.rel[3,0]
  JMOVE .p.rel[3,1]
  JMOVE .p.rel[3,2]
  JMOVE .p.rel[3,3]
  JMOVE .p.rel[3,4]
  JMOVE .p.rel[3,5]
  JMOVE .p.rel[3,6]
  JMOVE .p.rel[3,7]
  JMOVE .p.rel[3,8]
  JMOVE .p.rel[3,9]
  JMOVE .p.rel[3,10]
  JMOVE .p.rel[3,11]
  JMOVE .p.rel[3,12]
  JMOVE .p.rel[3,13]
  JMOVE .p.rel[3,14]
  JMOVE .p.rel[3,15]
  JMOVE .p.rel[3,16]
  JMOVE .p.rel[3,17]
  JMOVE .p.rel[3,18]
  JMOVE .p.rel[3,19]
  JMOVE .p.rel[3,20]
  JMOVE .p.rel[3,21]
  JMOVE .p.rel[3,22]
  JMOVE .p.rel[3,23]
  JMOVE .p.rel[3,24]
  JMOVE .p.rel[3,25]
  JMOVE .p.rel[3,26]
  JMOVE .p.rel[3,27]
  JMOVE .p.rel[3,28]
  JMOVE .p.rel[3,29]
  JMOVE .p.rel[3,30]
  JMOVE .p.rel[3,31]
  JMOVE .p.rel[3,32]
  JMOVE .p.rel[3,1]
  LDEPART 20
  PRINT "G Complete"
  PRINT "Tig Complete"
  PRINT "Starting B"
  PRINT "Approaching Starting Point of B"
  LAPPRO .p.rel[4,0],20
  JMOVE .p.rel[4,0]
  JMOVE .p.rel[4,1]
  JMOVE .p.rel[4,2]
  JMOVE .p.rel[4,3]
  JMOVE .p.rel[4,4]
  JMOVE .p.rel[4,5]
  JMOVE .p.rel[4,6]
  JMOVE .p.rel[4,7]
  JMOVE .p.rel[4,8]
  JMOVE .p.rel[4,9]
  JMOVE .p.rel[4,10]
  JMOVE .p.rel[4,11]
  JMOVE .p.rel[4,12]
  JMOVE .p.rel[4,13]
  JMOVE .p.rel[4,14]
  JMOVE .p.rel[4,15]
  JMOVE .p.rel[4,16]
  JMOVE .p.rel[4,17]
  JMOVE .p.rel[4,18]
  JMOVE .p.rel[4,19]
  JMOVE .p.rel[4,1]
  LDEPART 20
  LAPPRO .p.rel[4,20],20
  JMOVE .p.rel[4,20]
  JMOVE .p.rel[4,21]
  JMOVE .p.rel[4,22]
  JMOVE .p.rel[4,23]
  JMOVE .p.rel[4,24]
  JMOVE .p.rel[4,25]
  JMOVE .p.rel[4,26]
  JMOVE .p.rel[4,27]
  JMOVE .p.rel[4,28]
  JMOVE .p.rel[4,20]
  LDEPART 20
  LAPPRO .p.rel[4,29],20
  JMOVE .p.rel[4,29]
  JMOVE .p.rel[4,30]
  JMOVE .p.rel[4,31]
  JMOVE .p.rel[4,32]
  JMOVE .p.rel[4,33]
  JMOVE .p.rel[4,34]
  JMOVE .p.rel[4,35]
  JMOVE .p.rel[4,29]
  LDEPART 20
  PRINT "B Complete"
  PRINT "Tig B Complete"
  PRINT "Starting R"
  PRINT "Approaching Starting Point of R"
  LAPPRO .p.rel[5,0],20
  JMOVE .p.rel[5,0]
  JMOVE .p.rel[5,1]
  JMOVE .p.rel[5,2]
  JMOVE .p.rel[5,3]
  JMOVE .p.rel[5,4]
  JMOVE .p.rel[5,5]
  JMOVE .p.rel[5,6]
  JMOVE .p.rel[5,7]
  JMOVE .p.rel[5,8]
  JMOVE .p.rel[5,9]
  JMOVE .p.rel[5,10]
  JMOVE .p.rel[5,11]
  JMOVE .p.rel[5,12]
  JMOVE .p.rel[5,13]
  JMOVE .p.rel[5,14]
  JMOVE .p.rel[5,15]
  JMOVE .p.rel[5,1]
  LDEPART 20
  PRINT "R Complete"
  PRINT "Tig Br Complete"
  PRINT "Starting U"
  PRINT "Approaching Starting Point of U"
  LAPPRO .p.rel[6,0],20
  JMOVE .p.rel[6,0]
  JMOVE .p.rel[6,1]
  JMOVE .p.rel[6,2]
  JMOVE .p.rel[6,3]
  JMOVE .p.rel[6,4]
  JMOVE .p.rel[6,5]
  JMOVE .p.rel[6,6]
  JMOVE .p.rel[6,7]
  JMOVE .p.rel[6,8]
  JMOVE .p.rel[6,9]
  JMOVE .p.rel[6,10]
  JMOVE .p.rel[6,11]
  JMOVE .p.rel[6,12]
  JMOVE .p.rel[6,13]
  JMOVE .p.rel[6,14]
  JMOVE .p.rel[6,15]
  JMOVE .p.rel[6,16]
  JMOVE .p.rel[6,1]
  LDEPART 20
  PRINT "U Complete"
  PRINT "Tig Bru Complete"
  PRINT "Starting S"
  PRINT "Approaching Starting Point of S"
  LAPPRO .p.rel[7,0],20
  JMOVE .p.rel[7,0]
  JMOVE .p.rel[7,1]
  JMOVE .p.rel[7,2]
  JMOVE .p.rel[7,3]
  JMOVE .p.rel[7,4]
  JMOVE .p.rel[7,5]
  JMOVE .p.rel[7,6]
  JMOVE .p.rel[7,7]
  JMOVE .p.rel[7,8]
  JMOVE .p.rel[7,9]
  JMOVE .p.rel[7,10]
  JMOVE .p.rel[7,11]
  JMOVE .p.rel[7,12]
  JMOVE .p.rel[7,13]
  JMOVE .p.rel[7,14]
  JMOVE .p.rel[7,15]
  JMOVE .p.rel[7,16]
  JMOVE .p.rel[7,17]
  JMOVE .p.rel[7,18]
  JMOVE .p.rel[7,19]
  JMOVE .p.rel[7,20]
  JMOVE .p.rel[7,21]
  JMOVE .p.rel[7,22]
  JMOVE .p.rel[7,23]
  JMOVE .p.rel[7,24]
  JMOVE .p.rel[7,25]
  JMOVE .p.rel[7,26]
  JMOVE .p.rel[7,27]
  JMOVE .p.rel[7,28]
  JMOVE .p.rel[7,29]
  JMOVE .p.rel[7,30]
  JMOVE .p.rel[7,31]
  JMOVE .p.rel[7,32]
  JMOVE .p.rel[7,33]
  JMOVE .p.rel[7,34]
  JMOVE .p.rel[7,35]
  JMOVE .p.rel[7,1]
  LDEPART 20
  PRINT "S Complete"
  PRINT "Tig Brus Complete"
  PRINT "Starting H"
  PRINT "Approaching Starting Point of H"
  LAPPRO .p.rel[8,0],20
  JMOVE .p.rel[8,0]
  JMOVE .p.rel[8,1]
  JMOVE .p.rel[8,2]
  JMOVE .p.rel[8,3]
  JMOVE .p.rel[8,4]
  JMOVE .p.rel[8,5]
  JMOVE .p.rel[8,6]
  JMOVE .p.rel[8,7]
  JMOVE .p.rel[8,8]
  JMOVE .p.rel[8,9]
  JMOVE .p.rel[8,10]
  JMOVE .p.rel[8,11]
  JMOVE .p.rel[8,12]
  JMOVE .p.rel[8,13]
  JMOVE .p.rel[8,14]
  JMOVE .p.rel[8,15]
  JMOVE .p.rel[8,16]
  JMOVE .p.rel[8,17]
  JMOVE .p.rel[8,18]
  JMOVE .p.rel[8,19]
  JMOVE .p.rel[8,20]
  JMOVE .p.rel[8,21]
  JMOVE .p.rel[8,1]
  LDEPART 20
  PRINT "H Complete"
  PRINT "Tig Brush Complete"
  PRINT "Starting S"
  PRINT "Approaching Starting Point of S"
  LAPPRO .p.rel[9,0],20
  JMOVE .p.rel[9,0]
  JMOVE .p.rel[9,1]
  JMOVE .p.rel[9,2]
  JMOVE .p.rel[9,3]
  JMOVE .p.rel[9,4]
  JMOVE .p.rel[9,5]
  JMOVE .p.rel[9,6]
  JMOVE .p.rel[9,7]
  JMOVE .p.rel[9,8]
  JMOVE .p.rel[9,9]
  JMOVE .p.rel[9,10]
  JMOVE .p.rel[9,11]
  JMOVE .p.rel[9,12]
  JMOVE .p.rel[9,13]
  JMOVE .p.rel[9,14]
  JMOVE .p.rel[9,15]
  JMOVE .p.rel[9,16]
  JMOVE .p.rel[9,17]
  JMOVE .p.rel[9,18]
  JMOVE .p.rel[9,19]
  JMOVE .p.rel[9,20]
  JMOVE .p.rel[9,21]
  JMOVE .p.rel[9,22]
  JMOVE .p.rel[9,23]
  JMOVE .p.rel[9,24]
  JMOVE .p.rel[9,25]
  JMOVE .p.rel[9,26]
  JMOVE .p.rel[9,27]
  JMOVE .p.rel[9,28]
  JMOVE .p.rel[9,29]
  JMOVE .p.rel[9,30]
  JMOVE .p.rel[9,31]
  JMOVE .p.rel[9,1]
  LDEPART 20
  PRINT "S Complete"
  PRINT "Starting S"
  PRINT "Approaching Starting Point of S"
  LAPPRO .p.rel[10,0],20
  JMOVE .p.rel[10,0]
  JMOVE .p.rel[10,1]
  JMOVE .p.rel[10,2]
  JMOVE .p.rel[10,3]
  JMOVE .p.rel[10,4]
  JMOVE .p.rel[10,5]
  JMOVE .p.rel[10,6]
  JMOVE .p.rel[10,7]
  JMOVE .p.rel[10,8]
  JMOVE .p.rel[10,9]
  JMOVE .p.rel[10,10]
  JMOVE .p.rel[10,11]
  JMOVE .p.rel[10,12]
  JMOVE .p.rel[10,13]
  JMOVE .p.rel[10,14]
  JMOVE .p.rel[10,15]
  JMOVE .p.rel[10,16]
  JMOVE .p.rel[10,17]
  JMOVE .p.rel[10,18]
  JMOVE .p.rel[10,19]
  JMOVE .p.rel[10,20]
  JMOVE .p.rel[10,21]
  JMOVE .p.rel[10,22]
  JMOVE .p.rel[10,23]
  JMOVE .p.rel[10,24]
  JMOVE .p.rel[10,25]
  JMOVE .p.rel[10,26]
  JMOVE .p.rel[10,27]
  JMOVE .p.rel[10,28]
  JMOVE .p.rel[10,29]
  JMOVE .p.rel[10,30]
  JMOVE .p.rel[10,31]
  JMOVE .p.rel[10,1]
  LDEPART 20
  PRINT "SS Complete"
  PRINT "Starting A"
  PRINT "Approaching Starting Point of A"
  LAPPRO .p.rel[11,0],20
  JMOVE .p.rel[11,0]
  JMOVE .p.rel[11,1]
  JMOVE .p.rel[11,2]
  JMOVE .p.rel[11,3]
  JMOVE .p.rel[11,4]
  JMOVE .p.rel[11,5]
  JMOVE .p.rel[11,6]
  JMOVE .p.rel[11,7]
  JMOVE .p.rel[11,8]
  JMOVE .p.rel[11,9]
  JMOVE .p.rel[11,10]
  JMOVE .p.rel[11,11]
  JMOVE .p.rel[11,12]
  JMOVE .p.rel[11,13]
  JMOVE .p.rel[11,1]
  LDEPART 20
  PRINT "SSA Complete"
  PRINT "Starting L"
  PRINT "Approaching Starting Point of L"
  LAPPRO .p.rel[12,0],20
  JMOVE .p.rel[12,0]
  JMOVE .p.rel[12,1]
  JMOVE .p.rel[12,2]
  JMOVE .p.rel[12,3]
  JMOVE .p.rel[12,4]
  JMOVE .p.rel[12,5]
  JMOVE .p.rel[12,6]
  JMOVE .p.rel[12,7]
  JMOVE .p.rel[12,8]
  JMOVE .p.rel[12,1]
  LDEPART 20
  PRINT "SSAL Complete"
  PRINT "Starting L"
  PRINT "Approaching Starting Point of L"
  LAPPRO .p.rel[13,0],20
  JMOVE .p.rel[13,0]
  JMOVE .p.rel[13,1]
  JMOVE .p.rel[13,2]
  JMOVE .p.rel[13,3]
  JMOVE .p.rel[13,4]
  JMOVE .p.rel[13,5]
  JMOVE .p.rel[13,6]
  JMOVE .p.rel[13,7]
  JMOVE .p.rel[13,8]
  JMOVE .p.rel[13,9]
  JMOVE .p.rel[13,1]
  LDEPART 20
  PRINT "SSALL Complete"
  PRINT "Starting Y"
  PRINT "Approaching Starting Point of Y"
  LAPPRO .p.rel[14,0],20
  JMOVE .p.rel[14,0]
  JMOVE .p.rel[14,1]
  JMOVE .p.rel[14,2]
  JMOVE .p.rel[14,3]
  JMOVE .p.rel[14,4]
  JMOVE .p.rel[14,5]
  JMOVE .p.rel[14,6]
  JMOVE .p.rel[14,7]
  JMOVE .p.rel[14,8]
  JMOVE .p.rel[14,9]
  JMOVE .p.rel[14,1]
  LDEPART 20
  PRINT "SSALLY Complete"
.END
