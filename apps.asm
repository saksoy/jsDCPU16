:loop ADD A, 10
IFN A, 20
ADD B, 1
SET PC, loop

a802
d00d
8412
7dc1
0000



SET B, 10
:loop ADD A, 3
IFG A, B
ADD B, 4
SET PC, loop

a811
8c02
040e
9012
7dc1
0001





SET A, 4
SET B, 5
DIV A, B

9001
9411
0405



SET A, 20
SET B, 5
DIV A, B

d001
9411
0405






; Try some basic stuff
                      SET A, 0x30              ; 7c01 0030
                      SET [0x1000], 0x20       ; 7de1 1000 0020
                      SUB A, [0x1000]          ; 7803 1000
                      IFN A, 0x10              ; c00d
                         SET PC, crash         ; 7dc1 001a [*]

        ; Do a loopy thing
                      SET I, 10                ; a861
                      SET A, 0x2000            ; 7c01 2000
        :loop         SET [0x2000+I], [A]      ; 2161 2000
                      SUB I, 1                 ; 8463
                      IFN I, 0                 ; 806d
                         SET PC, loop          ; 7dc1 000d [*]

        ; Call a subroutine
                      SET X, 0x4               ; 9031
; Hang forever. X should now be 0x40 if everything went right.
        :crash        SET PC, crash            ; 7dc1 001a [*]

7c01
0030
7de1
1000
0020
7803
1000
c00d
7dc1
0014
a861
7c01
2000
2161
2000
8463
806d
7dc1
000d
9031
7dc1
0014