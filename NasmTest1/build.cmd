del a.exe
del hello.obj

.\nasm\nasm -f win32 hello.asm

gcc hello.obj

a.exe 

