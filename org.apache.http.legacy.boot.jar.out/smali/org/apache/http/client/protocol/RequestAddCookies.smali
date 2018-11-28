.class public Lorg/apache/http/client/protocol/RequestAddCookies;
.super Ljava/lang/Object;
.source "RequestAddCookies.java"

# interfaces
.implements Lorg/apache/http/HttpRequestInterceptor;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    invoke-virtual {p0}, Lorg/apache/http/client/protocol/RequestAddCookies;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/protocol/RequestAddCookies;->log:Lorg/apache/commons/logging/Log;

    .line 79
    return-void
.end method


# virtual methods
.method public process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V
    .locals 26
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    if-nez p1, :cond_0

    .line 86
    new-instance v23, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v24, "HTTP request may not be null"

    invoke-direct/range {v23 .. v24}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 88
    :cond_0
    if-nez p2, :cond_1

    .line 89
    new-instance v23, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v24, "HTTP context may not be null"

    invoke-direct/range {v23 .. v24}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 94
    :cond_1
    const-string/jumbo v23, "http.cookie-store"

    .line 93
    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/http/client/CookieStore;

    .line 95
    .local v8, "cookieStore":Lorg/apache/http/client/CookieStore;
    if-nez v8, :cond_2

    .line 96
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/client/protocol/RequestAddCookies;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v23, v0

    const-string/jumbo v24, "Cookie store not available in HTTP context"

    invoke-interface/range {v23 .. v24}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 97
    return-void

    .line 102
    :cond_2
    const-string/jumbo v23, "http.cookiespec-registry"

    .line 101
    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/apache/http/cookie/CookieSpecRegistry;

    .line 103
    .local v19, "registry":Lorg/apache/http/cookie/CookieSpecRegistry;
    if-nez v19, :cond_3

    .line 104
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/client/protocol/RequestAddCookies;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v23, v0

    const-string/jumbo v24, "CookieSpec registry not available in HTTP context"

    invoke-interface/range {v23 .. v24}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 105
    return-void

    .line 110
    :cond_3
    const-string/jumbo v23, "http.target_host"

    .line 109
    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lorg/apache/http/HttpHost;

    .line 111
    .local v21, "targetHost":Lorg/apache/http/HttpHost;
    if-nez v21, :cond_4

    .line 112
    new-instance v23, Ljava/lang/IllegalStateException;

    const-string/jumbo v24, "Target host not specified in HTTP context"

    invoke-direct/range {v23 .. v24}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 117
    :cond_4
    const-string/jumbo v23, "http.connection"

    .line 116
    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/conn/ManagedClientConnection;

    .line 118
    .local v3, "conn":Lorg/apache/http/conn/ManagedClientConnection;
    if-nez v3, :cond_5

    .line 119
    new-instance v23, Ljava/lang/IllegalStateException;

    const-string/jumbo v24, "Client connection not specified in HTTP context"

    invoke-direct/range {v23 .. v24}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 122
    :cond_5
    invoke-interface/range {p1 .. p1}, Lorg/apache/http/HttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lorg/apache/http/client/params/HttpClientParams;->getCookiePolicy(Lorg/apache/http/params/HttpParams;)Ljava/lang/String;

    move-result-object v17

    .line 123
    .local v17, "policy":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/client/protocol/RequestAddCookies;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v23

    if-eqz v23, :cond_6

    .line 124
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/client/protocol/RequestAddCookies;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v23, v0

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v25, "CookieSpec selected: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-interface/range {v23 .. v24}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 128
    :cond_6
    move-object/from16 v0, p1

    instance-of v0, v0, Lorg/apache/http/client/methods/HttpUriRequest;

    move/from16 v23, v0

    if-eqz v23, :cond_a

    move-object/from16 v23, p1

    .line 129
    check-cast v23, Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-interface/range {v23 .. v23}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v20

    .line 139
    .local v20, "requestURI":Ljava/net/URI;
    :goto_0
    invoke-virtual/range {v21 .. v21}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v14

    .line 140
    .local v14, "hostName":Ljava/lang/String;
    invoke-virtual/range {v21 .. v21}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v18

    .line 141
    .local v18, "port":I
    if-gez v18, :cond_7

    .line 142
    invoke-interface {v3}, Lorg/apache/http/conn/ManagedClientConnection;->getRemotePort()I

    move-result v18

    .line 145
    :cond_7
    new-instance v6, Lorg/apache/http/cookie/CookieOrigin;

    .line 148
    invoke-virtual/range {v20 .. v20}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v23

    .line 149
    invoke-interface {v3}, Lorg/apache/http/conn/ManagedClientConnection;->isSecure()Z

    move-result v24

    .line 145
    move/from16 v0, v18

    move-object/from16 v1, v23

    move/from16 v2, v24

    invoke-direct {v6, v14, v0, v1, v2}, Lorg/apache/http/cookie/CookieOrigin;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    .line 152
    .local v6, "cookieOrigin":Lorg/apache/http/cookie/CookieOrigin;
    invoke-interface/range {p1 .. p1}, Lorg/apache/http/HttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v23

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/cookie/CookieSpecRegistry;->getCookieSpec(Ljava/lang/String;Lorg/apache/http/params/HttpParams;)Lorg/apache/http/cookie/CookieSpec;

    move-result-object v7

    .line 154
    .local v7, "cookieSpec":Lorg/apache/http/cookie/CookieSpec;
    new-instance v9, Ljava/util/ArrayList;

    invoke-interface {v8}, Lorg/apache/http/client/CookieStore;->getCookies()Ljava/util/List;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-direct {v9, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 156
    .local v9, "cookies":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/cookie/Cookie;>;"
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 157
    .local v15, "matchedCookies":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/cookie/Cookie;>;"
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "cookie$iterator":Ljava/util/Iterator;
    :cond_8
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/http/cookie/Cookie;

    .line 158
    .local v4, "cookie":Lorg/apache/http/cookie/Cookie;
    invoke-interface {v7, v4, v6}, Lorg/apache/http/cookie/CookieSpec;->match(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)Z

    move-result v23

    if-eqz v23, :cond_8

    .line 159
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/client/protocol/RequestAddCookies;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v23

    if-eqz v23, :cond_9

    .line 160
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/client/protocol/RequestAddCookies;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v23, v0

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v25, "Cookie "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string/jumbo v25, " match "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-interface/range {v23 .. v24}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 162
    :cond_9
    invoke-interface {v15, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 132
    .end local v4    # "cookie":Lorg/apache/http/cookie/Cookie;
    .end local v5    # "cookie$iterator":Ljava/util/Iterator;
    .end local v6    # "cookieOrigin":Lorg/apache/http/cookie/CookieOrigin;
    .end local v7    # "cookieSpec":Lorg/apache/http/cookie/CookieSpec;
    .end local v9    # "cookies":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/cookie/Cookie;>;"
    .end local v14    # "hostName":Ljava/lang/String;
    .end local v15    # "matchedCookies":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/cookie/Cookie;>;"
    .end local v18    # "port":I
    .end local v20    # "requestURI":Ljava/net/URI;
    :cond_a
    :try_start_0
    new-instance v20, Ljava/net/URI;

    invoke-interface/range {p1 .. p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v20

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v20    # "requestURI":Ljava/net/URI;
    goto/16 :goto_0

    .line 133
    .end local v20    # "requestURI":Ljava/net/URI;
    :catch_0
    move-exception v10

    .line 134
    .local v10, "ex":Ljava/net/URISyntaxException;
    new-instance v23, Lorg/apache/http/ProtocolException;

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v25, "Invalid request URI: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    .line 135
    invoke-interface/range {p1 .. p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v25

    .line 134
    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-direct {v0, v1, v10}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v23

    .line 166
    .end local v10    # "ex":Ljava/net/URISyntaxException;
    .restart local v5    # "cookie$iterator":Ljava/util/Iterator;
    .restart local v6    # "cookieOrigin":Lorg/apache/http/cookie/CookieOrigin;
    .restart local v7    # "cookieSpec":Lorg/apache/http/cookie/CookieSpec;
    .restart local v9    # "cookies":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/cookie/Cookie;>;"
    .restart local v14    # "hostName":Ljava/lang/String;
    .restart local v15    # "matchedCookies":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/cookie/Cookie;>;"
    .restart local v18    # "port":I
    .restart local v20    # "requestURI":Ljava/net/URI;
    :cond_b
    invoke-interface {v15}, Ljava/util/List;->isEmpty()Z

    move-result v23

    if-nez v23, :cond_c

    .line 167
    invoke-interface {v7, v15}, Lorg/apache/http/cookie/CookieSpec;->formatCookies(Ljava/util/List;)Ljava/util/List;

    move-result-object v13

    .line 168
    .local v13, "headers":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/Header;>;"
    invoke-interface {v13}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, "header$iterator":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_c

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/apache/http/Header;

    .line 169
    .local v11, "header":Lorg/apache/http/Header;
    move-object/from16 v0, p1

    invoke-interface {v0, v11}, Lorg/apache/http/HttpRequest;->addHeader(Lorg/apache/http/Header;)V

    goto :goto_2

    .line 173
    .end local v11    # "header":Lorg/apache/http/Header;
    .end local v12    # "header$iterator":Ljava/util/Iterator;
    .end local v13    # "headers":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/Header;>;"
    :cond_c
    invoke-interface {v7}, Lorg/apache/http/cookie/CookieSpec;->getVersion()I

    move-result v22

    .line 174
    .local v22, "ver":I
    if-lez v22, :cond_f

    .line 175
    const/16 v16, 0x0

    .line 176
    .local v16, "needVersionHeader":Z
    invoke-interface {v15}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_d
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_e

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/http/cookie/Cookie;

    .line 177
    .restart local v4    # "cookie":Lorg/apache/http/cookie/Cookie;
    invoke-interface {v4}, Lorg/apache/http/cookie/Cookie;->getVersion()I

    move-result v23

    move/from16 v0, v22

    move/from16 v1, v23

    if-eq v0, v1, :cond_d

    .line 178
    const/16 v16, 0x1

    goto :goto_3

    .line 182
    .end local v4    # "cookie":Lorg/apache/http/cookie/Cookie;
    :cond_e
    if-eqz v16, :cond_f

    .line 183
    invoke-interface {v7}, Lorg/apache/http/cookie/CookieSpec;->getVersionHeader()Lorg/apache/http/Header;

    move-result-object v11

    .line 184
    .restart local v11    # "header":Lorg/apache/http/Header;
    if-eqz v11, :cond_f

    .line 186
    move-object/from16 v0, p1

    invoke-interface {v0, v11}, Lorg/apache/http/HttpRequest;->addHeader(Lorg/apache/http/Header;)V

    .line 193
    .end local v11    # "header":Lorg/apache/http/Header;
    .end local v16    # "needVersionHeader":Z
    :cond_f
    const-string/jumbo v23, "http.cookie-spec"

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1, v7}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 194
    const-string/jumbo v23, "http.cookie-origin"

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1, v6}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 84
    return-void
.end method
