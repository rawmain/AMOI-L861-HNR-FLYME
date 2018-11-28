.class public Lorg/apache/http/impl/EnglishReasonPhraseCatalog;
.super Ljava/lang/Object;
.source "EnglishReasonPhraseCatalog.java"

# interfaces
.implements Lorg/apache/http/ReasonPhraseCatalog;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final INSTANCE:Lorg/apache/http/impl/EnglishReasonPhraseCatalog;

.field private static final REASON_PHRASES:[[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x3

    const/16 v3, 0x8

    .line 67
    new-instance v0, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;

    invoke-direct {v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;-><init>()V

    .line 66
    sput-object v0, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->INSTANCE:Lorg/apache/http/impl/EnglishReasonPhraseCatalog;

    .line 105
    const/4 v0, 0x6

    new-array v0, v0, [[Ljava/lang/String;

    .line 106
    const/4 v1, 0x0

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 107
    new-array v1, v4, [Ljava/lang/String;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 108
    new-array v1, v3, [Ljava/lang/String;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 109
    new-array v1, v3, [Ljava/lang/String;

    aput-object v1, v0, v4

    .line 110
    const/16 v1, 0x19

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    .line 111
    new-array v1, v3, [Ljava/lang/String;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    .line 105
    sput-object v0, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->REASON_PHRASES:[[Ljava/lang/String;

    .line 136
    const-string/jumbo v0, "OK"

    .line 135
    const/16 v1, 0xc8

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 138
    const-string/jumbo v0, "Created"

    .line 137
    const/16 v1, 0xc9

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 140
    const-string/jumbo v0, "Accepted"

    .line 139
    const/16 v1, 0xca

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 142
    const-string/jumbo v0, "No Content"

    .line 141
    const/16 v1, 0xcc

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 144
    const-string/jumbo v0, "Moved Permanently"

    .line 143
    const/16 v1, 0x12d

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 146
    const-string/jumbo v0, "Moved Temporarily"

    .line 145
    const/16 v1, 0x12e

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 148
    const-string/jumbo v0, "Not Modified"

    .line 147
    const/16 v1, 0x130

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 150
    const-string/jumbo v0, "Bad Request"

    .line 149
    const/16 v1, 0x190

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 152
    const-string/jumbo v0, "Unauthorized"

    .line 151
    const/16 v1, 0x191

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 154
    const-string/jumbo v0, "Forbidden"

    .line 153
    const/16 v1, 0x193

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 156
    const-string/jumbo v0, "Not Found"

    .line 155
    const/16 v1, 0x194

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 158
    const-string/jumbo v0, "Internal Server Error"

    .line 157
    const/16 v1, 0x1f4

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 160
    const-string/jumbo v0, "Not Implemented"

    .line 159
    const/16 v1, 0x1f5

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 162
    const-string/jumbo v0, "Bad Gateway"

    .line 161
    const/16 v1, 0x1f6

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 164
    const-string/jumbo v0, "Service Unavailable"

    .line 163
    const/16 v1, 0x1f7

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 168
    const-string/jumbo v0, "Continue"

    .line 167
    const/16 v1, 0x64

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 170
    const-string/jumbo v0, "Temporary Redirect"

    .line 169
    const/16 v1, 0x133

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 172
    const-string/jumbo v0, "Method Not Allowed"

    .line 171
    const/16 v1, 0x195

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 174
    const-string/jumbo v0, "Conflict"

    .line 173
    const/16 v1, 0x199

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 176
    const-string/jumbo v0, "Precondition Failed"

    .line 175
    const/16 v1, 0x19c

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 178
    const-string/jumbo v0, "Request Too Long"

    .line 177
    const/16 v1, 0x19d

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 180
    const-string/jumbo v0, "Request-URI Too Long"

    .line 179
    const/16 v1, 0x19e

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 182
    const-string/jumbo v0, "Unsupported Media Type"

    .line 181
    const/16 v1, 0x19f

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 184
    const-string/jumbo v0, "Multiple Choices"

    .line 183
    const/16 v1, 0x12c

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 186
    const-string/jumbo v0, "See Other"

    .line 185
    const/16 v1, 0x12f

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 188
    const-string/jumbo v0, "Use Proxy"

    .line 187
    const/16 v1, 0x131

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 190
    const-string/jumbo v0, "Payment Required"

    .line 189
    const/16 v1, 0x192

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 192
    const-string/jumbo v0, "Not Acceptable"

    .line 191
    const/16 v1, 0x196

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 194
    const-string/jumbo v0, "Proxy Authentication Required"

    .line 193
    const/16 v1, 0x197

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 196
    const-string/jumbo v0, "Request Timeout"

    .line 195
    const/16 v1, 0x198

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 199
    const-string/jumbo v0, "Switching Protocols"

    .line 198
    const/16 v1, 0x65

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 201
    const-string/jumbo v0, "Non Authoritative Information"

    .line 200
    const/16 v1, 0xcb

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 203
    const-string/jumbo v0, "Reset Content"

    .line 202
    const/16 v1, 0xcd

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 205
    const-string/jumbo v0, "Partial Content"

    .line 204
    const/16 v1, 0xce

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 207
    const-string/jumbo v0, "Gateway Timeout"

    .line 206
    const/16 v1, 0x1f8

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 209
    const-string/jumbo v0, "Http Version Not Supported"

    .line 208
    const/16 v1, 0x1f9

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 211
    const-string/jumbo v0, "Gone"

    .line 210
    const/16 v1, 0x19a

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 213
    const-string/jumbo v0, "Length Required"

    .line 212
    const/16 v1, 0x19b

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 215
    const-string/jumbo v0, "Requested Range Not Satisfiable"

    .line 214
    const/16 v1, 0x1a0

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 217
    const-string/jumbo v0, "Expectation Failed"

    .line 216
    const/16 v1, 0x1a1

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 221
    const-string/jumbo v0, "Processing"

    .line 220
    const/16 v1, 0x66

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 223
    const-string/jumbo v0, "Multi-Status"

    .line 222
    const/16 v1, 0xcf

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 225
    const-string/jumbo v0, "Unprocessable Entity"

    .line 224
    const/16 v1, 0x1a6

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 227
    const-string/jumbo v0, "Insufficient Space On Resource"

    .line 226
    const/16 v1, 0x1a3

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 229
    const-string/jumbo v0, "Method Failure"

    .line 228
    const/16 v1, 0x1a4

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 231
    const-string/jumbo v0, "Locked"

    .line 230
    const/16 v1, 0x1a7

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 233
    const-string/jumbo v0, "Insufficient Storage"

    .line 232
    const/16 v1, 0x1fb

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 235
    const-string/jumbo v0, "Failed Dependency"

    .line 234
    const/16 v1, 0x1a8

    invoke-static {v1, v0}, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->setReason(ILjava/lang/String;)V

    .line 56
    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static setReason(ILjava/lang/String;)V
    .locals 3
    .param p0, "status"    # I
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 124
    div-int/lit8 v0, p0, 0x64

    .line 125
    .local v0, "category":I
    mul-int/lit8 v2, v0, 0x64

    sub-int v1, p0, v2

    .line 126
    .local v1, "subcode":I
    sget-object v2, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->REASON_PHRASES:[[Ljava/lang/String;

    aget-object v2, v2, v0

    aput-object p1, v2, v1

    .line 123
    return-void
.end method


# virtual methods
.method public getReason(ILjava/util/Locale;)Ljava/lang/String;
    .locals 6
    .param p1, "status"    # I
    .param p2, "loc"    # Ljava/util/Locale;

    .prologue
    const/16 v3, 0x64

    .line 88
    if-lt p1, v3, :cond_0

    const/16 v3, 0x258

    if-lt p1, v3, :cond_1

    .line 89
    :cond_0
    new-instance v3, Ljava/lang/IllegalArgumentException;

    .line 90
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Unknown category for status code "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 89
    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 93
    :cond_1
    div-int/lit8 v0, p1, 0x64

    .line 94
    .local v0, "category":I
    mul-int/lit8 v3, v0, 0x64

    sub-int v2, p1, v3

    .line 96
    .local v2, "subcode":I
    const/4 v1, 0x0

    .line 97
    .local v1, "reason":Ljava/lang/String;
    sget-object v3, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->REASON_PHRASES:[[Ljava/lang/String;

    aget-object v3, v3, v0

    array-length v3, v3

    if-le v3, v2, :cond_2

    .line 98
    sget-object v3, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->REASON_PHRASES:[[Ljava/lang/String;

    aget-object v3, v3, v0

    aget-object v1, v3, v2

    .line 100
    .end local v1    # "reason":Ljava/lang/String;
    :cond_2
    return-object v1
.end method
