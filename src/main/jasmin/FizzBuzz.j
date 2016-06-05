.class public final FizzBuzz
.super java/lang/Object

.method public <init>()V
    aload_0
    invokenonvirtual java/lang/Object/<init>()V
    return
.end method

.method public static main([Ljava/lang/String;)V
    .limit stack 2
    .limit locals 5

    getstatic java/lang/System/out Ljava/io/PrintStream;
    astore_1

    ;; int i = 1
    iconst_1
    istore_2

    ;; int f = 0
    iconst_0
    istore_3

    ;; int b = 0
    iconst_0
    istore 4

    Loop:
        ;; f = i % 3
        iload_2
        iconst_3
        irem
        istore_3

        ;; b = i % 5
        iload_2
        iconst_5
        irem
        istore 4

        iload_3
        ifeq Fizz

        iload 4
        ifeq Fizz

        ;; System.out.print(i)
        aload_1
        iload_2
        invokestatic java/lang/String/valueOf(I)Ljava/lang/String;
        invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

    Fizz:
        iload_3
        ifne Buzz

        ;; System.out.print("Fizz")
        aload_1
        ldc "Fizz"
        invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

    Buzz:
        iload 4
        ifne Cont

        ;; System.out.print("Buzz")
        aload_1
        ldc "Buzz"
        invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

    Cont:
        ;; System.out.print("\n")
        aload_1
        ldc "\n"
        invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

        ;; i++
        iinc 2 1

        iload_2
        bipush 100
        if_icmple Loop

    return
.end method

;; .end class
