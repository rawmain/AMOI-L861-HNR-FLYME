.class public Lorg/apache/http/impl/client/DefaultUserTokenHandler;
.super Ljava/lang/Object;
.source "DefaultUserTokenHandler.java"

# interfaces
.implements Lorg/apache/http/client/UserTokenHandler;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getAuthPrincipal(Lorg/apache/http/auth/AuthState;)Ljava/security/Principal;
    .locals 4
    .param p0, "authState"    # Lorg/apache/http/auth/AuthState;

    .prologue
    const/4 v3, 0x0

    .line 84
    invoke-virtual {p0}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v1

    .line 85
    .local v1, "scheme":Lorg/apache/http/auth/AuthScheme;
    if-eqz v1, :cond_0

    invoke-interface {v1}, Lorg/apache/http/auth/AuthScheme;->isComplete()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Lorg/apache/http/auth/AuthScheme;->isConnectionBased()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 86
    invoke-virtual {p0}, Lorg/apache/http/auth/AuthState;->getCredentials()Lorg/apache/http/auth/Credentials;

    move-result-object v0

    .line 87
    .local v0, "creds":Lorg/apache/http/auth/Credentials;
    if-eqz v0, :cond_0

    .line 88
    invoke-interface {v0}, Lorg/apache/http/auth/Credentials;->getUserPrincipal()Ljava/security/Principal;

    move-result-object v2

    return-object v2

    .line 91
    .end local v0    # "creds":Lorg/apache/http/auth/Credentials;
    :cond_0
    return-object v3
.end method


# virtual methods
.method public getUserToken(Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;
    .locals 6
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 56
    const/4 v4, 0x0

    .line 59
    .local v4, "userPrincipal":Ljava/security/Principal;
    const-string/jumbo v5, "http.auth.target-scope"

    .line 58
    invoke-interface {p1, v5}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/auth/AuthState;

    .line 60
    .local v3, "targetAuthState":Lorg/apache/http/auth/AuthState;
    if-eqz v3, :cond_0

    .line 61
    invoke-static {v3}, Lorg/apache/http/impl/client/DefaultUserTokenHandler;->getAuthPrincipal(Lorg/apache/http/auth/AuthState;)Ljava/security/Principal;

    move-result-object v4

    .line 62
    .local v4, "userPrincipal":Ljava/security/Principal;
    if-nez v4, :cond_0

    .line 64
    const-string/jumbo v5, "http.auth.proxy-scope"

    .line 63
    invoke-interface {p1, v5}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/auth/AuthState;

    .line 65
    .local v1, "proxyAuthState":Lorg/apache/http/auth/AuthState;
    invoke-static {v1}, Lorg/apache/http/impl/client/DefaultUserTokenHandler;->getAuthPrincipal(Lorg/apache/http/auth/AuthState;)Ljava/security/Principal;

    move-result-object v4

    .line 69
    .end local v1    # "proxyAuthState":Lorg/apache/http/auth/AuthState;
    .end local v4    # "userPrincipal":Ljava/security/Principal;
    :cond_0
    if-nez v4, :cond_1

    .line 71
    const-string/jumbo v5, "http.connection"

    .line 70
    invoke-interface {p1, v5}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/ManagedClientConnection;

    .line 72
    .local v0, "conn":Lorg/apache/http/conn/ManagedClientConnection;
    invoke-interface {v0}, Lorg/apache/http/conn/ManagedClientConnection;->isOpen()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 73
    invoke-interface {v0}, Lorg/apache/http/conn/ManagedClientConnection;->getSSLSession()Ljavax/net/ssl/SSLSession;

    move-result-object v2

    .line 74
    .local v2, "sslsession":Ljavax/net/ssl/SSLSession;
    if-eqz v2, :cond_1

    .line 75
    invoke-interface {v2}, Ljavax/net/ssl/SSLSession;->getLocalPrincipal()Ljava/security/Principal;

    move-result-object v4

    .line 80
    .end local v0    # "conn":Lorg/apache/http/conn/ManagedClientConnection;
    .end local v2    # "sslsession":Ljavax/net/ssl/SSLSession;
    :cond_1
    return-object v4
.end method
