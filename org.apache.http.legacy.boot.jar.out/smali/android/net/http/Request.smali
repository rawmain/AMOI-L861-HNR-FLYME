.class Landroid/net/http/Request;
.super Ljava/lang/Object;
.source "Request.java"


# static fields
.field private static final ACCEPT_ENCODING_HEADER:Ljava/lang/String; = "Accept-Encoding"

.field private static final CONTENT_LENGTH_HEADER:Ljava/lang/String; = "content-length"

.field private static final HOST_HEADER:Ljava/lang/String; = "Host"

.field private static requestContentProcessor:Lorg/apache/http/protocol/RequestContent;


# instance fields
.field private mBodyLength:I

.field private mBodyProvider:Ljava/io/InputStream;

.field volatile mCancelled:Z

.field private final mClientResource:Ljava/lang/Object;

.field private mConnection:Landroid/net/http/Connection;

.field mEventHandler:Landroid/net/http/EventHandler;

.field mFailCount:I

.field mHost:Lorg/apache/http/HttpHost;

.field mHttpRequest:Lorg/apache/http/message/BasicHttpRequest;

.field private mLoadingPaused:Z

.field mPath:Ljava/lang/String;

.field mProxyHost:Lorg/apache/http/HttpHost;

.field private mReceivedBytes:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 93
    new-instance v0, Lorg/apache/http/protocol/RequestContent;

    invoke-direct {v0}, Lorg/apache/http/protocol/RequestContent;-><init>()V

    .line 92
    sput-object v0, Landroid/net/http/Request;->requestContentProcessor:Lorg/apache/http/protocol/RequestContent;

    .line 47
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lorg/apache/http/HttpHost;Lorg/apache/http/HttpHost;Ljava/lang/String;Ljava/io/InputStream;ILandroid/net/http/EventHandler;Ljava/util/Map;)V
    .locals 2
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "host"    # Lorg/apache/http/HttpHost;
    .param p3, "proxyHost"    # Lorg/apache/http/HttpHost;
    .param p4, "path"    # Ljava/lang/String;
    .param p5, "bodyProvider"    # Ljava/io/InputStream;
    .param p6, "bodyLength"    # I
    .param p7, "eventHandler"    # Landroid/net/http/EventHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/apache/http/HttpHost;",
            "Lorg/apache/http/HttpHost;",
            "Ljava/lang/String;",
            "Ljava/io/InputStream;",
            "I",
            "Landroid/net/http/EventHandler;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p8, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-boolean v1, p0, Landroid/net/http/Request;->mCancelled:Z

    .line 69
    iput v1, p0, Landroid/net/http/Request;->mFailCount:I

    .line 73
    iput v1, p0, Landroid/net/http/Request;->mReceivedBytes:I

    .line 83
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/net/http/Request;->mClientResource:Ljava/lang/Object;

    .line 86
    iput-boolean v1, p0, Landroid/net/http/Request;->mLoadingPaused:Z

    .line 110
    iput-object p7, p0, Landroid/net/http/Request;->mEventHandler:Landroid/net/http/EventHandler;

    .line 111
    iput-object p2, p0, Landroid/net/http/Request;->mHost:Lorg/apache/http/HttpHost;

    .line 112
    iput-object p3, p0, Landroid/net/http/Request;->mProxyHost:Lorg/apache/http/HttpHost;

    .line 113
    iput-object p4, p0, Landroid/net/http/Request;->mPath:Ljava/lang/String;

    .line 114
    iput-object p5, p0, Landroid/net/http/Request;->mBodyProvider:Ljava/io/InputStream;

    .line 115
    iput p6, p0, Landroid/net/http/Request;->mBodyLength:I

    .line 117
    if-nez p5, :cond_0

    const-string/jumbo v0, "POST"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 120
    :cond_0
    new-instance v0, Lorg/apache/http/message/BasicHttpEntityEnclosingRequest;

    .line 121
    invoke-virtual {p0}, Landroid/net/http/Request;->getUri()Ljava/lang/String;

    move-result-object v1

    .line 120
    invoke-direct {v0, p1, v1}, Lorg/apache/http/message/BasicHttpEntityEnclosingRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/net/http/Request;->mHttpRequest:Lorg/apache/http/message/BasicHttpRequest;

    .line 125
    if-eqz p5, :cond_1

    .line 126
    invoke-direct {p0, p5, p6}, Landroid/net/http/Request;->setBodyProvider(Ljava/io/InputStream;I)V

    .line 129
    :cond_1
    :goto_0
    const-string/jumbo v0, "Host"

    invoke-virtual {p0}, Landroid/net/http/Request;->getHostPort()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/net/http/Request;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    const-string/jumbo v0, "Accept-Encoding"

    const-string/jumbo v1, "gzip"

    invoke-virtual {p0, v0, v1}, Landroid/net/http/Request;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    invoke-virtual {p0, p8}, Landroid/net/http/Request;->addHeaders(Ljava/util/Map;)V

    .line 109
    return-void

    .line 118
    :cond_2
    new-instance v0, Lorg/apache/http/message/BasicHttpRequest;

    invoke-virtual {p0}, Landroid/net/http/Request;->getUri()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lorg/apache/http/message/BasicHttpRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Landroid/net/http/Request;->mHttpRequest:Lorg/apache/http/message/BasicHttpRequest;

    goto :goto_0
.end method

.method private static canResponseHaveBody(Lorg/apache/http/HttpRequest;I)Z
    .locals 3
    .param p0, "request"    # Lorg/apache/http/HttpRequest;
    .param p1, "status"    # I

    .prologue
    const/4 v0, 0x0

    .line 473
    const-string/jumbo v1, "HEAD"

    invoke-interface {p0}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 474
    return v0

    .line 476
    :cond_0
    const/16 v1, 0xc8

    if-lt p1, v1, :cond_1

    .line 477
    const/16 v1, 0xcc

    if-eq p1, v1, :cond_1

    .line 478
    const/16 v1, 0x130

    if-eq p1, v1, :cond_1

    const/4 v0, 0x1

    .line 476
    :cond_1
    return v0
.end method

.method private setBodyProvider(Ljava/io/InputStream;I)V
    .locals 4
    .param p1, "bodyProvider"    # Ljava/io/InputStream;
    .param p2, "bodyLength"    # I

    .prologue
    .line 490
    invoke-virtual {p1}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    if-nez v0, :cond_0

    .line 491
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 492
    const-string/jumbo v1, "bodyProvider must support mark()"

    .line 491
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 495
    :cond_0
    const v0, 0x7fffffff

    invoke-virtual {p1, v0}, Ljava/io/InputStream;->mark(I)V

    .line 497
    iget-object v0, p0, Landroid/net/http/Request;->mHttpRequest:Lorg/apache/http/message/BasicHttpRequest;

    check-cast v0, Lorg/apache/http/message/BasicHttpEntityEnclosingRequest;

    .line 498
    new-instance v1, Lorg/apache/http/entity/InputStreamEntity;

    int-to-long v2, p2

    invoke-direct {v1, p1, v2, v3}, Lorg/apache/http/entity/InputStreamEntity;-><init>(Ljava/io/InputStream;J)V

    .line 497
    invoke-virtual {v0, v1}, Lorg/apache/http/message/BasicHttpEntityEnclosingRequest;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 489
    return-void
.end method


# virtual methods
.method addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 168
    if-nez p1, :cond_0

    .line 169
    const-string/jumbo v0, "Null http header name"

    .line 170
    .local v0, "damage":Ljava/lang/String;
    invoke-static {v0}, Landroid/net/http/HttpLog;->e(Ljava/lang/String;)V

    .line 171
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 173
    .end local v0    # "damage":Ljava/lang/String;
    :cond_0
    if-eqz p2, :cond_1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_2

    .line 174
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Null or empty value for header \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 175
    .restart local v0    # "damage":Ljava/lang/String;
    invoke-static {v0}, Landroid/net/http/HttpLog;->e(Ljava/lang/String;)V

    .line 176
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 178
    .end local v0    # "damage":Ljava/lang/String;
    :cond_2
    iget-object v1, p0, Landroid/net/http/Request;->mHttpRequest:Lorg/apache/http/message/BasicHttpRequest;

    invoke-virtual {v1, p1, p2}, Lorg/apache/http/message/BasicHttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    return-void
.end method

.method addHeaders(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 186
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    .line 187
    return-void

    .line 191
    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 192
    .local v1, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 193
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 194
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p0, v2, v3}, Landroid/net/http/Request;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 185
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    return-void
.end method

.method declared-synchronized cancel()V
    .locals 1

    .prologue
    monitor-enter p0

    .line 369
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Landroid/net/http/Request;->mLoadingPaused:Z

    .line 370
    invoke-virtual {p0}, Landroid/net/http/Request;->notify()V

    .line 372
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/net/http/Request;->mCancelled:Z

    .line 373
    iget-object v0, p0, Landroid/net/http/Request;->mConnection:Landroid/net/http/Connection;

    if-eqz v0, :cond_0

    .line 374
    iget-object v0, p0, Landroid/net/http/Request;->mConnection:Landroid/net/http/Connection;

    invoke-virtual {v0}, Landroid/net/http/Connection;->cancel()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    .line 362
    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method complete()V
    .locals 2

    .prologue
    .line 452
    iget-object v1, p0, Landroid/net/http/Request;->mClientResource:Ljava/lang/Object;

    monitor-enter v1

    .line 453
    :try_start_0
    iget-object v0, p0, Landroid/net/http/Request;->mClientResource:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 451
    return-void

    .line 452
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method error(ILjava/lang/String;)V
    .locals 1
    .param p1, "errorId"    # I
    .param p2, "errorMessage"    # Ljava/lang/String;

    .prologue
    .line 518
    iget-object v0, p0, Landroid/net/http/Request;->mEventHandler:Landroid/net/http/EventHandler;

    invoke-interface {v0, p1, p2}, Landroid/net/http/EventHandler;->error(ILjava/lang/String;)V

    .line 517
    return-void
.end method

.method getEventHandler()Landroid/net/http/EventHandler;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Landroid/net/http/Request;->mEventHandler:Landroid/net/http/EventHandler;

    return-object v0
.end method

.method getHostPort()Ljava/lang/String;
    .locals 3

    .prologue
    .line 379
    iget-object v2, p0, Landroid/net/http/Request;->mHost:Lorg/apache/http/HttpHost;

    invoke-virtual {v2}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v1

    .line 380
    .local v1, "myScheme":Ljava/lang/String;
    iget-object v2, p0, Landroid/net/http/Request;->mHost:Lorg/apache/http/HttpHost;

    invoke-virtual {v2}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v0

    .line 383
    .local v0, "myPort":I
    const/16 v2, 0x50

    if-eq v0, v2, :cond_0

    const-string/jumbo v2, "http"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 384
    :cond_0
    const/16 v2, 0x1bb

    if-eq v0, v2, :cond_2

    const-string/jumbo v2, "https"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 383
    if-eqz v2, :cond_2

    .line 385
    :cond_1
    iget-object v2, p0, Landroid/net/http/Request;->mHost:Lorg/apache/http/HttpHost;

    invoke-virtual {v2}, Lorg/apache/http/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 387
    :cond_2
    iget-object v2, p0, Landroid/net/http/Request;->mHost:Lorg/apache/http/HttpHost;

    invoke-virtual {v2}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method getUri()Ljava/lang/String;
    .locals 2

    .prologue
    .line 392
    iget-object v0, p0, Landroid/net/http/Request;->mProxyHost:Lorg/apache/http/HttpHost;

    if-eqz v0, :cond_0

    .line 393
    iget-object v0, p0, Landroid/net/http/Request;->mHost:Lorg/apache/http/HttpHost;

    invoke-virtual {v0}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "https"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 392
    if-eqz v0, :cond_1

    .line 394
    :cond_0
    iget-object v0, p0, Landroid/net/http/Request;->mPath:Ljava/lang/String;

    return-object v0

    .line 396
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroid/net/http/Request;->mHost:Lorg/apache/http/HttpHost;

    invoke-virtual {v1}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/net/http/Request;->getHostPort()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/net/http/Request;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public handleSslErrorResponse(Z)V
    .locals 1
    .param p1, "proceed"    # Z

    .prologue
    .line 507
    iget-object v0, p0, Landroid/net/http/Request;->mConnection:Landroid/net/http/Connection;

    check-cast v0, Landroid/net/http/HttpsConnection;

    .line 508
    .local v0, "connection":Landroid/net/http/HttpsConnection;
    if-eqz v0, :cond_0

    .line 509
    invoke-virtual {v0, p1}, Landroid/net/http/HttpsConnection;->restartConnection(Z)V

    .line 506
    :cond_0
    return-void
.end method

.method readResponse(Landroid/net/http/AndroidHttpClientConnection;)V
    .locals 27
    .param p1, "httpClientConnection"    # Landroid/net/http/AndroidHttpClientConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/ParseException;
        }
    .end annotation

    .prologue
    .line 240
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/net/http/Request;->mCancelled:Z

    move/from16 v23, v0

    if-eqz v23, :cond_0

    return-void

    .line 242
    :cond_0
    const/16 v20, 0x0

    .line 243
    .local v20, "statusLine":Lorg/apache/http/StatusLine;
    const/4 v12, 0x0

    .line 244
    .local v12, "hasBody":Z
    invoke-virtual/range {p1 .. p1}, Landroid/net/http/AndroidHttpClientConnection;->flush()V

    .line 245
    const/16 v19, 0x0

    .line 247
    .local v19, "statusCode":I
    new-instance v13, Landroid/net/http/Headers;

    invoke-direct {v13}, Landroid/net/http/Headers;-><init>()V

    .line 249
    .end local v20    # "statusLine":Lorg/apache/http/StatusLine;
    .local v13, "header":Landroid/net/http/Headers;
    :cond_1
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/net/http/AndroidHttpClientConnection;->parseResponseHeader(Landroid/net/http/Headers;)Lorg/apache/http/StatusLine;

    move-result-object v20

    .line 250
    .local v20, "statusLine":Lorg/apache/http/StatusLine;
    invoke-interface/range {v20 .. v20}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v19

    .line 251
    const/16 v23, 0xc8

    move/from16 v0, v19

    move/from16 v1, v23

    if-lt v0, v1, :cond_1

    .line 256
    invoke-interface/range {v20 .. v20}, Lorg/apache/http/StatusLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v22

    .line 257
    .local v22, "v":Lorg/apache/http/ProtocolVersion;
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Request;->mEventHandler:Landroid/net/http/EventHandler;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/ProtocolVersion;->getMajor()I

    move-result v24

    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/ProtocolVersion;->getMinor()I

    move-result v25

    .line 258
    invoke-interface/range {v20 .. v20}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v26

    .line 257
    move-object/from16 v0, v23

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v19

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/net/http/EventHandler;->status(IIILjava/lang/String;)V

    .line 259
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Request;->mEventHandler:Landroid/net/http/EventHandler;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-interface {v0, v13}, Landroid/net/http/EventHandler;->headers(Landroid/net/http/Headers;)V

    .line 260
    const/4 v11, 0x0

    .line 261
    .local v11, "entity":Lorg/apache/http/HttpEntity;
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Request;->mHttpRequest:Lorg/apache/http/message/BasicHttpRequest;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move/from16 v1, v19

    invoke-static {v0, v1}, Landroid/net/http/Request;->canResponseHaveBody(Lorg/apache/http/HttpRequest;I)Z

    move-result v12

    .line 263
    .local v12, "hasBody":Z
    if-eqz v12, :cond_2

    .line 264
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/net/http/AndroidHttpClientConnection;->receiveResponseEntity(Landroid/net/http/Headers;)Lorg/apache/http/HttpEntity;

    move-result-object v11

    .line 268
    .end local v11    # "entity":Lorg/apache/http/HttpEntity;
    :cond_2
    const-string/jumbo v23, "bytes"

    invoke-virtual {v13}, Landroid/net/http/Headers;->getAcceptRanges()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v21

    .line 271
    .local v21, "supportPartialContent":Z
    if-eqz v11, :cond_5

    .line 272
    invoke-interface {v11}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v14

    .line 275
    .local v14, "is":Ljava/io/InputStream;
    invoke-interface {v11}, Lorg/apache/http/HttpEntity;->getContentEncoding()Lorg/apache/http/Header;

    move-result-object v6

    .line 276
    .local v6, "contentEncoding":Lorg/apache/http/Header;
    const/16 v17, 0x0

    .line 277
    .local v17, "nis":Ljava/io/InputStream;
    const/4 v5, 0x0

    .line 278
    .local v5, "buf":[B
    const/4 v7, 0x0

    .line 280
    .local v7, "count":I
    if-eqz v6, :cond_6

    .line 281
    :try_start_0
    invoke-interface {v6}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v23

    const-string/jumbo v24, "gzip"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    .line 280
    if-eqz v23, :cond_6

    .line 282
    new-instance v18, Ljava/util/zip/GZIPInputStream;

    move-object/from16 v0, v18

    invoke-direct {v0, v14}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .local v18, "nis":Ljava/io/InputStream;
    move-object/from16 v17, v18

    .line 289
    .end local v18    # "nis":Ljava/io/InputStream;
    .local v17, "nis":Ljava/io/InputStream;
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Request;->mConnection:Landroid/net/http/Connection;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/net/http/Connection;->getBuf()[B

    move-result-object v5

    .line 290
    .local v5, "buf":[B
    const/4 v15, 0x0

    .line 291
    .local v15, "len":I
    array-length v0, v5

    move/from16 v23, v0

    div-int/lit8 v16, v23, 0x2

    .line 292
    .local v16, "lowWater":I
    :cond_3
    :goto_1
    const/16 v23, -0x1

    move/from16 v0, v23

    if-eq v15, v0, :cond_a

    .line 293
    monitor-enter p0
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 294
    :goto_2
    :try_start_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/net/http/Request;->mLoadingPaused:Z

    move/from16 v23, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v23, :cond_7

    .line 300
    :try_start_2
    invoke-virtual/range {p0 .. p0}, Landroid/net/http/Request;->wait()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 301
    :catch_0
    move-exception v10

    .line 302
    .local v10, "e":Ljava/lang/InterruptedException;
    :try_start_3
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v24, "Interrupted exception whilst network thread paused at WebCore\'s request. "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    .line 304
    invoke-virtual {v10}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v24

    .line 302
    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Landroid/net/http/HttpLog;->e(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    .line 293
    .end local v10    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v23

    :try_start_4
    monitor-exit p0

    throw v23
    :try_end_4
    .catch Ljava/io/EOFException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 321
    .end local v5    # "buf":[B
    .end local v15    # "len":I
    .end local v16    # "lowWater":I
    .end local v17    # "nis":Ljava/io/InputStream;
    :catch_1
    move-exception v8

    .line 325
    .local v8, "e":Ljava/io/EOFException;
    if-lez v7, :cond_4

    .line 327
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Request;->mEventHandler:Landroid/net/http/EventHandler;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-interface {v0, v5, v7}, Landroid/net/http/EventHandler;->data([BI)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 342
    :cond_4
    if-eqz v17, :cond_5

    .line 343
    invoke-virtual/range {v17 .. v17}, Ljava/io/InputStream;->close()V

    .line 347
    .end local v6    # "contentEncoding":Lorg/apache/http/Header;
    .end local v7    # "count":I
    .end local v8    # "e":Ljava/io/EOFException;
    .end local v14    # "is":Ljava/io/InputStream;
    :cond_5
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Request;->mConnection:Landroid/net/http/Connection;

    move-object/from16 v23, v0

    invoke-interface/range {v20 .. v20}, Lorg/apache/http/StatusLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v24

    .line 348
    invoke-virtual {v13}, Landroid/net/http/Headers;->getConnectionType()I

    move-result v25

    .line 347
    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v11, v1, v2}, Landroid/net/http/Connection;->setCanPersist(Lorg/apache/http/HttpEntity;Lorg/apache/http/ProtocolVersion;I)V

    .line 349
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Request;->mEventHandler:Landroid/net/http/EventHandler;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Landroid/net/http/EventHandler;->endData()V

    .line 350
    invoke-virtual/range {p0 .. p0}, Landroid/net/http/Request;->complete()V

    .line 238
    return-void

    .line 284
    .local v5, "buf":[B
    .restart local v6    # "contentEncoding":Lorg/apache/http/Header;
    .restart local v7    # "count":I
    .restart local v14    # "is":Ljava/io/InputStream;
    .local v17, "nis":Ljava/io/InputStream;
    :cond_6
    move-object/from16 v17, v14

    .local v17, "nis":Ljava/io/InputStream;
    goto :goto_0

    .local v5, "buf":[B
    .restart local v15    # "len":I
    .restart local v16    # "lowWater":I
    :cond_7
    :try_start_6
    monitor-exit p0

    .line 309
    array-length v0, v5

    move/from16 v23, v0

    sub-int v23, v23, v7

    move-object/from16 v0, v17

    move/from16 v1, v23

    invoke-virtual {v0, v5, v7, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v15

    .line 311
    const/16 v23, -0x1

    move/from16 v0, v23

    if-eq v15, v0, :cond_8

    .line 312
    add-int/2addr v7, v15

    .line 313
    if-eqz v21, :cond_8

    move-object/from16 v0, p0

    iget v0, v0, Landroid/net/http/Request;->mReceivedBytes:I

    move/from16 v23, v0

    add-int v23, v23, v15

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Landroid/net/http/Request;->mReceivedBytes:I

    .line 315
    :cond_8
    const/16 v23, -0x1

    move/from16 v0, v23

    if-eq v15, v0, :cond_9

    move/from16 v0, v16

    if-lt v7, v0, :cond_3

    .line 317
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Request;->mEventHandler:Landroid/net/http/EventHandler;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-interface {v0, v5, v7}, Landroid/net/http/EventHandler;->data([BI)V
    :try_end_6
    .catch Ljava/io/EOFException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 318
    const/4 v7, 0x0

    goto/16 :goto_1

    .line 342
    :cond_a
    if-eqz v17, :cond_5

    .line 343
    invoke-virtual/range {v17 .. v17}, Ljava/io/InputStream;->close()V

    goto :goto_3

    .line 330
    .end local v5    # "buf":[B
    .end local v15    # "len":I
    .end local v16    # "lowWater":I
    .end local v17    # "nis":Ljava/io/InputStream;
    :catch_2
    move-exception v9

    .line 332
    .local v9, "e":Ljava/io/IOException;
    const/16 v23, 0xc8

    move/from16 v0, v19

    move/from16 v1, v23

    if-eq v0, v1, :cond_b

    .line 333
    const/16 v23, 0xce

    move/from16 v0, v19

    move/from16 v1, v23

    if-ne v0, v1, :cond_e

    .line 334
    :cond_b
    if-eqz v21, :cond_c

    if-lez v7, :cond_c

    .line 337
    :try_start_7
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Request;->mEventHandler:Landroid/net/http/EventHandler;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-interface {v0, v5, v7}, Landroid/net/http/EventHandler;->data([BI)V

    .line 339
    :cond_c
    throw v9
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 341
    .end local v9    # "e":Ljava/io/IOException;
    :catchall_1
    move-exception v23

    .line 342
    if-eqz v17, :cond_d

    .line 343
    invoke-virtual/range {v17 .. v17}, Ljava/io/InputStream;->close()V

    .line 341
    :cond_d
    throw v23

    .line 342
    .restart local v9    # "e":Ljava/io/IOException;
    :cond_e
    if-eqz v17, :cond_5

    .line 343
    invoke-virtual/range {v17 .. v17}, Ljava/io/InputStream;->close()V

    goto/16 :goto_3
.end method

.method reset()V
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 413
    iget-object v1, p0, Landroid/net/http/Request;->mHttpRequest:Lorg/apache/http/message/BasicHttpRequest;

    const-string/jumbo v2, "content-length"

    invoke-virtual {v1, v2}, Lorg/apache/http/message/BasicHttpRequest;->removeHeaders(Ljava/lang/String;)V

    .line 415
    iget-object v1, p0, Landroid/net/http/Request;->mBodyProvider:Ljava/io/InputStream;

    if-eqz v1, :cond_0

    .line 417
    :try_start_0
    iget-object v1, p0, Landroid/net/http/Request;->mBodyProvider:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->reset()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 423
    :goto_0
    iget-object v1, p0, Landroid/net/http/Request;->mBodyProvider:Ljava/io/InputStream;

    iget v2, p0, Landroid/net/http/Request;->mBodyLength:I

    invoke-direct {p0, v1, v2}, Landroid/net/http/Request;->setBodyProvider(Ljava/io/InputStream;I)V

    .line 426
    :cond_0
    iget v1, p0, Landroid/net/http/Request;->mReceivedBytes:I

    if-lez v1, :cond_1

    .line 428
    iput v3, p0, Landroid/net/http/Request;->mFailCount:I

    .line 431
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "*** Request.reset() to range:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/net/http/Request;->mReceivedBytes:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/http/HttpLog;->v(Ljava/lang/String;)V

    .line 432
    iget-object v1, p0, Landroid/net/http/Request;->mHttpRequest:Lorg/apache/http/message/BasicHttpRequest;

    const-string/jumbo v2, "Range"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "bytes="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Landroid/net/http/Request;->mReceivedBytes:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/apache/http/message/BasicHttpRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 411
    :cond_1
    return-void

    .line 418
    :catch_0
    move-exception v0

    .local v0, "ex":Ljava/io/IOException;
    goto :goto_0
.end method

.method sendRequest(Landroid/net/http/AndroidHttpClientConnection;)V
    .locals 3
    .param p1, "httpClientConnection"    # Landroid/net/http/AndroidHttpClientConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 204
    iget-boolean v0, p0, Landroid/net/http/Request;->mCancelled:Z

    if-eqz v0, :cond_0

    return-void

    .line 218
    :cond_0
    sget-object v0, Landroid/net/http/Request;->requestContentProcessor:Lorg/apache/http/protocol/RequestContent;

    iget-object v1, p0, Landroid/net/http/Request;->mHttpRequest:Lorg/apache/http/message/BasicHttpRequest;

    .line 219
    iget-object v2, p0, Landroid/net/http/Request;->mConnection:Landroid/net/http/Connection;

    invoke-virtual {v2}, Landroid/net/http/Connection;->getHttpContext()Lorg/apache/http/protocol/HttpContext;

    move-result-object v2

    .line 218
    invoke-virtual {v0, v1, v2}, Lorg/apache/http/protocol/RequestContent;->process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V

    .line 220
    iget-object v0, p0, Landroid/net/http/Request;->mHttpRequest:Lorg/apache/http/message/BasicHttpRequest;

    invoke-virtual {p1, v0}, Landroid/net/http/AndroidHttpClientConnection;->sendRequestHeader(Lorg/apache/http/HttpRequest;)V

    .line 221
    iget-object v0, p0, Landroid/net/http/Request;->mHttpRequest:Lorg/apache/http/message/BasicHttpRequest;

    instance-of v0, v0, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v0, :cond_1

    .line 223
    iget-object v0, p0, Landroid/net/http/Request;->mHttpRequest:Lorg/apache/http/message/BasicHttpRequest;

    check-cast v0, Lorg/apache/http/HttpEntityEnclosingRequest;

    .line 222
    invoke-virtual {p1, v0}, Landroid/net/http/AndroidHttpClientConnection;->sendRequestEntity(Lorg/apache/http/HttpEntityEnclosingRequest;)V

    .line 202
    :cond_1
    return-void
.end method

.method setConnection(Landroid/net/http/Connection;)V
    .locals 0
    .param p1, "connection"    # Landroid/net/http/Connection;

    .prologue
    .line 154
    iput-object p1, p0, Landroid/net/http/Request;->mConnection:Landroid/net/http/Connection;

    .line 153
    return-void
.end method

.method declared-synchronized setLoadingPaused(Z)V
    .locals 1
    .param p1, "pause"    # Z

    .prologue
    monitor-enter p0

    .line 142
    :try_start_0
    iput-boolean p1, p0, Landroid/net/http/Request;->mLoadingPaused:Z

    .line 145
    iget-boolean v0, p0, Landroid/net/http/Request;->mLoadingPaused:Z

    if-nez v0, :cond_0

    .line 146
    invoke-virtual {p0}, Landroid/net/http/Request;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    .line 141
    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 403
    iget-object v0, p0, Landroid/net/http/Request;->mPath:Ljava/lang/String;

    return-object v0
.end method

.method waitUntilComplete()V
    .locals 3

    .prologue
    .line 441
    iget-object v2, p0, Landroid/net/http/Request;->mClientResource:Ljava/lang/Object;

    monitor-enter v2

    .line 444
    :try_start_0
    iget-object v1, p0, Landroid/net/http/Request;->mClientResource:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v2

    .line 440
    return-void

    .line 441
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1

    .line 446
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/InterruptedException;
    goto :goto_0
.end method
