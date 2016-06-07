;; Write a program that prints the numbers from 1 to 100. But for
;; multiples of three print "Fizz" instead of the number and for the
;; multiples of five print "Buzz". For numbers which are multiples of
;; both three and five print "FizzBuzz".

.class public final FizzBuzz
.super java/lang/Object

.method public <init>()V
    aload_0
    invokenonvirtual java/lang/Object/<init>()V
    return
.end method

.method public static main([Ljava/lang/String;)V
    .limit stack 3
    .limit locals 3

    getstatic java/lang/System/out Ljava/io/PrintStream;
    astore_1

    ;; int i = 1
    iconst_1
    istore_2

    Fizz:
        ;; if ((↓ = i % 3) != 0) goto Buzz
        iload_2
        iconst_3
        irem
        dup
        ifne Buzz

        ;; System.out.print("Fizz")
        aload_1
        ldc "Fizz"
        invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

    Buzz:
        ;; if (i % 5 != 0) goto Self
        iload_2
        iconst_5
        irem
        ifne Self

        ;; System.out.print("Buzz")
        aload_1
        ldc "Buzz"
        invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

        pop
        goto Cont

    Self:
        ;; if (↑ == 0) goto Cont
        ifeq Cont

        ;; System.out.print(i)
        aload_1
        iload_2
        invokevirtual java/io/PrintStream/print(I)V

    Cont:
        ;; System.out.print("\n")
        aload_1
        ldc "\n"
        invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

        ;; i++
        iinc 2 1

        ;; if (i < 100) goto Fizz
        iload_2
        bipush 100
        if_icmple Fizz

    return
.end method

;; .end class
