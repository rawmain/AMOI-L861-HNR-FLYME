.class public abstract Lorg/apache/http/impl/io/AbstractMessageParser;
.super Ljava/lang/Object;
.source "AbstractMessageParser.java"

# interfaces
.implements Lorg/apache/http/io/HttpMessageParser;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field protected final lineParser:Lorg/apache/http/message/LineParser;

.field private final maxHeaderCount:I

.field private final maxLineLen:I

.field private final sessionBuffer:Lorg/apache/http/io/SessionInputBuffer;


# direct methods
.method public constructor <init>(Lorg/apache/http/io/SessionInputBuffer;Lorg/apache/http/message/LineParser;Lorg/apache/http/params/HttpParams;)V
    .locals 2
    .param p1, "buffer"    # Lorg/apache/http/io/SessionInputBuffer;
    .param p2, "parser"    # Lorg/apache/http/message/LineParser;
    .param p3, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    const/4 v1, -0x1

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    if-nez p1, :cond_0

    .line 75
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Session input buffer may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 77
    :cond_0
    if-nez p3, :cond_1

    .line 78
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 80
    :cond_1
    iput-object p1, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->sessionBuffer:Lorg/apache/http/io/SessionInputBuffer;

    .line 82
    const-string/jumbo v0, "http.connection.max-header-count"

    .line 81
    invoke-interface {p3, v0, v1}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->maxHeaderCount:I

    .line 84
    const-string/jumbo v0, "http.connection.max-line-length"

    .line 83
    invoke-interface {p3, v0, v1}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->maxLineLen:I

    .line 85
    if-eqz p2, :cond_2

    .end local p2    # "parser":Lorg/apache/http/message/LineParser;
    :goto_0
    iput-object p2, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->lineParser:Lorg/apache/http/message/LineParser;

    .line 72
    return-void

    .line 85
    .restart local p2    # "parser":Lorg/apache/http/message/LineParser;
    :cond_2
    sget-object p2, Lorg/apache/http/message/BasicLineParser;->DEFAULT:Lorg/apache/http/message/BasicLineParser;

    goto :goto_0
.end method

.method public static parseHeaders(Lorg/apache/http/io/SessionInputBuffer;IILorg/apache/http/message/LineParser;)[Lorg/apache/http/Header;
    .locals 11
    .param p0, "inbuffer"    # Lorg/apache/http/io/SessionInputBuffer;
    .param p1, "maxHeaderCount"    # I
    .param p2, "maxLineLen"    # I
    .param p3, "parser"    # Lorg/apache/http/message/LineParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    if-nez p0, :cond_0

    .line 112
    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v10, "Session input buffer may not be null"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 114
    :cond_0
    if-nez p3, :cond_1

    .line 115
    sget-object p3, Lorg/apache/http/message/BasicLineParser;->DEFAULT:Lorg/apache/http/message/BasicLineParser;

    .line 117
    :cond_1
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 119
    .local v4, "headerLines":Ljava/util/ArrayList;
    const/4 v2, 0x0

    .line 120
    .local v2, "current":Lorg/apache/http/util/CharArrayBuffer;
    const/4 v8, 0x0

    .line 122
    .end local v2    # "current":Lorg/apache/http/util/CharArrayBuffer;
    :cond_2
    if-nez v2, :cond_4

    .line 123
    new-instance v2, Lorg/apache/http/util/CharArrayBuffer;

    const/16 v9, 0x40

    invoke-direct {v2, v9}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 127
    :goto_0
    invoke-interface {p0, v2}, Lorg/apache/http/io/SessionInputBuffer;->readLine(Lorg/apache/http/util/CharArrayBuffer;)I

    move-result v7

    .line 128
    .local v7, "l":I
    const/4 v9, -0x1

    if-eq v7, v9, :cond_3

    invoke-virtual {v2}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v9

    const/4 v10, 0x1

    if-ge v9, v10, :cond_5

    .line 161
    :cond_3
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v9

    new-array v5, v9, [Lorg/apache/http/Header;

    .line 162
    .local v5, "headers":[Lorg/apache/http/Header;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v6, v9, :cond_b

    .line 163
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/util/CharArrayBuffer;

    .line 165
    .local v0, "buffer":Lorg/apache/http/util/CharArrayBuffer;
    :try_start_0
    invoke-interface {p3, v0}, Lorg/apache/http/message/LineParser;->parseHeader(Lorg/apache/http/util/CharArrayBuffer;)Lorg/apache/http/Header;

    move-result-object v9

    aput-object v9, v5, v6
    :try_end_0
    .catch Lorg/apache/http/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 125
    .end local v0    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    .end local v5    # "headers":[Lorg/apache/http/Header;
    .end local v6    # "i":I
    .end local v7    # "l":I
    :cond_4
    invoke-virtual {v2}, Lorg/apache/http/util/CharArrayBuffer;->clear()V

    goto :goto_0

    .line 135
    .restart local v7    # "l":I
    :cond_5
    const/4 v9, 0x0

    invoke-virtual {v2, v9}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v9

    const/16 v10, 0x20

    if-eq v9, v10, :cond_6

    const/4 v9, 0x0

    invoke-virtual {v2, v9}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v9

    const/16 v10, 0x9

    if-ne v9, v10, :cond_a

    :cond_6
    if-eqz v8, :cond_a

    .line 138
    const/4 v6, 0x0

    .line 139
    .restart local v6    # "i":I
    :goto_2
    invoke-virtual {v2}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v9

    if-ge v6, v9, :cond_7

    .line 140
    invoke-virtual {v2, v6}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v1

    .line 141
    .local v1, "ch":C
    const/16 v9, 0x20

    if-eq v1, v9, :cond_8

    const/16 v9, 0x9

    if-eq v1, v9, :cond_8

    .line 146
    .end local v1    # "ch":C
    :cond_7
    if-lez p2, :cond_9

    .line 147
    invoke-virtual {v8}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v9

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v2}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v10

    add-int/2addr v9, v10

    sub-int/2addr v9, v6

    if-le v9, p2, :cond_9

    .line 148
    new-instance v9, Ljava/io/IOException;

    const-string/jumbo v10, "Maximum line length limit exceeded"

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 144
    .restart local v1    # "ch":C
    :cond_8
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 150
    .end local v1    # "ch":C
    :cond_9
    const/16 v9, 0x20

    invoke-virtual {v8, v9}, Lorg/apache/http/util/CharArrayBuffer;->append(C)V

    .line 151
    invoke-virtual {v2}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v9

    sub-int/2addr v9, v6

    invoke-virtual {v8, v2, v6, v9}, Lorg/apache/http/util/CharArrayBuffer;->append(Lorg/apache/http/util/CharArrayBuffer;II)V

    .line 157
    .end local v6    # "i":I
    :goto_3
    if-lez p1, :cond_2

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lt v9, p1, :cond_2

    .line 158
    new-instance v9, Ljava/io/IOException;

    const-string/jumbo v10, "Maximum header count exceeded"

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 153
    :cond_a
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    move-object v8, v2

    .line 155
    .local v8, "previous":Lorg/apache/http/util/CharArrayBuffer;
    const/4 v2, 0x0

    .restart local v2    # "current":Lorg/apache/http/util/CharArrayBuffer;
    goto :goto_3

    .line 166
    .end local v2    # "current":Lorg/apache/http/util/CharArrayBuffer;
    .end local v8    # "previous":Lorg/apache/http/util/CharArrayBuffer;
    .restart local v0    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    .restart local v5    # "headers":[Lorg/apache/http/Header;
    .restart local v6    # "i":I
    :catch_0
    move-exception v3

    .line 167
    .local v3, "ex":Lorg/apache/http/ParseException;
    new-instance v9, Lorg/apache/http/ProtocolException;

    invoke-virtual {v3}, Lorg/apache/http/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 170
    .end local v0    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    .end local v3    # "ex":Lorg/apache/http/ParseException;
    :cond_b
    return-object v5
.end method


# virtual methods
.method public parse()Lorg/apache/http/HttpMessage;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 177
    const/4 v1, 0x0

    .line 179
    .local v1, "message":Lorg/apache/http/HttpMessage;
    :try_start_0
    iget-object v3, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->sessionBuffer:Lorg/apache/http/io/SessionInputBuffer;

    invoke-virtual {p0, v3}, Lorg/apache/http/impl/io/AbstractMessageParser;->parseHead(Lorg/apache/http/io/SessionInputBuffer;)Lorg/apache/http/HttpMessage;
    :try_end_0
    .catch Lorg/apache/http/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 184
    .local v1, "message":Lorg/apache/http/HttpMessage;
    iget-object v3, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->sessionBuffer:Lorg/apache/http/io/SessionInputBuffer;

    .line 185
    iget v4, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->maxHeaderCount:I

    .line 186
    iget v5, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->maxLineLen:I

    .line 187
    iget-object v6, p0, Lorg/apache/http/impl/io/AbstractMessageParser;->lineParser:Lorg/apache/http/message/LineParser;

    .line 183
    invoke-static {v3, v4, v5, v6}, Lorg/apache/http/impl/io/AbstractMessageParser;->parseHeaders(Lorg/apache/http/io/SessionInputBuffer;IILorg/apache/http/message/LineParser;)[Lorg/apache/http/Header;

    move-result-object v0

    .line 188
    .local v0, "headers":[Lorg/apache/http/Header;
    invoke-interface {v1, v0}, Lorg/apache/http/HttpMessage;->setHeaders([Lorg/apache/http/Header;)V

    .line 189
    return-object v1

    .line 180
    .end local v0    # "headers":[Lorg/apache/http/Header;
    .local v1, "message":Lorg/apache/http/HttpMessage;
    :catch_0
    move-exception v2

    .line 181
    .local v2, "px":Lorg/apache/http/ParseException;
    new-instance v3, Lorg/apache/http/ProtocolException;

    invoke-virtual {v2}, Lorg/apache/http/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method protected abstract parseHead(Lorg/apache/http/io/SessionInputBuffer;)Lorg/apache/http/HttpMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;,
            Lorg/apache/http/ParseException;
        }
    .end annotation
.end method
