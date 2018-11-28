.class public Landroid/net/http/HttpsConnection;
.super Landroid/net/http/Connection;
.source "HttpsConnection.java"


# static fields
.field private static mSslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;


# instance fields
.field private mAborted:Z

.field private mProxyHost:Lorg/apache/http/HttpHost;

.field private mSuspendLock:Ljava/lang/Object;

.field private mSuspended:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 57
    sput-object v0, Landroid/net/http/HttpsConnection;->mSslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 63
    invoke-static {v0}, Landroid/net/http/HttpsConnection;->initializeEngine(Ljava/io/File;)V

    .line 52
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lorg/apache/http/HttpHost;Lorg/apache/http/HttpHost;Landroid/net/http/RequestFeeder;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "host"    # Lorg/apache/http/HttpHost;
    .param p3, "proxy"    # Lorg/apache/http/HttpHost;
    .param p4, "requestFeeder"    # Landroid/net/http/RequestFeeder;

    .prologue
    const/4 v1, 0x0

    .line 139
    invoke-direct {p0, p1, p2, p4}, Landroid/net/http/Connection;-><init>(Landroid/content/Context;Lorg/apache/http/HttpHost;Landroid/net/http/RequestFeeder;)V

    .line 117
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/net/http/HttpsConnection;->mSuspendLock:Ljava/lang/Object;

    .line 123
    iput-boolean v1, p0, Landroid/net/http/HttpsConnection;->mSuspended:Z

    .line 129
    iput-boolean v1, p0, Landroid/net/http/HttpsConnection;->mAborted:Z

    .line 140
    iput-object p3, p0, Landroid/net/http/HttpsConnection;->mProxyHost:Lorg/apache/http/HttpHost;

    .line 138
    return-void
.end method

.method private static declared-synchronized getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    .locals 2

    .prologue
    const-class v0, Landroid/net/http/HttpsConnection;

    monitor-enter v0

    .line 111
    :try_start_0
    sget-object v1, Landroid/net/http/HttpsConnection;->mSslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static initializeEngine(Ljava/io/File;)V
    .locals 8
    .param p0, "sessionDir"    # Ljava/io/File;

    .prologue
    .line 71
    const/4 v0, 0x0

    .line 72
    .local v0, "cache":Lcom/android/org/conscrypt/SSLClientSessionCache;
    if-eqz p0, :cond_0

    .line 73
    :try_start_0
    const-string/jumbo v5, "HttpsConnection"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Caching SSL sessions in "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 74
    const-string/jumbo v7, "."

    .line 73
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    invoke-static {p0}, Lcom/android/org/conscrypt/FileClientSessionCache;->usingDirectory(Ljava/io/File;)Lcom/android/org/conscrypt/SSLClientSessionCache;

    move-result-object v0

    .line 78
    .end local v0    # "cache":Lcom/android/org/conscrypt/SSLClientSessionCache;
    :cond_0
    invoke-static {}, Lcom/android/org/conscrypt/OpenSSLContextImpl;->getPreferred()Lcom/android/org/conscrypt/OpenSSLContextImpl;

    move-result-object v3

    .line 81
    .local v3, "sslContext":Lcom/android/org/conscrypt/OpenSSLContextImpl;
    const/4 v5, 0x1

    new-array v4, v5, [Ljavax/net/ssl/TrustManager;

    .line 82
    new-instance v5, Landroid/net/http/HttpsConnection$1;

    invoke-direct {v5}, Landroid/net/http/HttpsConnection$1;-><init>()V

    const/4 v6, 0x0

    aput-object v5, v4, v6

    .line 97
    .local v4, "trustManagers":[Ljavax/net/ssl/TrustManager;
    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v3, v5, v4, v6}, Lcom/android/org/conscrypt/OpenSSLContextImpl;->engineInit([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 98
    invoke-virtual {v3}, Lcom/android/org/conscrypt/OpenSSLContextImpl;->engineGetClientSessionContext()Lcom/android/org/conscrypt/ClientSessionContext;

    move-result-object v5

    invoke-virtual {v5, v0}, Lcom/android/org/conscrypt/ClientSessionContext;->setPersistentCache(Lcom/android/org/conscrypt/SSLClientSessionCache;)V

    .line 100
    const-class v6, Landroid/net/http/HttpsConnection;

    monitor-enter v6
    :try_end_0
    .catch Ljava/security/KeyManagementException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 101
    :try_start_1
    invoke-virtual {v3}, Lcom/android/org/conscrypt/OpenSSLContextImpl;->engineGetSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v5

    sput-object v5, Landroid/net/http/HttpsConnection;->mSslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    monitor-exit v6

    .line 69
    return-void

    .line 100
    :catchall_0
    move-exception v5

    monitor-exit v6

    throw v5
    :try_end_2
    .catch Ljava/security/KeyManagementException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 103
    .end local v3    # "sslContext":Lcom/android/org/conscrypt/OpenSSLContextImpl;
    .end local v4    # "trustManagers":[Ljavax/net/ssl/TrustManager;
    :catch_0
    move-exception v2

    .line 104
    .local v2, "e":Ljava/security/KeyManagementException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 105
    .end local v2    # "e":Ljava/security/KeyManagementException;
    :catch_1
    move-exception v1

    .line 106
    .local v1, "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method


# virtual methods
.method closeConnection()V
    .locals 2

    .prologue
    .line 378
    iget-boolean v1, p0, Landroid/net/http/HttpsConnection;->mSuspended:Z

    if-eqz v1, :cond_0

    .line 380
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/net/http/HttpsConnection;->restartConnection(Z)V

    .line 384
    :cond_0
    :try_start_0
    iget-object v1, p0, Landroid/net/http/HttpsConnection;->mHttpClientConnection:Landroid/net/http/AndroidHttpClientConnection;

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/net/http/HttpsConnection;->mHttpClientConnection:Landroid/net/http/AndroidHttpClientConnection;

    invoke-virtual {v1}, Landroid/net/http/AndroidHttpClientConnection;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 385
    iget-object v1, p0, Landroid/net/http/HttpsConnection;->mHttpClientConnection:Landroid/net/http/AndroidHttpClientConnection;

    invoke-virtual {v1}, Landroid/net/http/AndroidHttpClientConnection;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 376
    :cond_1
    :goto_0
    return-void

    .line 387
    :catch_0
    move-exception v0

    .line 391
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method getScheme()Ljava/lang/String;
    .locals 1

    .prologue
    .line 415
    const-string/jumbo v0, "https"

    return-object v0
.end method

.method openConnection(Landroid/net/http/Request;)Landroid/net/http/AndroidHttpClientConnection;
    .locals 33
    .param p1, "req"    # Landroid/net/http/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 160
    const/16 v24, 0x0

    .line 162
    .local v24, "sslSock":Ljavax/net/ssl/SSLSocket;
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/HttpsConnection;->mProxyHost:Lorg/apache/http/HttpHost;

    move-object/from16 v28, v0

    if-eqz v28, :cond_b

    .line 170
    const/16 v19, 0x0

    .line 171
    .local v19, "proxyConnection":Landroid/net/http/AndroidHttpClientConnection;
    const/16 v22, 0x0

    .line 173
    .local v22, "proxySock":Ljava/net/Socket;
    :try_start_0
    new-instance v23, Ljava/net/Socket;

    .line 174
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/HttpsConnection;->mProxyHost:Lorg/apache/http/HttpHost;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/HttpsConnection;->mProxyHost:Lorg/apache/http/HttpHost;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v29

    .line 173
    move-object/from16 v0, v23

    move-object/from16 v1, v28

    move/from16 v2, v29

    invoke-direct {v0, v1, v2}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    .local v23, "proxySock":Ljava/net/Socket;
    const v28, 0xea60

    :try_start_1
    move-object/from16 v0, v23

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 178
    .end local v22    # "proxySock":Ljava/net/Socket;
    new-instance v20, Landroid/net/http/AndroidHttpClientConnection;

    invoke-direct/range {v20 .. v20}, Landroid/net/http/AndroidHttpClientConnection;-><init>()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_7

    .line 179
    .local v20, "proxyConnection":Landroid/net/http/AndroidHttpClientConnection;
    :try_start_2
    new-instance v18, Lorg/apache/http/params/BasicHttpParams;

    .end local v19    # "proxyConnection":Landroid/net/http/AndroidHttpClientConnection;
    invoke-direct/range {v18 .. v18}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 180
    .local v18, "params":Lorg/apache/http/params/HttpParams;
    const/16 v28, 0x2000

    move-object/from16 v0, v18

    move/from16 v1, v28

    invoke-static {v0, v1}, Lorg/apache/http/params/HttpConnectionParams;->setSocketBufferSize(Lorg/apache/http/params/HttpParams;I)V

    .line 182
    move-object/from16 v0, v20

    move-object/from16 v1, v23

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/net/http/AndroidHttpClientConnection;->bind(Ljava/net/Socket;Lorg/apache/http/params/HttpParams;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_8

    .line 197
    const/16 v26, 0x0

    .line 198
    .local v26, "statusLine":Lorg/apache/http/StatusLine;
    const/16 v25, 0x0

    .line 199
    .local v25, "statusCode":I
    new-instance v16, Landroid/net/http/Headers;

    invoke-direct/range {v16 .. v16}, Landroid/net/http/Headers;-><init>()V

    .line 201
    .local v16, "headers":Landroid/net/http/Headers;
    :try_start_3
    new-instance v21, Lorg/apache/http/message/BasicHttpRequest;

    .line 202
    const-string/jumbo v28, "CONNECT"

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/HttpsConnection;->mHost:Lorg/apache/http/HttpHost;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lorg/apache/http/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object v29

    .line 201
    move-object/from16 v0, v21

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicHttpRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    .local v21, "proxyReq":Lorg/apache/http/message/BasicHttpRequest;
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/net/http/Request;->mHttpRequest:Lorg/apache/http/message/BasicHttpRequest;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lorg/apache/http/message/BasicHttpRequest;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v29

    const/16 v28, 0x0

    move-object/from16 v0, v29

    array-length v0, v0

    move/from16 v30, v0

    :goto_0
    move/from16 v0, v28

    move/from16 v1, v30

    if-ge v0, v1, :cond_4

    aget-object v14, v29, v28

    .line 208
    .local v14, "h":Lorg/apache/http/Header;
    invoke-interface {v14}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v31

    sget-object v32, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual/range {v31 .. v32}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v15

    .line 209
    .local v15, "headerName":Ljava/lang/String;
    const-string/jumbo v31, "proxy"

    move-object/from16 v0, v31

    invoke-virtual {v15, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v31

    if-nez v31, :cond_0

    const-string/jumbo v31, "keep-alive"

    move-object/from16 v0, v31

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v31

    if-nez v31, :cond_0

    .line 210
    const-string/jumbo v31, "host"

    move-object/from16 v0, v31

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v31

    .line 209
    if-eqz v31, :cond_1

    .line 211
    :cond_0
    move-object/from16 v0, v21

    invoke-virtual {v0, v14}, Lorg/apache/http/message/BasicHttpRequest;->addHeader(Lorg/apache/http/Header;)V
    :try_end_3
    .catch Lorg/apache/http/ParseException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Lorg/apache/http/HttpException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 207
    :cond_1
    add-int/lit8 v28, v28, 0x1

    goto :goto_0

    .line 183
    .end local v14    # "h":Lorg/apache/http/Header;
    .end local v15    # "headerName":Ljava/lang/String;
    .end local v16    # "headers":Landroid/net/http/Headers;
    .end local v18    # "params":Lorg/apache/http/params/HttpParams;
    .end local v20    # "proxyConnection":Landroid/net/http/AndroidHttpClientConnection;
    .end local v21    # "proxyReq":Lorg/apache/http/message/BasicHttpRequest;
    .end local v23    # "proxySock":Ljava/net/Socket;
    .end local v25    # "statusCode":I
    .end local v26    # "statusLine":Lorg/apache/http/StatusLine;
    .restart local v19    # "proxyConnection":Landroid/net/http/AndroidHttpClientConnection;
    .restart local v22    # "proxySock":Ljava/net/Socket;
    :catch_0
    move-exception v8

    .line 184
    .end local v19    # "proxyConnection":Landroid/net/http/AndroidHttpClientConnection;
    .end local v22    # "proxySock":Ljava/net/Socket;
    .local v8, "e":Ljava/io/IOException;
    :goto_1
    if-eqz v19, :cond_2

    .line 185
    invoke-virtual/range {v19 .. v19}, Landroid/net/http/AndroidHttpClientConnection;->close()V

    .line 188
    :cond_2
    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v13

    .line 189
    .local v13, "errorMessage":Ljava/lang/String;
    if-nez v13, :cond_3

    .line 191
    const-string/jumbo v13, "failed to establish a connection to the proxy"

    .line 194
    :cond_3
    new-instance v28, Ljava/io/IOException;

    move-object/from16 v0, v28

    invoke-direct {v0, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v28

    .line 215
    .end local v8    # "e":Ljava/io/IOException;
    .end local v13    # "errorMessage":Ljava/lang/String;
    .restart local v16    # "headers":Landroid/net/http/Headers;
    .restart local v18    # "params":Lorg/apache/http/params/HttpParams;
    .restart local v20    # "proxyConnection":Landroid/net/http/AndroidHttpClientConnection;
    .restart local v21    # "proxyReq":Lorg/apache/http/message/BasicHttpRequest;
    .restart local v23    # "proxySock":Ljava/net/Socket;
    .restart local v25    # "statusCode":I
    .restart local v26    # "statusLine":Lorg/apache/http/StatusLine;
    :cond_4
    :try_start_4
    invoke-virtual/range {v20 .. v21}, Landroid/net/http/AndroidHttpClientConnection;->sendRequestHeader(Lorg/apache/http/HttpRequest;)V

    .line 216
    invoke-virtual/range {v20 .. v20}, Landroid/net/http/AndroidHttpClientConnection;->flush()V

    .line 223
    .end local v26    # "statusLine":Lorg/apache/http/StatusLine;
    :cond_5
    move-object/from16 v0, v20

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/net/http/AndroidHttpClientConnection;->parseResponseHeader(Landroid/net/http/Headers;)Lorg/apache/http/StatusLine;

    move-result-object v26

    .line 224
    .local v26, "statusLine":Lorg/apache/http/StatusLine;
    invoke-interface/range {v26 .. v26}, Lorg/apache/http/StatusLine;->getStatusCode()I
    :try_end_4
    .catch Lorg/apache/http/ParseException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Lorg/apache/http/HttpException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    move-result v25

    .line 225
    const/16 v28, 0xc8

    move/from16 v0, v25

    move/from16 v1, v28

    if-lt v0, v1, :cond_5

    .line 252
    const/16 v28, 0xc8

    move/from16 v0, v25

    move/from16 v1, v28

    if-ne v0, v1, :cond_a

    .line 254
    :try_start_5
    invoke-static {}, Landroid/net/http/HttpsConnection;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v28

    .line 255
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/HttpsConnection;->mHost:Lorg/apache/http/HttpHost;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/HttpsConnection;->mHost:Lorg/apache/http/HttpHost;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v30

    const/16 v31, 0x1

    .line 254
    move-object/from16 v0, v28

    move-object/from16 v1, v23

    move-object/from16 v2, v29

    move/from16 v3, v30

    move/from16 v4, v31

    invoke-virtual {v0, v1, v2, v3, v4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v24

    .end local v24    # "sslSock":Ljavax/net/ssl/SSLSocket;
    check-cast v24, Ljavax/net/ssl/SSLSocket;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 306
    .end local v16    # "headers":Landroid/net/http/Headers;
    .end local v18    # "params":Lorg/apache/http/params/HttpParams;
    .end local v20    # "proxyConnection":Landroid/net/http/AndroidHttpClientConnection;
    .end local v21    # "proxyReq":Lorg/apache/http/message/BasicHttpRequest;
    .end local v23    # "proxySock":Ljava/net/Socket;
    .end local v25    # "statusCode":I
    .end local v26    # "statusLine":Lorg/apache/http/StatusLine;
    .local v24, "sslSock":Ljavax/net/ssl/SSLSocket;
    :goto_2
    invoke-static {}, Landroid/net/http/CertificateChainValidator;->getInstance()Landroid/net/http/CertificateChainValidator;

    move-result-object v28

    .line 307
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/HttpsConnection;->mHost:Lorg/apache/http/HttpHost;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v29

    .line 306
    move-object/from16 v0, v28

    move-object/from16 v1, p0

    move-object/from16 v2, v24

    move-object/from16 v3, v29

    invoke-virtual {v0, v1, v2, v3}, Landroid/net/http/CertificateChainValidator;->doHandshakeAndValidateServerCertificates(Landroid/net/http/HttpsConnection;Ljavax/net/ssl/SSLSocket;Ljava/lang/String;)Landroid/net/http/SslError;

    move-result-object v12

    .line 310
    .local v12, "error":Landroid/net/http/SslError;
    if-eqz v12, :cond_11

    .line 316
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/HttpsConnection;->mSuspendLock:Ljava/lang/Object;

    move-object/from16 v28, v0

    monitor-enter v28

    .line 317
    const/16 v29, 0x1

    :try_start_6
    move/from16 v0, v29

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/net/http/HttpsConnection;->mSuspended:Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    monitor-exit v28

    .line 320
    invoke-virtual/range {p1 .. p1}, Landroid/net/http/Request;->getEventHandler()Landroid/net/http/EventHandler;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-interface {v0, v12}, Landroid/net/http/EventHandler;->handleSslErrorRequest(Landroid/net/http/SslError;)Z

    move-result v6

    .line 321
    .local v6, "canHandle":Z
    if-nez v6, :cond_e

    .line 322
    new-instance v28, Ljava/io/IOException;

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v30, "failed to handle "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-direct/range {v28 .. v29}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v28

    .line 242
    .end local v6    # "canHandle":Z
    .end local v12    # "error":Landroid/net/http/SslError;
    .restart local v16    # "headers":Landroid/net/http/Headers;
    .restart local v18    # "params":Lorg/apache/http/params/HttpParams;
    .restart local v20    # "proxyConnection":Landroid/net/http/AndroidHttpClientConnection;
    .restart local v23    # "proxySock":Ljava/net/Socket;
    .local v24, "sslSock":Ljavax/net/ssl/SSLSocket;
    .restart local v25    # "statusCode":I
    :catch_1
    move-exception v8

    .line 243
    .restart local v8    # "e":Ljava/io/IOException;
    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v13

    .line 244
    .restart local v13    # "errorMessage":Ljava/lang/String;
    if-nez v13, :cond_6

    .line 246
    const-string/jumbo v13, "failed to send a CONNECT request"

    .line 249
    :cond_6
    new-instance v28, Ljava/io/IOException;

    move-object/from16 v0, v28

    invoke-direct {v0, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v28

    .line 234
    .end local v8    # "e":Ljava/io/IOException;
    .end local v13    # "errorMessage":Ljava/lang/String;
    :catch_2
    move-exception v10

    .line 235
    .local v10, "e":Lorg/apache/http/HttpException;
    invoke-virtual {v10}, Lorg/apache/http/HttpException;->getMessage()Ljava/lang/String;

    move-result-object v13

    .line 236
    .restart local v13    # "errorMessage":Ljava/lang/String;
    if-nez v13, :cond_7

    .line 238
    const-string/jumbo v13, "failed to send a CONNECT request"

    .line 241
    :cond_7
    new-instance v28, Ljava/io/IOException;

    move-object/from16 v0, v28

    invoke-direct {v0, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v28

    .line 226
    .end local v10    # "e":Lorg/apache/http/HttpException;
    .end local v13    # "errorMessage":Ljava/lang/String;
    :catch_3
    move-exception v11

    .line 227
    .local v11, "e":Lorg/apache/http/ParseException;
    invoke-virtual {v11}, Lorg/apache/http/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v13

    .line 228
    .restart local v13    # "errorMessage":Ljava/lang/String;
    if-nez v13, :cond_8

    .line 230
    const-string/jumbo v13, "failed to send a CONNECT request"

    .line 233
    :cond_8
    new-instance v28, Ljava/io/IOException;

    move-object/from16 v0, v28

    invoke-direct {v0, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v28

    .line 256
    .end local v11    # "e":Lorg/apache/http/ParseException;
    .end local v13    # "errorMessage":Ljava/lang/String;
    .end local v24    # "sslSock":Ljavax/net/ssl/SSLSocket;
    .restart local v21    # "proxyReq":Lorg/apache/http/message/BasicHttpRequest;
    .restart local v26    # "statusLine":Lorg/apache/http/StatusLine;
    :catch_4
    move-exception v8

    .line 261
    .restart local v8    # "e":Ljava/io/IOException;
    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v13

    .line 262
    .restart local v13    # "errorMessage":Ljava/lang/String;
    if-nez v13, :cond_9

    .line 264
    const-string/jumbo v13, "failed to create an SSL socket"

    .line 266
    :cond_9
    new-instance v28, Ljava/io/IOException;

    move-object/from16 v0, v28

    invoke-direct {v0, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v28

    .line 270
    .end local v8    # "e":Ljava/io/IOException;
    .end local v13    # "errorMessage":Ljava/lang/String;
    .restart local v24    # "sslSock":Ljavax/net/ssl/SSLSocket;
    :cond_a
    invoke-interface/range {v26 .. v26}, Lorg/apache/http/StatusLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v27

    .line 272
    .local v27, "version":Lorg/apache/http/ProtocolVersion;
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/net/http/Request;->mEventHandler:Landroid/net/http/EventHandler;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/ProtocolVersion;->getMajor()I

    move-result v29

    .line 273
    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/ProtocolVersion;->getMinor()I

    move-result v30

    .line 275
    invoke-interface/range {v26 .. v26}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v31

    .line 272
    move-object/from16 v0, v28

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v25

    move-object/from16 v4, v31

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/net/http/EventHandler;->status(IIILjava/lang/String;)V

    .line 276
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/net/http/Request;->mEventHandler:Landroid/net/http/EventHandler;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Landroid/net/http/EventHandler;->headers(Landroid/net/http/Headers;)V

    .line 277
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/net/http/Request;->mEventHandler:Landroid/net/http/EventHandler;

    move-object/from16 v28, v0

    invoke-interface/range {v28 .. v28}, Landroid/net/http/EventHandler;->endData()V

    .line 279
    invoke-virtual/range {v20 .. v20}, Landroid/net/http/AndroidHttpClientConnection;->close()V

    .line 283
    const/16 v28, 0x0

    return-object v28

    .line 288
    .end local v16    # "headers":Landroid/net/http/Headers;
    .end local v18    # "params":Lorg/apache/http/params/HttpParams;
    .end local v20    # "proxyConnection":Landroid/net/http/AndroidHttpClientConnection;
    .end local v21    # "proxyReq":Lorg/apache/http/message/BasicHttpRequest;
    .end local v23    # "proxySock":Ljava/net/Socket;
    .end local v25    # "statusCode":I
    .end local v26    # "statusLine":Lorg/apache/http/StatusLine;
    .end local v27    # "version":Lorg/apache/http/ProtocolVersion;
    :cond_b
    :try_start_7
    invoke-static {}, Landroid/net/http/HttpsConnection;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v28

    .line 289
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/HttpsConnection;->mHost:Lorg/apache/http/HttpHost;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/HttpsConnection;->mHost:Lorg/apache/http/HttpHost;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v30

    .line 288
    invoke-virtual/range {v28 .. v30}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v28

    move-object/from16 v0, v28

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    move-object/from16 v24, v0

    .line 290
    .local v24, "sslSock":Ljavax/net/ssl/SSLSocket;
    const v28, 0xea60

    move-object/from16 v0, v24

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljavax/net/ssl/SSLSocket;->setSoTimeout(I)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    goto/16 :goto_2

    .line 291
    .end local v24    # "sslSock":Ljavax/net/ssl/SSLSocket;
    :catch_5
    move-exception v8

    .line 292
    .restart local v8    # "e":Ljava/io/IOException;
    if-eqz v24, :cond_c

    .line 293
    invoke-virtual/range {v24 .. v24}, Ljavax/net/ssl/SSLSocket;->close()V

    .line 296
    :cond_c
    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v13

    .line 297
    .restart local v13    # "errorMessage":Ljava/lang/String;
    if-nez v13, :cond_d

    .line 298
    const-string/jumbo v13, "failed to create an SSL socket"

    .line 301
    :cond_d
    new-instance v28, Ljava/io/IOException;

    move-object/from16 v0, v28

    invoke-direct {v0, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v28

    .line 316
    .end local v8    # "e":Ljava/io/IOException;
    .end local v13    # "errorMessage":Ljava/lang/String;
    .restart local v12    # "error":Landroid/net/http/SslError;
    .restart local v24    # "sslSock":Ljavax/net/ssl/SSLSocket;
    :catchall_0
    move-exception v29

    monitor-exit v28

    throw v29

    .line 324
    .restart local v6    # "canHandle":Z
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/HttpsConnection;->mSuspendLock:Ljava/lang/Object;

    move-object/from16 v29, v0

    monitor-enter v29

    .line 325
    :try_start_8
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/net/http/HttpsConnection;->mSuspended:Z

    move/from16 v28, v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    if-eqz v28, :cond_f

    .line 333
    :try_start_9
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/net/http/HttpsConnection;->mSuspendLock:Ljava/lang/Object;

    move-object/from16 v28, v0

    const-wide/32 v30, 0x927c0

    move-object/from16 v0, v28

    move-wide/from16 v1, v30

    invoke-virtual {v0, v1, v2}, Ljava/lang/Object;->wait(J)V

    .line 334
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/net/http/HttpsConnection;->mSuspended:Z

    move/from16 v28, v0

    if-eqz v28, :cond_f

    .line 338
    const/16 v28, 0x0

    move/from16 v0, v28

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/net/http/HttpsConnection;->mSuspended:Z

    .line 339
    const/16 v28, 0x1

    move/from16 v0, v28

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/net/http/HttpsConnection;->mAborted:Z
    :try_end_9
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_9} :catch_6
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 349
    :cond_f
    :goto_3
    :try_start_a
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/net/http/HttpsConnection;->mAborted:Z

    move/from16 v28, v0

    if-eqz v28, :cond_10

    .line 352
    invoke-virtual/range {v24 .. v24}, Ljavax/net/ssl/SSLSocket;->close()V

    .line 353
    new-instance v28, Landroid/net/http/SSLConnectionClosedByUserException;

    const-string/jumbo v30, "connection closed by the user"

    move-object/from16 v0, v28

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Landroid/net/http/SSLConnectionClosedByUserException;-><init>(Ljava/lang/String;)V

    throw v28
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 324
    :catchall_1
    move-exception v28

    monitor-exit v29

    throw v28

    :cond_10
    monitor-exit v29

    .line 359
    .end local v6    # "canHandle":Z
    :cond_11
    new-instance v7, Landroid/net/http/AndroidHttpClientConnection;

    invoke-direct {v7}, Landroid/net/http/AndroidHttpClientConnection;-><init>()V

    .line 360
    .local v7, "conn":Landroid/net/http/AndroidHttpClientConnection;
    new-instance v17, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct/range {v17 .. v17}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 361
    .local v17, "params":Lorg/apache/http/params/BasicHttpParams;
    const-string/jumbo v28, "http.socket.buffer-size"

    const/16 v29, 0x2000

    move-object/from16 v0, v17

    move-object/from16 v1, v28

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/params/BasicHttpParams;->setIntParameter(Ljava/lang/String;I)Lorg/apache/http/params/HttpParams;

    .line 362
    move-object/from16 v0, v24

    move-object/from16 v1, v17

    invoke-virtual {v7, v0, v1}, Landroid/net/http/AndroidHttpClientConnection;->bind(Ljava/net/Socket;Lorg/apache/http/params/HttpParams;)V

    .line 364
    return-object v7

    .line 345
    .end local v7    # "conn":Landroid/net/http/AndroidHttpClientConnection;
    .end local v17    # "params":Lorg/apache/http/params/BasicHttpParams;
    .restart local v6    # "canHandle":Z
    :catch_6
    move-exception v9

    .local v9, "e":Ljava/lang/InterruptedException;
    goto :goto_3

    .line 183
    .end local v6    # "canHandle":Z
    .end local v9    # "e":Ljava/lang/InterruptedException;
    .end local v12    # "error":Landroid/net/http/SslError;
    .restart local v19    # "proxyConnection":Landroid/net/http/AndroidHttpClientConnection;
    .restart local v23    # "proxySock":Ljava/net/Socket;
    .local v24, "sslSock":Ljavax/net/ssl/SSLSocket;
    :catch_7
    move-exception v8

    .restart local v8    # "e":Ljava/io/IOException;
    move-object/from16 v22, v23

    .end local v23    # "proxySock":Ljava/net/Socket;
    .local v22, "proxySock":Ljava/net/Socket;
    goto/16 :goto_1

    .end local v8    # "e":Ljava/io/IOException;
    .end local v19    # "proxyConnection":Landroid/net/http/AndroidHttpClientConnection;
    .end local v22    # "proxySock":Ljava/net/Socket;
    .restart local v20    # "proxyConnection":Landroid/net/http/AndroidHttpClientConnection;
    .restart local v23    # "proxySock":Ljava/net/Socket;
    :catch_8
    move-exception v8

    .restart local v8    # "e":Ljava/io/IOException;
    move-object/from16 v22, v23

    .end local v23    # "proxySock":Ljava/net/Socket;
    .restart local v22    # "proxySock":Ljava/net/Socket;
    move-object/from16 v19, v20

    .end local v20    # "proxyConnection":Landroid/net/http/AndroidHttpClientConnection;
    .local v19, "proxyConnection":Landroid/net/http/AndroidHttpClientConnection;
    goto/16 :goto_1
.end method

.method restartConnection(Z)V
    .locals 3
    .param p1, "proceed"    # Z

    .prologue
    const/4 v0, 0x0

    .line 404
    iget-object v1, p0, Landroid/net/http/HttpsConnection;->mSuspendLock:Ljava/lang/Object;

    monitor-enter v1

    .line 405
    :try_start_0
    iget-boolean v2, p0, Landroid/net/http/HttpsConnection;->mSuspended:Z

    if-eqz v2, :cond_0

    .line 406
    const/4 v2, 0x0

    iput-boolean v2, p0, Landroid/net/http/HttpsConnection;->mSuspended:Z

    .line 407
    if-eqz p1, :cond_1

    :goto_0
    iput-boolean v0, p0, Landroid/net/http/HttpsConnection;->mAborted:Z

    .line 408
    iget-object v0, p0, Landroid/net/http/HttpsConnection;->mSuspendLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    .line 398
    return-void

    .line 407
    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    .line 404
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method setCertificate(Landroid/net/http/SslCertificate;)V
    .locals 0
    .param p1, "certificate"    # Landroid/net/http/SslCertificate;

    .prologue
    .line 149
    iput-object p1, p0, Landroid/net/http/HttpsConnection;->mCertificate:Landroid/net/http/SslCertificate;

    .line 148
    return-void
.end method

.method public bridge synthetic toString()Ljava/lang/String;
    .locals 1

    .prologue
    invoke-super {p0}, Landroid/net/http/Connection;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
