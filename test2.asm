{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 MS Sans Serif;}{\f1\fnil MS Sans Serif;}}
\viewkind4\uc1\pard\f0\fs16 mov r1, 5
\par mov r2, 0
\par cmp r1, 0
\par beq 10
\par add r2, r1
\par sub r1, 1
\par jmp 8
\par clz
\par mov r3, 100
\par mov 10(r3), r2
\par push r2
\par mov r2, 0
\par pop r4
\par halt
\par \f1 
\par }
 