;; .source HelloWorld.j
.class public final HelloWorld
.super java/lang/Object

.field private static final name Ljava/lang/String; = "Choe Gu-sung"

.method public <init>()V
    aload_0
    invokenonvirtual java/lang/Object/<init>()V
    return
.end method

.method public static main([Ljava/lang/String;)V
    .limit stack 2
    .limit locals 1

    getstatic java/lang/System/out Ljava/io/PrintStream;
    ldc "Hello, world!"
    invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

    return
.end method

;; .end class
