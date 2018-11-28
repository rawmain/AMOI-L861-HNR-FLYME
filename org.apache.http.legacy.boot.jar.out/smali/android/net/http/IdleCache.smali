.class Landroid/net/http/IdleCache;
.super Ljava/lang/Object;
.source "IdleCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/net/http/IdleCache$Entry;,
        Landroid/net/http/IdleCache$IdleReaper;
    }
.end annotation


# static fields
.field private static final CHECK_INTERVAL:I = 0x7d0

.field private static final EMPTY_CHECK_MAX:I = 0x5

.field private static final IDLE_CACHE_MAX:I = 0x8

.field private static final TIMEOUT:I = 0x1770


# instance fields
.field private mCached:I

.field private mCount:I

.field private mEntries:[Landroid/net/http/IdleCache$Entry;

.field private mReused:I

.field private mThread:Landroid/net/http/IdleCache$IdleReaper;


# direct methods
.method static synthetic -get0(Landroid/net/http/IdleCache;)I
    .locals 1

    iget v0, p0, Landroid/net/http/IdleCache;->mCount:I

    return v0
.end method

.method static synthetic -set0(Landroid/net/http/IdleCache;Landroid/net/http/IdleCache$IdleReaper;)Landroid/net/http/IdleCache$IdleReaper;
    .locals 0

    iput-object p1, p0, Landroid/net/http/IdleCache;->mThread:Landroid/net/http/IdleCache$IdleReaper;

    return-object p1
.end method

.method static synthetic -wrap0(Landroid/net/http/IdleCache;)V
    .locals 0

    invoke-direct {p0}, Landroid/net/http/IdleCache;->clearIdle()V

    return-void
.end method

.method constructor <init>()V
    .locals 4

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-array v1, v3, [Landroid/net/http/IdleCache$Entry;

    iput-object v1, p0, Landroid/net/http/IdleCache;->mEntries:[Landroid/net/http/IdleCache$Entry;

    .line 45
    iput v2, p0, Landroid/net/http/IdleCache;->mCount:I

    .line 47
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/net/http/IdleCache;->mThread:Landroid/net/http/IdleCache$IdleReaper;

    .line 50
    iput v2, p0, Landroid/net/http/IdleCache;->mCached:I

    .line 51
    iput v2, p0, Landroid/net/http/IdleCache;->mReused:I

    .line 54
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v3, :cond_0

    .line 55
    iget-object v1, p0, Landroid/net/http/IdleCache;->mEntries:[Landroid/net/http/IdleCache$Entry;

    new-instance v2, Landroid/net/http/IdleCache$Entry;

    invoke-direct {v2, p0}, Landroid/net/http/IdleCache$Entry;-><init>(Landroid/net/http/IdleCache;)V

    aput-object v2, v1, v0

    .line 54
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 53
    :cond_0
    return-void
.end method

.method private declared-synchronized clearIdle()V
    .locals 6

    .prologue
    monitor-enter p0

    .line 127
    :try_start_0
    iget v4, p0, Landroid/net/http/IdleCache;->mCount:I

    if-lez v4, :cond_1

    .line 128
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 129
    .local v2, "time":J
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v4, 0x8

    if-ge v1, v4, :cond_1

    .line 130
    iget-object v4, p0, Landroid/net/http/IdleCache;->mEntries:[Landroid/net/http/IdleCache$Entry;

    aget-object v0, v4, v1

    .line 131
    .local v0, "entry":Landroid/net/http/IdleCache$Entry;
    iget-object v4, v0, Landroid/net/http/IdleCache$Entry;->mHost:Lorg/apache/http/HttpHost;

    if-eqz v4, :cond_0

    iget-wide v4, v0, Landroid/net/http/IdleCache$Entry;->mTimeout:J

    cmp-long v4, v2, v4

    if-lez v4, :cond_0

    .line 132
    const/4 v4, 0x0

    iput-object v4, v0, Landroid/net/http/IdleCache$Entry;->mHost:Lorg/apache/http/HttpHost;

    .line 133
    iget-object v4, v0, Landroid/net/http/IdleCache$Entry;->mConnection:Landroid/net/http/Connection;

    invoke-virtual {v4}, Landroid/net/http/Connection;->closeConnection()V

    .line 134
    const/4 v4, 0x0

    iput-object v4, v0, Landroid/net/http/IdleCache$Entry;->mConnection:Landroid/net/http/Connection;

    .line 135
    iget v4, p0, Landroid/net/http/IdleCache;->mCount:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Landroid/net/http/IdleCache;->mCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 129
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v0    # "entry":Landroid/net/http/IdleCache$Entry;
    .end local v1    # "i":I
    .end local v2    # "time":J
    :cond_1
    monitor-exit p0

    .line 126
    return-void

    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method


# virtual methods
.method declared-synchronized cacheConnection(Lorg/apache/http/HttpHost;Landroid/net/http/Connection;)Z
    .locals 8
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "connection"    # Landroid/net/http/Connection;

    .prologue
    const/16 v6, 0x8

    monitor-enter p0

    .line 66
    const/4 v2, 0x0

    .line 72
    .local v2, "ret":Z
    :try_start_0
    iget v3, p0, Landroid/net/http/IdleCache;->mCount:I

    if-ge v3, v6, :cond_0

    .line 73
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    .line 74
    .local v4, "time":J
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v6, :cond_0

    .line 75
    iget-object v3, p0, Landroid/net/http/IdleCache;->mEntries:[Landroid/net/http/IdleCache$Entry;

    aget-object v0, v3, v1

    .line 76
    .local v0, "entry":Landroid/net/http/IdleCache$Entry;
    iget-object v3, v0, Landroid/net/http/IdleCache$Entry;->mHost:Lorg/apache/http/HttpHost;

    if-nez v3, :cond_1

    .line 77
    iput-object p1, v0, Landroid/net/http/IdleCache$Entry;->mHost:Lorg/apache/http/HttpHost;

    .line 78
    iput-object p2, v0, Landroid/net/http/IdleCache$Entry;->mConnection:Landroid/net/http/Connection;

    .line 79
    const-wide/16 v6, 0x1770

    add-long/2addr v6, v4

    iput-wide v6, v0, Landroid/net/http/IdleCache$Entry;->mTimeout:J

    .line 80
    iget v3, p0, Landroid/net/http/IdleCache;->mCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Landroid/net/http/IdleCache;->mCount:I

    .line 82
    const/4 v2, 0x1

    .line 83
    iget-object v3, p0, Landroid/net/http/IdleCache;->mThread:Landroid/net/http/IdleCache$IdleReaper;

    if-nez v3, :cond_0

    .line 84
    new-instance v3, Landroid/net/http/IdleCache$IdleReaper;

    const/4 v6, 0x0

    invoke-direct {v3, p0, v6}, Landroid/net/http/IdleCache$IdleReaper;-><init>(Landroid/net/http/IdleCache;Landroid/net/http/IdleCache$IdleReaper;)V

    iput-object v3, p0, Landroid/net/http/IdleCache;->mThread:Landroid/net/http/IdleCache$IdleReaper;

    .line 85
    iget-object v3, p0, Landroid/net/http/IdleCache;->mThread:Landroid/net/http/IdleCache$IdleReaper;

    invoke-virtual {v3}, Landroid/net/http/IdleCache$IdleReaper;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v0    # "entry":Landroid/net/http/IdleCache$Entry;
    .end local v1    # "i":I
    .end local v4    # "time":J
    :cond_0
    monitor-exit p0

    .line 91
    return v2

    .line 74
    .restart local v0    # "entry":Landroid/net/http/IdleCache$Entry;
    .restart local v1    # "i":I
    .restart local v4    # "time":J
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v0    # "entry":Landroid/net/http/IdleCache$Entry;
    .end local v1    # "i":I
    .end local v4    # "time":J
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method declared-synchronized clear()V
    .locals 3

    .prologue
    monitor-enter p0

    .line 115
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    :try_start_0
    iget v2, p0, Landroid/net/http/IdleCache;->mCount:I

    if-lez v2, :cond_1

    const/16 v2, 0x8

    if-ge v1, v2, :cond_1

    .line 116
    iget-object v2, p0, Landroid/net/http/IdleCache;->mEntries:[Landroid/net/http/IdleCache$Entry;

    aget-object v0, v2, v1

    .line 117
    .local v0, "entry":Landroid/net/http/IdleCache$Entry;
    iget-object v2, v0, Landroid/net/http/IdleCache$Entry;->mHost:Lorg/apache/http/HttpHost;

    if-eqz v2, :cond_0

    .line 118
    const/4 v2, 0x0

    iput-object v2, v0, Landroid/net/http/IdleCache$Entry;->mHost:Lorg/apache/http/HttpHost;

    .line 119
    iget-object v2, v0, Landroid/net/http/IdleCache$Entry;->mConnection:Landroid/net/http/Connection;

    invoke-virtual {v2}, Landroid/net/http/Connection;->closeConnection()V

    .line 120
    const/4 v2, 0x0

    iput-object v2, v0, Landroid/net/http/IdleCache$Entry;->mConnection:Landroid/net/http/Connection;

    .line 121
    iget v2, p0, Landroid/net/http/IdleCache;->mCount:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Landroid/net/http/IdleCache;->mCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 115
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v0    # "entry":Landroid/net/http/IdleCache$Entry;
    :cond_1
    monitor-exit p0

    .line 114
    return-void

    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method declared-synchronized getConnection(Lorg/apache/http/HttpHost;)Landroid/net/http/Connection;
    .locals 5
    .param p1, "host"    # Lorg/apache/http/HttpHost;

    .prologue
    monitor-enter p0

    .line 95
    const/4 v3, 0x0

    .line 97
    .local v3, "ret":Landroid/net/http/Connection;
    :try_start_0
    iget v4, p0, Landroid/net/http/IdleCache;->mCount:I

    if-lez v4, :cond_0

    .line 98
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    const/16 v4, 0x8

    if-ge v2, v4, :cond_0

    .line 99
    iget-object v4, p0, Landroid/net/http/IdleCache;->mEntries:[Landroid/net/http/IdleCache$Entry;

    aget-object v1, v4, v2

    .line 100
    .local v1, "entry":Landroid/net/http/IdleCache$Entry;
    iget-object v0, v1, Landroid/net/http/IdleCache$Entry;->mHost:Lorg/apache/http/HttpHost;

    .line 101
    .local v0, "eHost":Lorg/apache/http/HttpHost;
    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Lorg/apache/http/HttpHost;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 102
    iget-object v3, v1, Landroid/net/http/IdleCache$Entry;->mConnection:Landroid/net/http/Connection;

    .line 103
    .local v3, "ret":Landroid/net/http/Connection;
    const/4 v4, 0x0

    iput-object v4, v1, Landroid/net/http/IdleCache$Entry;->mHost:Lorg/apache/http/HttpHost;

    .line 104
    const/4 v4, 0x0

    iput-object v4, v1, Landroid/net/http/IdleCache$Entry;->mConnection:Landroid/net/http/Connection;

    .line 105
    iget v4, p0, Landroid/net/http/IdleCache;->mCount:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Landroid/net/http/IdleCache;->mCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v0    # "eHost":Lorg/apache/http/HttpHost;
    .end local v1    # "entry":Landroid/net/http/IdleCache$Entry;
    .end local v2    # "i":I
    .end local v3    # "ret":Landroid/net/http/Connection;
    :cond_0
    monitor-exit p0

    .line 111
    return-object v3

    .line 98
    .restart local v0    # "eHost":Lorg/apache/http/HttpHost;
    .restart local v1    # "entry":Landroid/net/http/IdleCache$Entry;
    .restart local v2    # "i":I
    .local v3, "ret":Landroid/net/http/Connection;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v0    # "eHost":Lorg/apache/http/HttpHost;
    .end local v1    # "entry":Landroid/net/http/IdleCache$Entry;
    .end local v2    # "i":I
    .end local v3    # "ret":Landroid/net/http/Connection;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method
