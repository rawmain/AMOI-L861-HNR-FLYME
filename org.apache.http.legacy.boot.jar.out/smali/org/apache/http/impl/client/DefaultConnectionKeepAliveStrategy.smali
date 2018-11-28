.class public Lorg/apache/http/impl/client/DefaultConnectionKeepAliveStrategy;
.super Ljava/lang/Object;
.source "DefaultConnectionKeepAliveStrategy.java"

# interfaces
.implements Lorg/apache/http/conn/ConnectionKeepAliveStrategy;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getKeepAliveDuration(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)J
    .locals 10
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 62
    if-nez p1, :cond_0

    .line 63
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "HTTP response may not be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 65
    :cond_0
    new-instance v2, Lorg/apache/http/message/BasicHeaderElementIterator;

    .line 66
    const-string/jumbo v5, "Keep-Alive"

    invoke-interface {p1, v5}, Lorg/apache/http/HttpResponse;->headerIterator(Ljava/lang/String;)Lorg/apache/http/HeaderIterator;

    move-result-object v5

    .line 65
    invoke-direct {v2, v5}, Lorg/apache/http/message/BasicHeaderElementIterator;-><init>(Lorg/apache/http/HeaderIterator;)V

    .line 67
    .local v2, "it":Lorg/apache/http/HeaderElementIterator;
    :cond_1
    :goto_0
    invoke-interface {v2}, Lorg/apache/http/HeaderElementIterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 68
    invoke-interface {v2}, Lorg/apache/http/HeaderElementIterator;->nextElement()Lorg/apache/http/HeaderElement;

    move-result-object v0

    .line 69
    .local v0, "he":Lorg/apache/http/HeaderElement;
    invoke-interface {v0}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v3

    .line 70
    .local v3, "param":Ljava/lang/String;
    invoke-interface {v0}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 71
    .local v4, "value":Ljava/lang/String;
    if-eqz v4, :cond_1

    const-string/jumbo v5, "timeout"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 73
    :try_start_0
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    mul-long/2addr v6, v8

    return-wide v6

    .line 74
    :catch_0
    move-exception v1

    .local v1, "ignore":Ljava/lang/NumberFormatException;
    goto :goto_0

    .line 78
    .end local v0    # "he":Lorg/apache/http/HeaderElement;
    .end local v1    # "ignore":Ljava/lang/NumberFormatException;
    .end local v3    # "param":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    :cond_2
    const-wide/16 v6, -0x1

    return-wide v6
.end method
