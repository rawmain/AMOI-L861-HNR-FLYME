.class abstract Landroid/net/http/Connection;
.super Ljava/lang/Object;
.source "Connection.java"


# static fields
.field private static final DONE:I = 0x3

.field private static final DRAIN:I = 0x2

.field private static final HTTP_CONNECTION:Ljava/lang/String; = "http.connection"

.field private static final MAX_PIPE:I = 0x3

.field private static final MIN_PIPE:I = 0x2

.field private static final READ:I = 0x1

.field private static final RETRY_REQUEST_LIMIT:I = 0x2

.field private static final SEND:I = 0x0

.field static final SOCKET_TIMEOUT:I = 0xea60

.field private static STATE_CANCEL_REQUESTED:I

.field private static STATE_NORMAL:I

.field private static final states:[Ljava/lang/String;


# instance fields
.field private mActive:I

.field private mBuf:[B

.field private mCanPersist:Z

.field protected mCertificate:Landroid/net/http/SslCertificate;

.field mContext:Landroid/content/Context;

.field mHost:Lorg/apache/http/HttpHost;

.field protected mHttpClientConnection:Landroid/net/http/AndroidHttpClientConnection;

.field private mHttpContext:Lorg/apache/http/protocol/HttpContext;

.field mRequestFeeder:Landroid/net/http/RequestFeeder;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 50
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "SEND"

    aput-object v1, v0, v3

    const-string/jumbo v1, "READ"

    aput-object v1, v0, v4

    const-string/jumbo v1, "DRAIN"

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string/jumbo v1, "DONE"

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sput-object v0, Landroid/net/http/Connection;->states:[Ljava/lang/String;

    .line 78
    sput v3, Landroid/net/http/Connection;->STATE_NORMAL:I

    .line 79
    sput v4, Landroid/net/http/Connection;->STATE_CANCEL_REQUESTED:I

    .line 39
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Lorg/apache/http/HttpHost;Landroid/net/http/RequestFeeder;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "host"    # Lorg/apache/http/HttpHost;
    .param p3, "requestFeeder"    # Landroid/net/http/RequestFeeder;

    .prologue
    const/4 v1, 0x0

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object v1, p0, Landroid/net/http/Connection;->mHttpClientConnection:Landroid/net/http/AndroidHttpClientConnection;

    .line 63
    iput-object v1, p0, Landroid/net/http/Connection;->mCertificate:Landroid/net/http/SslCertificate;

    .line 80
    sget v0, Landroid/net/http/Connection;->STATE_NORMAL:I

    iput v0, p0, Landroid/net/http/Connection;->mActive:I

    .line 103
    iput-object p1, p0, Landroid/net/http/Connection;->mContext:Landroid/content/Context;

    .line 104
    iput-object p2, p0, Landroid/net/http/Connection;->mHost:Lorg/apache/http/HttpHost;

    .line 105
    iput-object p3, p0, Landroid/net/http/Connection;->mRequestFeeder:Landroid/net/http/RequestFeeder;

    .line 107
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/net/http/Connection;->mCanPersist:Z

    .line 108
    new-instance v0, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v0, v1}, Lorg/apache/http/protocol/BasicHttpContext;-><init>(Lorg/apache/http/protocol/HttpContext;)V

    iput-object v0, p0, Landroid/net/http/Connection;->mHttpContext:Lorg/apache/http/protocol/HttpContext;

    .line 102
    return-void
.end method

.method private clearPipe(Ljava/util/LinkedList;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedList",
            "<",
            "Landroid/net/http/Request;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 325
    .local p1, "pipe":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Landroid/net/http/Request;>;"
    const/4 v0, 0x1

    .line 328
    .local v0, "empty":Z
    iget-object v3, p0, Landroid/net/http/Connection;->mRequestFeeder:Landroid/net/http/RequestFeeder;

    monitor-enter v3

    .line 330
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 331
    invoke-virtual {p1}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/http/Request;

    .line 334
    .local v1, "tReq":Landroid/net/http/Request;
    iget-object v2, p0, Landroid/net/http/Connection;->mRequestFeeder:Landroid/net/http/RequestFeeder;

    invoke-interface {v2, v1}, Landroid/net/http/RequestFeeder;->requeueRequest(Landroid/net/http/Request;)V

    .line 335
    const/4 v0, 0x0

    goto :goto_0

    .line 337
    .end local v1    # "tReq":Landroid/net/http/Request;
    :cond_0
    if-eqz v0, :cond_1

    iget-object v2, p0, Landroid/net/http/Connection;->mRequestFeeder:Landroid/net/http/RequestFeeder;

    iget-object v4, p0, Landroid/net/http/Connection;->mHost:Lorg/apache/http/HttpHost;

    invoke-interface {v2, v4}, Landroid/net/http/RequestFeeder;->haveRequest(Lorg/apache/http/HttpHost;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-eqz v2, :cond_2

    const/4 v0, 0x0

    :cond_1
    :goto_1
    monitor-exit v3

    .line 339
    return v0

    .line 337
    :cond_2
    const/4 v0, 0x1

    goto :goto_1

    .line 328
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2
.end method

.method static getConnection(Landroid/content/Context;Lorg/apache/http/HttpHost;Lorg/apache/http/HttpHost;Landroid/net/http/RequestFeeder;)Landroid/net/http/Connection;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "proxy"    # Lorg/apache/http/HttpHost;
    .param p3, "requestFeeder"    # Landroid/net/http/RequestFeeder;

    .prologue
    .line 123
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "http"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 124
    new-instance v0, Landroid/net/http/HttpConnection;

    invoke-direct {v0, p0, p1, p3}, Landroid/net/http/HttpConnection;-><init>(Landroid/content/Context;Lorg/apache/http/HttpHost;Landroid/net/http/RequestFeeder;)V

    return-object v0

    .line 128
    :cond_0
    new-instance v0, Landroid/net/http/HttpsConnection;

    invoke-direct {v0, p0, p1, p2, p3}, Landroid/net/http/HttpsConnection;-><init>(Landroid/content/Context;Lorg/apache/http/HttpHost;Lorg/apache/http/HttpHost;Landroid/net/http/RequestFeeder;)V

    return-object v0
.end method

.method private static getEventHandlerErrorString(I)Ljava/lang/String;
    .locals 1
    .param p0, "errorId"    # I

    .prologue
    .line 452
    packed-switch p0, :pswitch_data_0

    .line 502
    const-string/jumbo v0, "UNKNOWN_ERROR"

    return-object v0

    .line 454
    :pswitch_0
    const-string/jumbo v0, "OK"

    return-object v0

    .line 457
    :pswitch_1
    const-string/jumbo v0, "ERROR"

    return-object v0

    .line 460
    :pswitch_2
    const-string/jumbo v0, "ERROR_LOOKUP"

    return-object v0

    .line 463
    :pswitch_3
    const-string/jumbo v0, "ERROR_UNSUPPORTED_AUTH_SCHEME"

    return-object v0

    .line 466
    :pswitch_4
    const-string/jumbo v0, "ERROR_AUTH"

    return-object v0

    .line 469
    :pswitch_5
    const-string/jumbo v0, "ERROR_PROXYAUTH"

    return-object v0

    .line 472
    :pswitch_6
    const-string/jumbo v0, "ERROR_CONNECT"

    return-object v0

    .line 475
    :pswitch_7
    const-string/jumbo v0, "ERROR_IO"

    return-object v0

    .line 478
    :pswitch_8
    const-string/jumbo v0, "ERROR_TIMEOUT"

    return-object v0

    .line 481
    :pswitch_9
    const-string/jumbo v0, "ERROR_REDIRECT_LOOP"

    return-object v0

    .line 484
    :pswitch_a
    const-string/jumbo v0, "ERROR_UNSUPPORTED_SCHEME"

    return-object v0

    .line 487
    :pswitch_b
    const-string/jumbo v0, "ERROR_FAILED_SSL_HANDSHAKE"

    return-object v0

    .line 490
    :pswitch_c
    const-string/jumbo v0, "ERROR_BAD_URL"

    return-object v0

    .line 493
    :pswitch_d
    const-string/jumbo v0, "FILE_ERROR"

    return-object v0

    .line 496
    :pswitch_e
    const-string/jumbo v0, "FILE_NOT_FOUND_ERROR"

    return-object v0

    .line 499
    :pswitch_f
    const-string/jumbo v0, "TOO_MANY_REQUESTS_ERROR"

    return-object v0

    .line 452
    nop

    :pswitch_data_0
    .packed-switch -0xf
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private httpFailure(Landroid/net/http/Request;ILjava/lang/Exception;)Z
    .locals 5
    .param p1, "req"    # Landroid/net/http/Request;
    .param p2, "errorId"    # I
    .param p3, "e"    # Ljava/lang/Exception;

    .prologue
    .line 425
    const/4 v2, 0x1

    .line 432
    .local v2, "ret":Z
    iget v3, p1, Landroid/net/http/Request;->mFailCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p1, Landroid/net/http/Request;->mFailCount:I

    const/4 v4, 0x2

    if-lt v3, v4, :cond_0

    .line 433
    const/4 v2, 0x0

    .line 435
    if-gez p2, :cond_1

    .line 436
    invoke-static {p2}, Landroid/net/http/Connection;->getEventHandlerErrorString(I)Ljava/lang/String;

    move-result-object v1

    .line 441
    .local v1, "error":Ljava/lang/String;
    :goto_0
    iget-object v3, p1, Landroid/net/http/Request;->mEventHandler:Landroid/net/http/EventHandler;

    invoke-interface {v3, p2, v1}, Landroid/net/http/EventHandler;->error(ILjava/lang/String;)V

    .line 442
    invoke-virtual {p1}, Landroid/net/http/Request;->complete()V

    .line 445
    .end local v1    # "error":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Landroid/net/http/Connection;->closeConnection()V

    .line 446
    iget-object v3, p0, Landroid/net/http/Connection;->mHttpContext:Lorg/apache/http/protocol/HttpContext;

    const-string/jumbo v4, "http.connection"

    invoke-interface {v3, v4}, Lorg/apache/http/protocol/HttpContext;->removeAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 448
    return v2

    .line 438
    :cond_1
    invoke-virtual {p3}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 439
    .local v0, "cause":Ljava/lang/Throwable;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "error":Ljava/lang/String;
    goto :goto_0

    .end local v1    # "error":Ljava/lang/String;
    :cond_2
    invoke-virtual {p3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "error":Ljava/lang/String;
    goto :goto_0
.end method

.method private keepAlive(Lorg/apache/http/HttpEntity;Lorg/apache/http/ProtocolVersion;ILorg/apache/http/protocol/HttpContext;)Z
    .locals 8
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;
    .param p2, "ver"    # Lorg/apache/http/ProtocolVersion;
    .param p3, "connType"    # I
    .param p4, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 517
    const-string/jumbo v3, "http.connection"

    invoke-interface {p4, v3}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 516
    check-cast v0, Lorg/apache/http/HttpConnection;

    .line 519
    .local v0, "conn":Lorg/apache/http/HttpConnection;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/apache/http/HttpConnection;->isOpen()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 523
    :cond_0
    if-eqz p1, :cond_3

    .line 524
    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-gez v3, :cond_3

    .line 525
    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->isChunked()Z

    move-result v3

    if-eqz v3, :cond_1

    sget-object v3, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    invoke-virtual {p2, v3}, Lorg/apache/http/ProtocolVersion;->lessEquals(Lorg/apache/http/ProtocolVersion;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 528
    :cond_1
    return v1

    .line 520
    :cond_2
    return v1

    .line 533
    :cond_3
    if-ne p3, v2, :cond_4

    .line 534
    return v1

    .line 535
    :cond_4
    const/4 v3, 0x2

    if-ne p3, v3, :cond_5

    .line 536
    return v2

    .line 539
    :cond_5
    sget-object v3, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    invoke-virtual {p2, v3}, Lorg/apache/http/ProtocolVersion;->lessEquals(Lorg/apache/http/ProtocolVersion;)Z

    move-result v3

    if-eqz v3, :cond_6

    :goto_0
    return v1

    :cond_6
    move v1, v2

    goto :goto_0
.end method

.method private openHttpConnection(Landroid/net/http/Request;)Z
    .locals 12
    .param p1, "req"    # Landroid/net/http/Request;

    .prologue
    .line 347
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    .line 348
    .local v8, "now":J
    const/4 v5, 0x0

    .line 349
    .local v5, "error":I
    const/4 v6, 0x0

    .line 353
    .local v6, "exception":Ljava/lang/Exception;
    const/4 v7, 0x0

    :try_start_0
    iput-object v7, p0, Landroid/net/http/Connection;->mCertificate:Landroid/net/http/SslCertificate;

    .line 354
    invoke-virtual {p0, p1}, Landroid/net/http/Connection;->openConnection(Landroid/net/http/Request;)Landroid/net/http/AndroidHttpClientConnection;

    move-result-object v7

    iput-object v7, p0, Landroid/net/http/Connection;->mHttpClientConnection:Landroid/net/http/AndroidHttpClientConnection;

    .line 355
    iget-object v7, p0, Landroid/net/http/Connection;->mHttpClientConnection:Landroid/net/http/AndroidHttpClientConnection;

    if-eqz v7, :cond_0

    .line 356
    iget-object v7, p0, Landroid/net/http/Connection;->mHttpClientConnection:Landroid/net/http/AndroidHttpClientConnection;

    const v10, 0xea60

    invoke-virtual {v7, v10}, Landroid/net/http/AndroidHttpClientConnection;->setSocketTimeout(I)V

    .line 357
    iget-object v7, p0, Landroid/net/http/Connection;->mHttpContext:Lorg/apache/http/protocol/HttpContext;

    const-string/jumbo v10, "http.connection"

    .line 358
    iget-object v11, p0, Landroid/net/http/Connection;->mHttpClientConnection:Landroid/net/http/AndroidHttpClientConnection;

    .line 357
    invoke-interface {v7, v10, v11}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 400
    .end local v6    # "exception":Ljava/lang/Exception;
    :goto_0
    if-nez v5, :cond_1

    .line 401
    const/4 v7, 0x1

    return v7

    .line 363
    .restart local v6    # "exception":Ljava/lang/Exception;
    :cond_0
    const/4 v7, 0x2

    iput v7, p1, Landroid/net/http/Request;->mFailCount:I
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Landroid/net/http/SSLConnectionClosedByUserException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljavax/net/ssl/SSLHandshakeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 364
    const/4 v7, 0x0

    return v7

    .line 389
    :catch_0
    move-exception v1

    .line 390
    .local v1, "e":Ljava/io/IOException;
    const/4 v5, -0x6

    .line 391
    move-object v6, v1

    .local v6, "exception":Ljava/lang/Exception;
    goto :goto_0

    .line 381
    .end local v1    # "e":Ljava/io/IOException;
    .local v6, "exception":Ljava/lang/Exception;
    :catch_1
    move-exception v4

    .line 384
    .local v4, "e":Ljavax/net/ssl/SSLHandshakeException;
    const/4 v7, 0x2

    iput v7, p1, Landroid/net/http/Request;->mFailCount:I

    .line 387
    const/16 v5, -0xb

    .line 388
    move-object v6, v4

    .local v6, "exception":Ljava/lang/Exception;
    goto :goto_0

    .line 375
    .end local v4    # "e":Ljavax/net/ssl/SSLHandshakeException;
    .local v6, "exception":Ljava/lang/Exception;
    :catch_2
    move-exception v0

    .line 378
    .local v0, "e":Landroid/net/http/SSLConnectionClosedByUserException;
    const/4 v7, 0x2

    iput v7, p1, Landroid/net/http/Request;->mFailCount:I

    .line 380
    const/4 v7, 0x0

    return v7

    .line 370
    .end local v0    # "e":Landroid/net/http/SSLConnectionClosedByUserException;
    :catch_3
    move-exception v2

    .line 372
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    const/4 v5, -0x6

    .line 373
    const/4 v7, 0x2

    iput v7, p1, Landroid/net/http/Request;->mFailCount:I

    .line 374
    move-object v6, v2

    .local v6, "exception":Ljava/lang/Exception;
    goto :goto_0

    .line 366
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    .local v6, "exception":Ljava/lang/Exception;
    :catch_4
    move-exception v3

    .line 368
    .local v3, "e":Ljava/net/UnknownHostException;
    const/4 v5, -0x2

    .line 369
    move-object v6, v3

    .local v6, "exception":Ljava/lang/Exception;
    goto :goto_0

    .line 403
    .end local v3    # "e":Ljava/net/UnknownHostException;
    .end local v6    # "exception":Ljava/lang/Exception;
    :cond_1
    iget v7, p1, Landroid/net/http/Request;->mFailCount:I

    const/4 v10, 0x2

    if-ge v7, v10, :cond_2

    .line 405
    iget-object v7, p0, Landroid/net/http/Connection;->mRequestFeeder:Landroid/net/http/RequestFeeder;

    invoke-interface {v7, p1}, Landroid/net/http/RequestFeeder;->requeueRequest(Landroid/net/http/Request;)V

    .line 406
    iget v7, p1, Landroid/net/http/Request;->mFailCount:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p1, Landroid/net/http/Request;->mFailCount:I

    .line 410
    :goto_1
    if-nez v5, :cond_3

    const/4 v7, 0x1

    :goto_2
    return v7

    .line 408
    :cond_2
    invoke-direct {p0, p1, v5, v6}, Landroid/net/http/Connection;->httpFailure(Landroid/net/http/Request;ILjava/lang/Exception;)Z

    goto :goto_1

    .line 410
    :cond_3
    const/4 v7, 0x0

    goto :goto_2
.end method


# virtual methods
.method cancel()V
    .locals 1

    .prologue
    .line 144
    sget v0, Landroid/net/http/Connection;->STATE_CANCEL_REQUESTED:I

    iput v0, p0, Landroid/net/http/Connection;->mActive:I

    .line 145
    invoke-virtual {p0}, Landroid/net/http/Connection;->closeConnection()V

    .line 143
    return-void
.end method

.method abstract closeConnection()V
.end method

.method getBuf()[B
    .locals 1

    .prologue
    .line 568
    iget-object v0, p0, Landroid/net/http/Connection;->mBuf:[B

    if-nez v0, :cond_0

    const/16 v0, 0x2000

    new-array v0, v0, [B

    iput-object v0, p0, Landroid/net/http/Connection;->mBuf:[B

    .line 569
    :cond_0
    iget-object v0, p0, Landroid/net/http/Connection;->mBuf:[B

    return-object v0
.end method

.method getCanPersist()Z
    .locals 1

    .prologue
    .line 551
    iget-boolean v0, p0, Landroid/net/http/Connection;->mCanPersist:Z

    return v0
.end method

.method getCertificate()Landroid/net/http/SslCertificate;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Landroid/net/http/Connection;->mCertificate:Landroid/net/http/SslCertificate;

    return-object v0
.end method

.method getHost()Lorg/apache/http/HttpHost;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Landroid/net/http/Connection;->mHost:Lorg/apache/http/HttpHost;

    return-object v0
.end method

.method getHttpContext()Lorg/apache/http/protocol/HttpContext;
    .locals 1

    .prologue
    .line 507
    iget-object v0, p0, Landroid/net/http/Connection;->mHttpContext:Lorg/apache/http/protocol/HttpContext;

    return-object v0
.end method

.method abstract getScheme()Ljava/lang/String;
.end method

.method abstract openConnection(Landroid/net/http/Request;)Landroid/net/http/AndroidHttpClientConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method processRequests(Landroid/net/http/Request;)V
    .locals 18
    .param p1, "firstRequest"    # Landroid/net/http/Request;

    .prologue
    .line 155
    const/4 v13, 0x0

    .line 157
    .local v13, "req":Landroid/net/http/Request;
    const/4 v7, 0x0

    .line 158
    .local v7, "error":I
    const/4 v8, 0x0

    .line 160
    .local v8, "exception":Ljava/lang/Exception;
    new-instance v11, Ljava/util/LinkedList;

    invoke-direct {v11}, Ljava/util/LinkedList;-><init>()V

    .line 162
    .local v11, "pipe":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Landroid/net/http/Request;>;"
    const/4 v10, 0x2

    .local v10, "minPipe":I
    const/4 v9, 0x3

    .line 163
    .local v9, "maxPipe":I
    const/4 v14, 0x0

    .line 165
    .end local v8    # "exception":Ljava/lang/Exception;
    .end local v13    # "req":Landroid/net/http/Request;
    .end local p1    # "firstRequest":Landroid/net/http/Request;
    .local v14, "state":I
    :cond_0
    :goto_0
    const/16 v16, 0x3

    move/from16 v0, v16

    if-eq v14, v0, :cond_14

    .line 172
    move-object/from16 v0, p0

    iget v0, v0, Landroid/net/http/Connection;->mActive:I

    move/from16 v16, v0

    sget v17, Landroid/net/http/Connection;->STATE_CANCEL_REQUESTED:I

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_1

    .line 174
    const-wide/16 v16, 0x64

    :try_start_0
    invoke-static/range {v16 .. v17}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    :goto_1
    sget v16, Landroid/net/http/Connection;->STATE_NORMAL:I

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Landroid/net/http/Connection;->mActive:I

    .line 179
    :cond_1
    packed-switch v14, :pswitch_data_0

    goto :goto_0

    .line 181
    :pswitch_0
    invoke-virtual {v11}, Ljava/util/LinkedList;->size()I

    move-result v16

    move/from16 v0, v16

    if-ne v0, v9, :cond_2

    .line 182
    const/4 v14, 0x1

    .line 183
    goto :goto_0

    .line 175
    :catch_0
    move-exception v15

    .local v15, "x":Ljava/lang/InterruptedException;
    goto :goto_1

    .line 186
    .end local v15    # "x":Ljava/lang/InterruptedException;
    :cond_2
    if-nez p1, :cond_3

    .line 187
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Connection;->mRequestFeeder:Landroid/net/http/RequestFeeder;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Connection;->mHost:Lorg/apache/http/HttpHost;

    move-object/from16 v17, v0

    invoke-interface/range {v16 .. v17}, Landroid/net/http/RequestFeeder;->getRequest(Lorg/apache/http/HttpHost;)Landroid/net/http/Request;

    move-result-object v13

    .line 192
    .local v13, "req":Landroid/net/http/Request;
    :goto_2
    if-nez v13, :cond_4

    .line 193
    const/4 v14, 0x2

    .line 194
    goto :goto_0

    .line 189
    .end local v13    # "req":Landroid/net/http/Request;
    :cond_3
    move-object/from16 v13, p1

    .line 190
    .restart local v13    # "req":Landroid/net/http/Request;
    const/16 p1, 0x0

    .local p1, "firstRequest":Landroid/net/http/Request;
    goto :goto_2

    .line 196
    .end local p1    # "firstRequest":Landroid/net/http/Request;
    :cond_4
    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Landroid/net/http/Request;->setConnection(Landroid/net/http/Connection;)V

    .line 199
    iget-boolean v0, v13, Landroid/net/http/Request;->mCancelled:Z

    move/from16 v16, v0

    if-eqz v16, :cond_5

    .line 203
    invoke-virtual {v13}, Landroid/net/http/Request;->complete()V

    goto :goto_0

    .line 207
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Connection;->mHttpClientConnection:Landroid/net/http/AndroidHttpClientConnection;

    move-object/from16 v16, v0

    if-eqz v16, :cond_8

    .line 208
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Connection;->mHttpClientConnection:Landroid/net/http/AndroidHttpClientConnection;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/net/http/AndroidHttpClientConnection;->isOpen()Z

    move-result v16

    if-eqz v16, :cond_8

    .line 225
    :cond_6
    iget-object v0, v13, Landroid/net/http/Request;->mEventHandler:Landroid/net/http/EventHandler;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Connection;->mCertificate:Landroid/net/http/SslCertificate;

    move-object/from16 v17, v0

    invoke-interface/range {v16 .. v17}, Landroid/net/http/EventHandler;->certificate(Landroid/net/http/SslCertificate;)V

    .line 231
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Connection;->mHttpClientConnection:Landroid/net/http/AndroidHttpClientConnection;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/net/http/Request;->sendRequest(Landroid/net/http/AndroidHttpClientConnection;)V
    :try_end_1
    .catch Lorg/apache/http/HttpException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1

    .line 242
    :goto_3
    if-eqz v8, :cond_b

    .line 243
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v7, v8}, Landroid/net/http/Connection;->httpFailure(Landroid/net/http/Request;ILjava/lang/Exception;)Z

    move-result v16

    if-eqz v16, :cond_7

    .line 244
    iget-boolean v0, v13, Landroid/net/http/Request;->mCancelled:Z

    move/from16 v16, v0

    if-eqz v16, :cond_9

    .line 249
    :cond_7
    :goto_4
    const/4 v8, 0x0

    .line 250
    .restart local v8    # "exception":Ljava/lang/Exception;
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Landroid/net/http/Connection;->clearPipe(Ljava/util/LinkedList;)Z

    move-result v16

    if-eqz v16, :cond_a

    const/4 v14, 0x3

    .line 251
    :goto_5
    const/4 v9, 0x1

    const/4 v10, 0x1

    .line 252
    goto/16 :goto_0

    .line 215
    .end local v8    # "exception":Ljava/lang/Exception;
    :cond_8
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Landroid/net/http/Connection;->openHttpConnection(Landroid/net/http/Request;)Z

    move-result v16

    if-nez v16, :cond_6

    .line 216
    const/4 v14, 0x3

    .line 217
    goto/16 :goto_0

    .line 238
    :catch_1
    move-exception v3

    .line 239
    .local v3, "e":Ljava/lang/IllegalStateException;
    move-object v8, v3

    .line 240
    .local v8, "exception":Ljava/lang/Exception;
    const/4 v7, -0x7

    goto :goto_3

    .line 235
    .end local v3    # "e":Ljava/lang/IllegalStateException;
    .end local v8    # "exception":Ljava/lang/Exception;
    :catch_2
    move-exception v2

    .line 236
    .local v2, "e":Ljava/io/IOException;
    move-object v8, v2

    .line 237
    .restart local v8    # "exception":Ljava/lang/Exception;
    const/4 v7, -0x7

    goto :goto_3

    .line 232
    .end local v2    # "e":Ljava/io/IOException;
    .end local v8    # "exception":Ljava/lang/Exception;
    :catch_3
    move-exception v4

    .line 233
    .local v4, "e":Lorg/apache/http/HttpException;
    move-object v8, v4

    .line 234
    .restart local v8    # "exception":Ljava/lang/Exception;
    const/4 v7, -0x1

    goto :goto_3

    .line 247
    .end local v4    # "e":Lorg/apache/http/HttpException;
    .end local v8    # "exception":Ljava/lang/Exception;
    :cond_9
    invoke-virtual {v11, v13}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    goto :goto_4

    .line 250
    .local v8, "exception":Ljava/lang/Exception;
    :cond_a
    const/4 v14, 0x0

    goto :goto_5

    .line 255
    .end local v8    # "exception":Ljava/lang/Exception;
    :cond_b
    invoke-virtual {v11, v13}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 256
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/net/http/Connection;->mCanPersist:Z

    move/from16 v16, v0

    if-nez v16, :cond_0

    const/4 v14, 0x1

    goto/16 :goto_0

    .line 262
    .end local v13    # "req":Landroid/net/http/Request;
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Connection;->mRequestFeeder:Landroid/net/http/RequestFeeder;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Connection;->mHost:Lorg/apache/http/HttpHost;

    move-object/from16 v17, v0

    invoke-interface/range {v16 .. v17}, Landroid/net/http/RequestFeeder;->haveRequest(Lorg/apache/http/HttpHost;)Z

    move-result v16

    if-eqz v16, :cond_d

    const/4 v6, 0x0

    .line 263
    .local v6, "empty":Z
    :goto_6
    invoke-virtual {v11}, Ljava/util/LinkedList;->size()I

    move-result v12

    .line 264
    .local v12, "pipeSize":I
    const/16 v16, 0x2

    move/from16 v0, v16

    if-eq v14, v0, :cond_c

    if-ge v12, v10, :cond_c

    .line 265
    if-eqz v6, :cond_e

    .line 268
    :cond_c
    if-nez v12, :cond_10

    .line 270
    if-eqz v6, :cond_f

    const/4 v14, 0x3

    goto/16 :goto_0

    .line 262
    .end local v6    # "empty":Z
    .end local v12    # "pipeSize":I
    :cond_d
    const/4 v6, 0x1

    .restart local v6    # "empty":Z
    goto :goto_6

    .line 265
    .restart local v12    # "pipeSize":I
    :cond_e
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/net/http/Connection;->mCanPersist:Z

    move/from16 v16, v0

    .line 264
    if-eqz v16, :cond_c

    .line 266
    const/4 v14, 0x0

    .line 267
    goto/16 :goto_0

    .line 270
    :cond_f
    const/4 v14, 0x0

    goto/16 :goto_0

    .line 274
    :cond_10
    invoke-virtual {v11}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/net/http/Request;

    .line 279
    .restart local v13    # "req":Landroid/net/http/Request;
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Connection;->mHttpClientConnection:Landroid/net/http/AndroidHttpClientConnection;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/net/http/Request;->readResponse(Landroid/net/http/AndroidHttpClientConnection;)V
    :try_end_2
    .catch Lorg/apache/http/ParseException; {:try_start_2 .. :try_end_2} :catch_6
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_4

    .line 290
    :goto_7
    if-eqz v8, :cond_12

    .line 291
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v7, v8}, Landroid/net/http/Connection;->httpFailure(Landroid/net/http/Request;ILjava/lang/Exception;)Z

    move-result v16

    if-eqz v16, :cond_11

    .line 292
    iget-boolean v0, v13, Landroid/net/http/Request;->mCancelled:Z

    move/from16 v16, v0

    if-eqz v16, :cond_13

    .line 298
    :cond_11
    :goto_8
    const/4 v8, 0x0

    .line 299
    .restart local v8    # "exception":Ljava/lang/Exception;
    const/16 v16, 0x0

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/net/http/Connection;->mCanPersist:Z

    .line 301
    .end local v8    # "exception":Ljava/lang/Exception;
    :cond_12
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/net/http/Connection;->mCanPersist:Z

    move/from16 v16, v0

    if-nez v16, :cond_0

    .line 306
    invoke-virtual/range {p0 .. p0}, Landroid/net/http/Connection;->closeConnection()V

    .line 308
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/Connection;->mHttpContext:Lorg/apache/http/protocol/HttpContext;

    move-object/from16 v16, v0

    const-string/jumbo v17, "http.connection"

    invoke-interface/range {v16 .. v17}, Lorg/apache/http/protocol/HttpContext;->removeAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 309
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Landroid/net/http/Connection;->clearPipe(Ljava/util/LinkedList;)Z

    .line 310
    const/4 v9, 0x1

    const/4 v10, 0x1

    .line 311
    const/4 v14, 0x0

    goto/16 :goto_0

    .line 286
    :catch_4
    move-exception v3

    .line 287
    .restart local v3    # "e":Ljava/lang/IllegalStateException;
    move-object v8, v3

    .line 288
    .local v8, "exception":Ljava/lang/Exception;
    const/4 v7, -0x7

    goto :goto_7

    .line 283
    .end local v3    # "e":Ljava/lang/IllegalStateException;
    .end local v8    # "exception":Ljava/lang/Exception;
    :catch_5
    move-exception v2

    .line 284
    .restart local v2    # "e":Ljava/io/IOException;
    move-object v8, v2

    .line 285
    .restart local v8    # "exception":Ljava/lang/Exception;
    const/4 v7, -0x7

    goto :goto_7

    .line 280
    .end local v2    # "e":Ljava/io/IOException;
    .end local v8    # "exception":Ljava/lang/Exception;
    :catch_6
    move-exception v5

    .line 281
    .local v5, "e":Lorg/apache/http/ParseException;
    move-object v8, v5

    .line 282
    .restart local v8    # "exception":Ljava/lang/Exception;
    const/4 v7, -0x7

    goto :goto_7

    .line 295
    .end local v5    # "e":Lorg/apache/http/ParseException;
    .end local v8    # "exception":Ljava/lang/Exception;
    :cond_13
    invoke-virtual {v13}, Landroid/net/http/Request;->reset()V

    .line 296
    invoke-virtual {v11, v13}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto :goto_8

    .line 154
    .end local v6    # "empty":Z
    .end local v12    # "pipeSize":I
    .end local v13    # "req":Landroid/net/http/Request;
    :cond_14
    return-void

    .line 179
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method setCanPersist(Lorg/apache/http/HttpEntity;Lorg/apache/http/ProtocolVersion;I)V
    .locals 1
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;
    .param p2, "ver"    # Lorg/apache/http/ProtocolVersion;
    .param p3, "connType"    # I

    .prologue
    .line 543
    iget-object v0, p0, Landroid/net/http/Connection;->mHttpContext:Lorg/apache/http/protocol/HttpContext;

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/net/http/Connection;->keepAlive(Lorg/apache/http/HttpEntity;Lorg/apache/http/ProtocolVersion;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v0

    iput-boolean v0, p0, Landroid/net/http/Connection;->mCanPersist:Z

    .line 542
    return-void
.end method

.method setCanPersist(Z)V
    .locals 0
    .param p1, "canPersist"    # Z

    .prologue
    .line 547
    iput-boolean p1, p0, Landroid/net/http/Connection;->mCanPersist:Z

    .line 546
    return-void
.end method

.method public declared-synchronized toString()Ljava/lang/String;
    .locals 1

    .prologue
    monitor-enter p0

    .line 564
    :try_start_0
    iget-object v0, p0, Landroid/net/http/Connection;->mHost:Lorg/apache/http/HttpHost;

    invoke-virtual {v0}, Lorg/apache/http/HttpHost;->toString()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
