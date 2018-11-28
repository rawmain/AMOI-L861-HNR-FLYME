.class public Lorg/apache/http/client/utils/CloneUtils;
.super Ljava/lang/Object;
.source "CloneUtils.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clone(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8
    .param p0, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 46
    if-nez p0, :cond_0

    .line 47
    return-object v6

    .line 49
    :cond_0
    instance-of v6, p0, Ljava/lang/Cloneable;

    if-eqz v6, :cond_2

    .line 50
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 53
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    const-string/jumbo v7, "clone"

    const/4 v6, 0x0

    check-cast v6, [Ljava/lang/Class;

    invoke-virtual {v1, v7, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 58
    .local v5, "m":Ljava/lang/reflect/Method;
    const/4 v6, 0x0

    :try_start_1
    check-cast v6, [Ljava/lang/Object;

    invoke-virtual {v5, p0, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v6

    return-object v6

    .line 54
    .end local v5    # "m":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v3

    .line 55
    .local v3, "ex":Ljava/lang/NoSuchMethodException;
    new-instance v6, Ljava/lang/NoSuchMethodError;

    invoke-virtual {v3}, Ljava/lang/NoSuchMethodException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/NoSuchMethodError;-><init>(Ljava/lang/String;)V

    throw v6

    .line 66
    .end local v3    # "ex":Ljava/lang/NoSuchMethodException;
    .restart local v5    # "m":Ljava/lang/reflect/Method;
    :catch_1
    move-exception v2

    .line 67
    .local v2, "ex":Ljava/lang/IllegalAccessException;
    new-instance v6, Ljava/lang/IllegalAccessError;

    invoke-virtual {v2}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v6

    .line 59
    .end local v2    # "ex":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v4

    .line 60
    .local v4, "ex":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v4}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 61
    .local v0, "cause":Ljava/lang/Throwable;
    instance-of v6, v0, Ljava/lang/CloneNotSupportedException;

    if-eqz v6, :cond_1

    .line 62
    check-cast v0, Ljava/lang/CloneNotSupportedException;

    .end local v0    # "cause":Ljava/lang/Throwable;
    throw v0

    .line 64
    .restart local v0    # "cause":Ljava/lang/Throwable;
    :cond_1
    new-instance v6, Ljava/lang/Error;

    const-string/jumbo v7, "Unexpected exception"

    invoke-direct {v6, v7, v0}, Ljava/lang/Error;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 70
    .end local v0    # "cause":Ljava/lang/Throwable;
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "ex":Ljava/lang/reflect/InvocationTargetException;
    .end local v5    # "m":Ljava/lang/reflect/Method;
    :cond_2
    new-instance v6, Ljava/lang/CloneNotSupportedException;

    invoke-direct {v6}, Ljava/lang/CloneNotSupportedException;-><init>()V

    throw v6
.end method
