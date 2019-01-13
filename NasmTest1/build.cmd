del a.exe
del hello.obj

.\nasm\nasm -fwin32 hello.asm

gcc hello.obj

a.exe 

