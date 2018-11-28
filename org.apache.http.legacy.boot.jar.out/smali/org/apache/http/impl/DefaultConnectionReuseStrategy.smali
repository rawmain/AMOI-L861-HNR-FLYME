.class public Lorg/apache/http/impl/DefaultConnectionReuseStrategy;
.super Ljava/lang/Object;
.source "DefaultConnectionReuseStrategy.java"

# interfaces
.implements Lorg/apache/http/ConnectionReuseStrategy;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    return-void
.end method


# virtual methods
.method protected createTokenIterator(Lorg/apache/http/HeaderIterator;)Lorg/apache/http/TokenIterator;
    .locals 1
    .param p1, "hit"    # Lorg/apache/http/HeaderIterator;

    .prologue
    .line 185
    new-instance v0, Lorg/apache/http/message/BasicTokenIterator;

    invoke-direct {v0, p1}, Lorg/apache/http/message/BasicTokenIterator;-><init>(Lorg/apache/http/HeaderIterator;)V

    return-object v0
.end method

.method public keepAlive(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z
    .locals 12
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 85
    if-nez p1, :cond_0

    .line 86
    new-instance v8, Ljava/lang/IllegalArgumentException;

    .line 87
    const-string/jumbo v9, "HTTP response may not be null."

    .line 86
    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 89
    :cond_0
    if-nez p2, :cond_1

    .line 90
    new-instance v8, Ljava/lang/IllegalArgumentException;

    .line 91
    const-string/jumbo v9, "HTTP context may not be null."

    .line 90
    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 95
    :cond_1
    const-string/jumbo v8, "http.connection"

    invoke-interface {p2, v8}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 94
    check-cast v0, Lorg/apache/http/HttpConnection;

    .line 97
    .local v0, "conn":Lorg/apache/http/HttpConnection;
    if-eqz v0, :cond_2

    invoke-interface {v0}, Lorg/apache/http/HttpConnection;->isOpen()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 103
    :cond_2
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    .line 104
    .local v1, "entity":Lorg/apache/http/HttpEntity;
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v8

    invoke-interface {v8}, Lorg/apache/http/StatusLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v7

    .line 105
    .local v7, "ver":Lorg/apache/http/ProtocolVersion;
    if-eqz v1, :cond_5

    .line 106
    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-gez v8, :cond_5

    .line 107
    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->isChunked()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 108
    sget-object v8, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    invoke-virtual {v7, v8}, Lorg/apache/http/ProtocolVersion;->lessEquals(Lorg/apache/http/ProtocolVersion;)Z

    move-result v8

    .line 107
    if-eqz v8, :cond_5

    .line 111
    :cond_3
    const/4 v8, 0x0

    return v8

    .line 98
    .end local v1    # "entity":Lorg/apache/http/HttpEntity;
    .end local v7    # "ver":Lorg/apache/http/ProtocolVersion;
    :cond_4
    const/4 v8, 0x0

    return v8

    .line 119
    .restart local v1    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v7    # "ver":Lorg/apache/http/ProtocolVersion;
    :cond_5
    const-string/jumbo v8, "Connection"

    invoke-interface {p1, v8}, Lorg/apache/http/HttpResponse;->headerIterator(Ljava/lang/String;)Lorg/apache/http/HeaderIterator;

    move-result-object v2

    .line 120
    .local v2, "hit":Lorg/apache/http/HeaderIterator;
    invoke-interface {v2}, Lorg/apache/http/HeaderIterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_6

    .line 121
    const-string/jumbo v8, "Proxy-Connection"

    invoke-interface {p1, v8}, Lorg/apache/http/HttpResponse;->headerIterator(Ljava/lang/String;)Lorg/apache/http/HeaderIterator;

    move-result-object v2

    .line 146
    :cond_6
    invoke-interface {v2}, Lorg/apache/http/HeaderIterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_a

    .line 148
    :try_start_0
    invoke-virtual {p0, v2}, Lorg/apache/http/impl/DefaultConnectionReuseStrategy;->createTokenIterator(Lorg/apache/http/HeaderIterator;)Lorg/apache/http/TokenIterator;

    move-result-object v5

    .line 149
    .local v5, "ti":Lorg/apache/http/TokenIterator;
    const/4 v3, 0x0

    .line 150
    .local v3, "keepalive":Z
    :cond_7
    :goto_0
    invoke-interface {v5}, Lorg/apache/http/TokenIterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_9

    .line 151
    invoke-interface {v5}, Lorg/apache/http/TokenIterator;->nextToken()Ljava/lang/String;

    move-result-object v6

    .line 152
    .local v6, "token":Ljava/lang/String;
    const-string/jumbo v8, "Close"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 153
    const/4 v8, 0x0

    return v8

    .line 154
    :cond_8
    const-string/jumbo v8, "Keep-Alive"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/apache/http/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v8

    if-eqz v8, :cond_7

    .line 156
    const/4 v3, 0x1

    goto :goto_0

    .line 159
    .end local v6    # "token":Ljava/lang/String;
    :cond_9
    if-eqz v3, :cond_a

    .line 160
    const/4 v8, 0x1

    return v8

    .line 163
    .end local v3    # "keepalive":Z
    .end local v5    # "ti":Lorg/apache/http/TokenIterator;
    :catch_0
    move-exception v4

    .line 166
    .local v4, "px":Lorg/apache/http/ParseException;
    const/4 v8, 0x0

    return v8

    .line 171
    .end local v4    # "px":Lorg/apache/http/ParseException;
    :cond_a
    sget-object v8, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    invoke-virtual {v7, v8}, Lorg/apache/http/ProtocolVersion;->lessEquals(Lorg/apache/http/ProtocolVersion;)Z

    move-result v8

    if-eqz v8, :cond_b

    const/4 v8, 0x0

    :goto_1
    return v8

    :cond_b
    const/4 v8, 0x1

    goto :goto_1
.end method
