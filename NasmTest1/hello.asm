; ----------------------------------------------------------------------------
; hello.asm
;
; This is a Win32 console program that calculates a factorial of an input number
; ----------------------------------------------------------------------------

    global  _main
    extern  _printf

    section .text
	
_main:

    mov     eax, 9          ; Our input variable

    ; Call _factorial
    push    eax
    call    _factorial
    add     esp, 4      ; Pop 4 bytes, but don't need to have access to the value

    ; Print the result
    push    eax
    call    print_number
    add     esp, 4          ; POP 4 bytes

    ; Return from the main function
    ret

_factorial:
    ; Set up our stack frame
    push    ebp             ; must save old ebp
	mov	    ebp, esp		; point ebp to this frame
	sub	    esp, 4		    ; make space for locals

    ; Display our input value / variable
    push    DWORD [ebp+8]
    call    print_number
    add     esp, 4          ; POP 4 bytes

    mov     eax, 1          ; Initializa our start value

loop:
    cmp     DWORD [ebp+8], 1
    je      done
    mul     DWORD [ebp+8]
    dec     DWORD [ebp+8]
    jmp     loop

done:
    mov	    esp, ebp		; clean up locals
	pop	    ebp			    ; restore old ebp

    ret
    
print_number:
    mov     eax, [esp+4]
    push    eax
    push    message_result
    call    _printf
    add     esp, 4      ; same as pop 4 bytes
    add     esp, 4      ; same as pop 4 bytes
    ret
	
section .data
	
message_result:
    db  'Number: %d', 10, 0

