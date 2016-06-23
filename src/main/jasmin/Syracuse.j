;; http://mathworld.wolfram.com/CollatzProblem.html
;; https://xkcd.com/710/
;;
;; x_{n+1} = x_{n} / 2     if x_{n} is even
;;         = 3 * x_{n} + 1 if x_{n} is odd

.class public final Syracuse
.super java/lang/Object

.method public <init>()V
    aload_0
    invokenonvirtual java/lang/Object/<init>()V
    return
.end method

.method private next(I)I
    .limit stack 3
    .limit locals 2

    ;; if (x % 2 == 0) goto Even
    iload_1
    dup
    iconst_2
    irem
    ifeq Even

Odd:
    ;; return 3 * x + 1
    iconst_3
    imul
    iconst_1
    iadd
    ireturn

Even:
    ;; return x / 2
    iconst_2
    idiv
    ireturn
.end method

.method public run(I)I
    .limit stack 3
    .limit locals 4

    .var 2 is i I from Loop to Return

    ;; int i = 1
    iconst_1
    istore_2

    .var 3 is sysout Ljava/io/PrintStream; from Loop to Return

    getstatic java/lang/System/out Ljava/io/PrintStream;
    astore_3

Loop:
    ;; System.out.print(x)
    aload_3
    dup
    iload_1
    invokevirtual java/io/PrintStream/print(I)V
    ;; System.out.print(" ")
    ldc " "
    invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V

    ;; if (x == 0) goto Return
    iload_1
    ifeq Return
    ;; if (x == 1) goto Return
    iload_1
    iconst_m1
    iadd
    ifeq Return

    ;; x = this.next(x)
    aload_0
    iload_1
    invokevirtual Syracuse/next(I)I
    istore_1

    ;; i++
    iinc 2 1

    goto Loop

Return:
    ;; System.out.println()
    aload_3
    invokevirtual java/io/PrintStream/println()V

    ;; return i
    iload_2
    ireturn
.end method

.method public static main([Ljava/lang/String;)V
    .limit stack 2
    .limit locals 3

    ;; Syracuse s = new Syracuse()
    new Syracuse
    dup
    invokespecial Syracuse/<init>()V
    astore_1

    .var 2 is i I from Loop to Loop

    ;; int i = 32767
    sipush 32767
    istore_2

Loop:
    ;; s.run(i)
    aload_1
    iload_2
    invokevirtual Syracuse/run(I)I

    pop

    ;; i--
    iinc 2 -1

    ;; if (i > 0) goto Loop
    iload_2
    ifne Loop

    return
.end method

;; .end class
