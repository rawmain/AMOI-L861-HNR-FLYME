.class public Lorg/apache/http/protocol/ResponseConnControl;
.super Ljava/lang/Object;
.source "ResponseConnControl.java"

# interfaces
.implements Lorg/apache/http/HttpResponseInterceptor;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    return-void
.end method


# virtual methods
.method public process(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V
    .locals 10
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    if-nez p1, :cond_0

    .line 70
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "HTTP response may not be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 72
    :cond_0
    if-nez p2, :cond_1

    .line 73
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "HTTP context may not be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 76
    :cond_1
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v3

    .line 77
    .local v3, "status":I
    const/16 v5, 0x190

    if-eq v3, v5, :cond_2

    .line 78
    const/16 v5, 0x198

    if-ne v3, v5, :cond_3

    .line 84
    :cond_2
    const-string/jumbo v5, "Connection"

    const-string/jumbo v6, "Close"

    invoke-interface {p1, v5, v6}, Lorg/apache/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    return-void

    .line 79
    :cond_3
    const/16 v5, 0x19b

    if-eq v3, v5, :cond_2

    .line 80
    const/16 v5, 0x19d

    if-eq v3, v5, :cond_2

    .line 81
    const/16 v5, 0x19e

    if-eq v3, v5, :cond_2

    .line 82
    const/16 v5, 0x1f7

    if-eq v3, v5, :cond_2

    .line 83
    const/16 v5, 0x1f5

    if-eq v3, v5, :cond_2

    .line 89
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 90
    .local v0, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v0, :cond_5

    .line 91
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v4

    .line 92
    .local v4, "ver":Lorg/apache/http/ProtocolVersion;
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v5, v6, v8

    if-gez v5, :cond_5

    .line 93
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->isChunked()Z

    move-result v5

    if-eqz v5, :cond_4

    sget-object v5, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    invoke-virtual {v4, v5}, Lorg/apache/http/ProtocolVersion;->lessEquals(Lorg/apache/http/ProtocolVersion;)Z

    move-result v5

    .line 92
    if-eqz v5, :cond_5

    .line 94
    :cond_4
    const-string/jumbo v5, "Connection"

    const-string/jumbo v6, "Close"

    invoke-interface {p1, v5, v6}, Lorg/apache/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    return-void

    .line 100
    .end local v4    # "ver":Lorg/apache/http/ProtocolVersion;
    :cond_5
    const-string/jumbo v5, "http.request"

    invoke-interface {p2, v5}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 99
    check-cast v2, Lorg/apache/http/HttpRequest;

    .line 101
    .local v2, "request":Lorg/apache/http/HttpRequest;
    if-eqz v2, :cond_6

    .line 102
    const-string/jumbo v5, "Connection"

    invoke-interface {v2, v5}, Lorg/apache/http/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    .line 103
    .local v1, "header":Lorg/apache/http/Header;
    if-eqz v1, :cond_6

    .line 104
    const-string/jumbo v5, "Connection"

    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v5, v6}, Lorg/apache/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .end local v1    # "header":Lorg/apache/http/Header;
    :cond_6
    return-void
.end method
