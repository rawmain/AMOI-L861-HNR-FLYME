.class public final Landroid/net/http/Headers;
.super Ljava/lang/Object;
.source "Headers.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/net/http/Headers$HeaderCallback;
    }
.end annotation


# static fields
.field public static final ACCEPT_RANGES:Ljava/lang/String; = "accept-ranges"

.field public static final CACHE_CONTROL:Ljava/lang/String; = "cache-control"

.field public static final CONN_CLOSE:I = 0x1

.field public static final CONN_DIRECTIVE:Ljava/lang/String; = "connection"

.field public static final CONN_KEEP_ALIVE:I = 0x2

.field public static final CONTENT_DISPOSITION:Ljava/lang/String; = "content-disposition"

.field public static final CONTENT_ENCODING:Ljava/lang/String; = "content-encoding"

.field public static final CONTENT_LEN:Ljava/lang/String; = "content-length"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "content-type"

.field public static final ETAG:Ljava/lang/String; = "etag"

.field public static final EXPIRES:Ljava/lang/String; = "expires"

.field private static final HASH_ACCEPT_RANGES:I = 0x53476b3b

.field private static final HASH_CACHE_CONTROL:I = -0xc71a9ee

.field private static final HASH_CONN_DIRECTIVE:I = -0x2e3b8122

.field private static final HASH_CONTENT_DISPOSITION:I = -0x4b88f79d

.field private static final HASH_CONTENT_ENCODING:I = 0x7ce07427

.field private static final HASH_CONTENT_LEN:I = -0x4384d946

.field private static final HASH_CONTENT_TYPE:I = 0x2ed4600e

.field private static final HASH_ETAG:I = 0x2fa915

.field private static final HASH_EXPIRES:I = -0x4e0958cc

.field private static final HASH_LAST_MODIFIED:I = 0x8f17c20

.field private static final HASH_LOCATION:I = 0x714f9fb5

.field private static final HASH_PRAGMA:I = -0x3a6d1ac4

.field private static final HASH_PROXY_AUTHENTICATE:I = -0x11fc9c2c

.field private static final HASH_PROXY_CONNECTION:I = 0x110aef9d

.field private static final HASH_REFRESH:I = 0x40b292db

.field private static final HASH_SET_COOKIE:I = 0x49be662f

.field private static final HASH_TRANSFER_ENCODING:I = 0x4bf6b0f5

.field private static final HASH_WWW_AUTHENTICATE:I = -0xe7c74b5

.field private static final HASH_X_PERMITTED_CROSS_DOMAIN_POLICIES:I = -0x5034229e

.field private static final HEADER_COUNT:I = 0x13

.field private static final IDX_ACCEPT_RANGES:I = 0xa

.field private static final IDX_CACHE_CONTROL:I = 0xc

.field private static final IDX_CONN_DIRECTIVE:I = 0x4

.field private static final IDX_CONTENT_DISPOSITION:I = 0x9

.field private static final IDX_CONTENT_ENCODING:I = 0x3

.field private static final IDX_CONTENT_LEN:I = 0x1

.field private static final IDX_CONTENT_TYPE:I = 0x2

.field private static final IDX_ETAG:I = 0xe

.field private static final IDX_EXPIRES:I = 0xb

.field private static final IDX_LAST_MODIFIED:I = 0xd

.field private static final IDX_LOCATION:I = 0x5

.field private static final IDX_PRAGMA:I = 0x10

.field private static final IDX_PROXY_AUTHENTICATE:I = 0x8

.field private static final IDX_PROXY_CONNECTION:I = 0x6

.field private static final IDX_REFRESH:I = 0x11

.field private static final IDX_SET_COOKIE:I = 0xf

.field private static final IDX_TRANSFER_ENCODING:I = 0x0

.field private static final IDX_WWW_AUTHENTICATE:I = 0x7

.field private static final IDX_X_PERMITTED_CROSS_DOMAIN_POLICIES:I = 0x12

.field public static final LAST_MODIFIED:Ljava/lang/String; = "last-modified"

.field public static final LOCATION:Ljava/lang/String; = "location"

.field private static final LOGTAG:Ljava/lang/String; = "Http"

.field public static final NO_CONN_TYPE:I = 0x0

.field public static final NO_CONTENT_LENGTH:J = -0x1L

.field public static final NO_TRANSFER_ENCODING:J = 0x0L

.field public static final PRAGMA:Ljava/lang/String; = "pragma"

.field public static final PROXY_AUTHENTICATE:Ljava/lang/String; = "proxy-authenticate"

.field public static final PROXY_CONNECTION:Ljava/lang/String; = "proxy-connection"

.field public static final REFRESH:Ljava/lang/String; = "refresh"

.field public static final SET_COOKIE:Ljava/lang/String; = "set-cookie"

.field public static final TRANSFER_ENCODING:Ljava/lang/String; = "transfer-encoding"

.field public static final WWW_AUTHENTICATE:Ljava/lang/String; = "www-authenticate"

.field public static final X_PERMITTED_CROSS_DOMAIN_POLICIES:Ljava/lang/String; = "x-permitted-cross-domain-policies"

.field private static final sHeaderNames:[Ljava/lang/String;


# instance fields
.field private connectionType:I

.field private contentLength:J

.field private cookies:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mExtraHeaderNames:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mExtraHeaderValues:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mHeaders:[Ljava/lang/String;

.field private transferEncoding:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 126
    const/16 v0, 0x13

    new-array v0, v0, [Ljava/lang/String;

    .line 127
    const-string/jumbo v1, "transfer-encoding"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 128
    const-string/jumbo v1, "content-length"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 129
    const-string/jumbo v1, "content-type"

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 130
    const-string/jumbo v1, "content-encoding"

    const/4 v2, 0x3

    aput-object v1, v0, v2

    .line 131
    const-string/jumbo v1, "connection"

    const/4 v2, 0x4

    aput-object v1, v0, v2

    .line 132
    const-string/jumbo v1, "location"

    const/4 v2, 0x5

    aput-object v1, v0, v2

    .line 133
    const-string/jumbo v1, "proxy-connection"

    const/4 v2, 0x6

    aput-object v1, v0, v2

    .line 134
    const-string/jumbo v1, "www-authenticate"

    const/4 v2, 0x7

    aput-object v1, v0, v2

    .line 135
    const-string/jumbo v1, "proxy-authenticate"

    const/16 v2, 0x8

    aput-object v1, v0, v2

    .line 136
    const-string/jumbo v1, "content-disposition"

    const/16 v2, 0x9

    aput-object v1, v0, v2

    .line 137
    const-string/jumbo v1, "accept-ranges"

    const/16 v2, 0xa

    aput-object v1, v0, v2

    .line 138
    const-string/jumbo v1, "expires"

    const/16 v2, 0xb

    aput-object v1, v0, v2

    .line 139
    const-string/jumbo v1, "cache-control"

    const/16 v2, 0xc

    aput-object v1, v0, v2

    .line 140
    const-string/jumbo v1, "last-modified"

    const/16 v2, 0xd

    aput-object v1, v0, v2

    .line 141
    const-string/jumbo v1, "etag"

    const/16 v2, 0xe

    aput-object v1, v0, v2

    .line 142
    const-string/jumbo v1, "set-cookie"

    const/16 v2, 0xf

    aput-object v1, v0, v2

    .line 143
    const-string/jumbo v1, "pragma"

    const/16 v2, 0x10

    aput-object v1, v0, v2

    .line 144
    const-string/jumbo v1, "refresh"

    const/16 v2, 0x11

    aput-object v1, v0, v2

    .line 145
    const-string/jumbo v1, "x-permitted-cross-domain-policies"

    const/16 v2, 0x12

    aput-object v1, v0, v2

    .line 126
    sput-object v0, Landroid/net/http/Headers;->sHeaderNames:[Ljava/lang/String;

    .line 33
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x4

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Landroid/net/http/Headers;->cookies:Ljava/util/ArrayList;

    .line 125
    const/16 v0, 0x13

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    .line 149
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Landroid/net/http/Headers;->mExtraHeaderNames:Ljava/util/ArrayList;

    .line 150
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Landroid/net/http/Headers;->mExtraHeaderValues:Ljava/util/ArrayList;

    .line 153
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroid/net/http/Headers;->transferEncoding:J

    .line 154
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Landroid/net/http/Headers;->contentLength:J

    .line 155
    const/4 v0, 0x0

    iput v0, p0, Landroid/net/http/Headers;->connectionType:I

    .line 152
    return-void
.end method

.method static containsIgnoreCaseTrimmed(Lorg/apache/http/util/CharArrayBuffer;ILjava/lang/String;)Z
    .locals 8
    .param p0, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p1, "beginIndex"    # I
    .param p2, "str"    # Ljava/lang/String;

    .prologue
    .line 479
    invoke-virtual {p0}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v4

    .line 480
    .local v4, "len":I
    invoke-virtual {p0}, Lorg/apache/http/util/CharArrayBuffer;->buffer()[C

    move-result-object v2

    .line 481
    .local v2, "chars":[C
    :goto_0
    if-ge p1, v4, :cond_0

    aget-char v7, v2, p1

    invoke-static {v7}, Lorg/apache/http/protocol/HTTP;->isWhitespace(C)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 482
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 484
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v6

    .line 485
    .local v6, "size":I
    add-int v7, p1, v6

    if-lt v4, v7, :cond_2

    const/4 v5, 0x1

    .line 486
    .local v5, "ok":Z
    :goto_1
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_2
    if-eqz v5, :cond_4

    if-ge v3, v6, :cond_4

    .line 487
    add-int v7, p1, v3

    aget-char v0, v2, v7

    .line 488
    .local v0, "a":C
    invoke-virtual {p2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 489
    .local v1, "b":C
    if-eq v0, v1, :cond_1

    .line 490
    invoke-static {v0}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v0

    .line 491
    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v1

    .line 492
    if-ne v0, v1, :cond_3

    const/4 v5, 0x1

    .line 486
    :cond_1
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 485
    .end local v0    # "a":C
    .end local v1    # "b":C
    .end local v3    # "j":I
    .end local v5    # "ok":Z
    :cond_2
    const/4 v5, 0x0

    .restart local v5    # "ok":Z
    goto :goto_1

    .line 492
    .restart local v0    # "a":C
    .restart local v1    # "b":C
    .restart local v3    # "j":I
    :cond_3
    const/4 v5, 0x0

    goto :goto_3

    .line 496
    .end local v0    # "a":C
    .end local v1    # "b":C
    :cond_4
    const/4 v7, 0x1

    return v7
.end method

.method private setConnectionType(Lorg/apache/http/util/CharArrayBuffer;I)V
    .locals 1
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "pos"    # I

    .prologue
    .line 460
    const-string/jumbo v0, "Close"

    invoke-static {p1, p2, v0}, Landroid/net/http/Headers;->containsIgnoreCaseTrimmed(Lorg/apache/http/util/CharArrayBuffer;ILjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 461
    const/4 v0, 0x1

    iput v0, p0, Landroid/net/http/Headers;->connectionType:I

    .line 459
    :cond_0
    :goto_0
    return-void

    .line 463
    :cond_1
    const-string/jumbo v0, "Keep-Alive"

    .line 462
    invoke-static {p1, p2, v0}, Landroid/net/http/Headers;->containsIgnoreCaseTrimmed(Lorg/apache/http/util/CharArrayBuffer;ILjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 464
    const/4 v0, 0x2

    iput v0, p0, Landroid/net/http/Headers;->connectionType:I

    goto :goto_0
.end method

.method static setLowercaseIndexOf(Lorg/apache/http/util/CharArrayBuffer;I)I
    .locals 5
    .param p0, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p1, "ch"    # I

    .prologue
    .line 506
    invoke-virtual {p0}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v2

    .line 507
    .local v2, "endIndex":I
    invoke-virtual {p0}, Lorg/apache/http/util/CharArrayBuffer;->buffer()[C

    move-result-object v0

    .line 505
    .local v0, "chars":[C
    const/4 v3, 0x0

    .line 509
    .local v3, "i":I
    :goto_0
    if-ge v3, v2, :cond_1

    .line 510
    aget-char v1, v0, v3

    .line 511
    .local v1, "current":C
    if-ne v1, p1, :cond_0

    .line 512
    return v3

    .line 514
    :cond_0
    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v4

    aput-char v4, v0, v3

    .line 509
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 517
    .end local v1    # "current":C
    :cond_1
    const/4 v4, -0x1

    return v4
.end method


# virtual methods
.method public getAcceptRanges()Ljava/lang/String;
    .locals 2

    .prologue
    .line 346
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v1, 0xa

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getCacheControl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 354
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v1, 0xc

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getConnectionType()I
    .locals 1

    .prologue
    .line 318
    iget v0, p0, Landroid/net/http/Headers;->connectionType:I

    return v0
.end method

.method public getContentDisposition()Ljava/lang/String;
    .locals 2

    .prologue
    .line 342
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v1, 0x9

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getContentEncoding()Ljava/lang/String;
    .locals 2

    .prologue
    .line 326
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/4 v1, 0x3

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .prologue
    .line 314
    iget-wide v0, p0, Landroid/net/http/Headers;->contentLength:J

    return-wide v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 2

    .prologue
    .line 322
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getEtag()Ljava/lang/String;
    .locals 2

    .prologue
    .line 362
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v1, 0xe

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getExpires()Ljava/lang/String;
    .locals 2

    .prologue
    .line 350
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v1, 0xb

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getHeaders(Landroid/net/http/Headers$HeaderCallback;)V
    .locals 5
    .param p1, "hcb"    # Landroid/net/http/Headers$HeaderCallback;

    .prologue
    .line 441
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    const/16 v3, 0x13

    if-ge v2, v3, :cond_1

    .line 442
    iget-object v3, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    aget-object v1, v3, v2

    .line 443
    .local v1, "h":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 444
    sget-object v3, Landroid/net/http/Headers;->sHeaderNames:[Ljava/lang/String;

    aget-object v3, v3, v2

    invoke-interface {p1, v3, v1}, Landroid/net/http/Headers$HeaderCallback;->header(Ljava/lang/String;Ljava/lang/String;)V

    .line 441
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 447
    .end local v1    # "h":Ljava/lang/String;
    :cond_1
    iget-object v3, p0, Landroid/net/http/Headers;->mExtraHeaderNames:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 448
    .local v0, "extraLen":I
    const/4 v2, 0x0

    :goto_1
    if-ge v2, v0, :cond_2

    .line 453
    iget-object v3, p0, Landroid/net/http/Headers;->mExtraHeaderNames:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 454
    iget-object v4, p0, Landroid/net/http/Headers;->mExtraHeaderValues:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 453
    invoke-interface {p1, v3, v4}, Landroid/net/http/Headers$HeaderCallback;->header(Ljava/lang/String;Ljava/lang/String;)V

    .line 448
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 440
    :cond_2
    return-void
.end method

.method public getLastModified()Ljava/lang/String;
    .locals 2

    .prologue
    .line 358
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v1, 0xd

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getLocation()Ljava/lang/String;
    .locals 2

    .prologue
    .line 330
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/4 v1, 0x5

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getPragma()Ljava/lang/String;
    .locals 2

    .prologue
    .line 370
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v1, 0x10

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getProxyAuthenticate()Ljava/lang/String;
    .locals 2

    .prologue
    .line 338
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v1, 0x8

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getRefresh()Ljava/lang/String;
    .locals 2

    .prologue
    .line 374
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v1, 0x11

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getSetCookie()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 366
    iget-object v0, p0, Landroid/net/http/Headers;->cookies:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getTransferEncoding()J
    .locals 2

    .prologue
    .line 310
    iget-wide v0, p0, Landroid/net/http/Headers;->transferEncoding:J

    return-wide v0
.end method

.method public getWwwAuthenticate()Ljava/lang/String;
    .locals 2

    .prologue
    .line 334
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/4 v1, 0x7

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getXPermittedCrossDomainPolicies()Ljava/lang/String;
    .locals 2

    .prologue
    .line 378
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v1, 0x12

    aget-object v0, v0, v1

    return-object v0
.end method

.method public parseHeader(Lorg/apache/http/util/CharArrayBuffer;)V
    .locals 12
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;

    .prologue
    const-wide/16 v10, -0x1

    const/16 v9, 0xc

    const/4 v7, 0x0

    .line 159
    const/16 v6, 0x3a

    invoke-static {p1, v6}, Landroid/net/http/Headers;->setLowercaseIndexOf(Lorg/apache/http/util/CharArrayBuffer;I)I

    move-result v4

    .line 160
    .local v4, "pos":I
    const/4 v6, -0x1

    if-ne v4, v6, :cond_0

    .line 161
    return-void

    .line 163
    :cond_0
    invoke-virtual {p1, v7, v4}, Lorg/apache/http/util/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object v3

    .line 164
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_1

    .line 165
    return-void

    .line 167
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 169
    invoke-virtual {p1}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v6

    invoke-virtual {p1, v4, v6}, Lorg/apache/http/util/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object v5

    .line 174
    .local v5, "val":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    .line 304
    iget-object v6, p0, Landroid/net/http/Headers;->mExtraHeaderNames:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 305
    iget-object v6, p0, Landroid/net/http/Headers;->mExtraHeaderValues:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 158
    :cond_2
    :goto_0
    return-void

    .line 176
    :sswitch_0
    const-string/jumbo v6, "transfer-encoding"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 177
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    aput-object v5, v6, v7

    .line 178
    sget-object v6, Lorg/apache/http/message/BasicHeaderValueParser;->DEFAULT:Lorg/apache/http/message/BasicHeaderValueParser;

    .line 179
    new-instance v7, Lorg/apache/http/message/ParserCursor;

    .line 180
    invoke-virtual {p1}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v8

    .line 179
    invoke-direct {v7, v4, v8}, Lorg/apache/http/message/ParserCursor;-><init>(II)V

    .line 178
    invoke-virtual {v6, p1, v7}, Lorg/apache/http/message/BasicHeaderValueParser;->parseElements(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;)[Lorg/apache/http/HeaderElement;

    move-result-object v1

    .line 183
    .local v1, "encodings":[Lorg/apache/http/HeaderElement;
    array-length v2, v1

    .line 184
    .local v2, "len":I
    const-string/jumbo v6, "identity"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 185
    iput-wide v10, p0, Landroid/net/http/Headers;->transferEncoding:J

    goto :goto_0

    .line 186
    :cond_3
    if-lez v2, :cond_4

    .line 187
    const-string/jumbo v6, "chunked"

    .line 188
    add-int/lit8 v7, v2, -0x1

    aget-object v7, v1, v7

    invoke-interface {v7}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v7

    .line 187
    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    .line 186
    if-eqz v6, :cond_4

    .line 189
    const-wide/16 v6, -0x2

    iput-wide v6, p0, Landroid/net/http/Headers;->transferEncoding:J

    goto :goto_0

    .line 191
    :cond_4
    iput-wide v10, p0, Landroid/net/http/Headers;->transferEncoding:J

    goto :goto_0

    .line 196
    .end local v1    # "encodings":[Lorg/apache/http/HeaderElement;
    .end local v2    # "len":I
    :sswitch_1
    const-string/jumbo v6, "content-length"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 197
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/4 v7, 0x1

    aput-object v5, v6, v7

    .line 199
    :try_start_0
    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    iput-wide v6, p0, Landroid/net/http/Headers;->contentLength:J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 200
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/NumberFormatException;
    goto :goto_0

    .line 209
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :sswitch_2
    const-string/jumbo v6, "content-type"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 210
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/4 v7, 0x2

    aput-object v5, v6, v7

    goto :goto_0

    .line 214
    :sswitch_3
    const-string/jumbo v6, "content-encoding"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 215
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/4 v7, 0x3

    aput-object v5, v6, v7

    goto :goto_0

    .line 219
    :sswitch_4
    const-string/jumbo v6, "connection"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 220
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/4 v7, 0x4

    aput-object v5, v6, v7

    .line 221
    invoke-direct {p0, p1, v4}, Landroid/net/http/Headers;->setConnectionType(Lorg/apache/http/util/CharArrayBuffer;I)V

    goto/16 :goto_0

    .line 225
    :sswitch_5
    const-string/jumbo v6, "location"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 226
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/4 v7, 0x5

    aput-object v5, v6, v7

    goto/16 :goto_0

    .line 230
    :sswitch_6
    const-string/jumbo v6, "proxy-connection"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 231
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/4 v7, 0x6

    aput-object v5, v6, v7

    .line 232
    invoke-direct {p0, p1, v4}, Landroid/net/http/Headers;->setConnectionType(Lorg/apache/http/util/CharArrayBuffer;I)V

    goto/16 :goto_0

    .line 236
    :sswitch_7
    const-string/jumbo v6, "www-authenticate"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 237
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/4 v7, 0x7

    aput-object v5, v6, v7

    goto/16 :goto_0

    .line 241
    :sswitch_8
    const-string/jumbo v6, "proxy-authenticate"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 242
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v7, 0x8

    aput-object v5, v6, v7

    goto/16 :goto_0

    .line 246
    :sswitch_9
    const-string/jumbo v6, "content-disposition"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 247
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v7, 0x9

    aput-object v5, v6, v7

    goto/16 :goto_0

    .line 251
    :sswitch_a
    const-string/jumbo v6, "accept-ranges"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 252
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v7, 0xa

    aput-object v5, v6, v7

    goto/16 :goto_0

    .line 256
    :sswitch_b
    const-string/jumbo v6, "expires"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 257
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v7, 0xb

    aput-object v5, v6, v7

    goto/16 :goto_0

    .line 261
    :sswitch_c
    const-string/jumbo v6, "cache-control"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 264
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    aget-object v6, v6, v9

    if-eqz v6, :cond_5

    .line 265
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    aget-object v6, v6, v9

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_5

    .line 266
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v8, v6, v9

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x2c

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    goto/16 :goto_0

    .line 268
    :cond_5
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    aput-object v5, v6, v9

    goto/16 :goto_0

    .line 273
    :sswitch_d
    const-string/jumbo v6, "last-modified"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 274
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v7, 0xd

    aput-object v5, v6, v7

    goto/16 :goto_0

    .line 278
    :sswitch_e
    const-string/jumbo v6, "etag"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 279
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v7, 0xe

    aput-object v5, v6, v7

    goto/16 :goto_0

    .line 283
    :sswitch_f
    const-string/jumbo v6, "set-cookie"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 284
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v7, 0xf

    aput-object v5, v6, v7

    .line 285
    iget-object v6, p0, Landroid/net/http/Headers;->cookies:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 289
    :sswitch_10
    const-string/jumbo v6, "pragma"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 290
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v7, 0x10

    aput-object v5, v6, v7

    goto/16 :goto_0

    .line 294
    :sswitch_11
    const-string/jumbo v6, "refresh"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 295
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v7, 0x11

    aput-object v5, v6, v7

    goto/16 :goto_0

    .line 299
    :sswitch_12
    const-string/jumbo v6, "x-permitted-cross-domain-policies"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 300
    iget-object v6, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v7, 0x12

    aput-object v5, v6, v7

    goto/16 :goto_0

    .line 174
    :sswitch_data_0
    .sparse-switch
        -0x5034229e -> :sswitch_12
        -0x4e0958cc -> :sswitch_b
        -0x4b88f79d -> :sswitch_9
        -0x4384d946 -> :sswitch_1
        -0x3a6d1ac4 -> :sswitch_10
        -0x2e3b8122 -> :sswitch_4
        -0x11fc9c2c -> :sswitch_8
        -0xe7c74b5 -> :sswitch_7
        -0xc71a9ee -> :sswitch_c
        0x2fa915 -> :sswitch_e
        0x8f17c20 -> :sswitch_d
        0x110aef9d -> :sswitch_6
        0x2ed4600e -> :sswitch_2
        0x40b292db -> :sswitch_11
        0x49be662f -> :sswitch_f
        0x4bf6b0f5 -> :sswitch_0
        0x53476b3b -> :sswitch_a
        0x714f9fb5 -> :sswitch_5
        0x7ce07427 -> :sswitch_3
    .end sparse-switch
.end method

.method public setAcceptRanges(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 410
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v1, 0xa

    aput-object p1, v0, v1

    .line 409
    return-void
.end method

.method public setCacheControl(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 418
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v1, 0xc

    aput-object p1, v0, v1

    .line 417
    return-void
.end method

.method public setContentDisposition(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 406
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v1, 0x9

    aput-object p1, v0, v1

    .line 405
    return-void
.end method

.method public setContentEncoding(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 390
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/4 v1, 0x3

    aput-object p1, v0, v1

    .line 389
    return-void
.end method

.method public setContentLength(J)V
    .locals 1
    .param p1, "value"    # J

    .prologue
    .line 382
    iput-wide p1, p0, Landroid/net/http/Headers;->contentLength:J

    .line 381
    return-void
.end method

.method public setContentType(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 386
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/4 v1, 0x2

    aput-object p1, v0, v1

    .line 385
    return-void
.end method

.method public setEtag(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 426
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v1, 0xe

    aput-object p1, v0, v1

    .line 425
    return-void
.end method

.method public setExpires(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 414
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v1, 0xb

    aput-object p1, v0, v1

    .line 413
    return-void
.end method

.method public setLastModified(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 422
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v1, 0xd

    aput-object p1, v0, v1

    .line 421
    return-void
.end method

.method public setLocation(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 394
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/4 v1, 0x5

    aput-object p1, v0, v1

    .line 393
    return-void
.end method

.method public setProxyAuthenticate(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 402
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v1, 0x8

    aput-object p1, v0, v1

    .line 401
    return-void
.end method

.method public setWwwAuthenticate(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 398
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/4 v1, 0x7

    aput-object p1, v0, v1

    .line 397
    return-void
.end method

.method public setXPermittedCrossDomainPolicies(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 430
    iget-object v0, p0, Landroid/net/http/Headers;->mHeaders:[Ljava/lang/String;

    const/16 v1, 0x12

    aput-object p1, v0, v1

    .line 429
    return-void
.end method
