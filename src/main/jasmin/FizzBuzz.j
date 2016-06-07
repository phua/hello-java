;; Write a program that prints the numbers from 1 to 100. But for
;; multiples of three print "Fizz" instead of the number and for the
;; multiples of five print "Buzz". For numbers which are multiples of
;; both three and five print "FizzBuzz".

.class public final FizzBuzz
.super java/lang/Object

.field private static final N I = 100

.field private final n I

.method public <init>()V
    .limit stack 2

    ;; this(N)
    aload_0
    getstatic FizzBuzz/N I
    invokespecial FizzBuzz/<init>(I)V

    return
.end method

.method public <init>(I)V
    .limit stack 2
    .limit locals 2

    ;; super()
    aload_0
    invokenonvirtual java/lang/Object/<init>()V

    ;; this.n = n
    aload_0
    iload_1
    putfield FizzBuzz/n I

    return
.end method

.method public getN()I
    aload_0
    getfield FizzBuzz/n I
    ireturn
.end method

.method public run()V
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

        ;; if (i < n) goto Fizz
        iload_2
        aload_0
        invokevirtual FizzBuzz/getN()I
        if_icmple Fizz

    return
.end method

.method public static main([Ljava/lang/String;)V
    .limit stack 2

    ;; new FizzBuzz().run();
    new FizzBuzz
    dup
    invokespecial FizzBuzz/<init>()V
    invokevirtual FizzBuzz/run()V

    return
.end method

;; .end class
