.class public Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;
.super Ljava/lang/Object;
.source "TcmIdleTimerMonitor.java"

# interfaces
.implements Lcom/quicinc/tcmiface/DpmTcmIface;


# static fields
.field private static lockObj:Ljava/lang/Object;

.field private static mTcmRegisterMethod:Ljava/lang/reflect/Method;

.field private static tcmClient:Ljava/lang/Object;


# instance fields
.field private connectionManager:Lorg/apache/http/conn/ClientConnectionManager;

.field private final log:Lorg/apache/commons/logging/Log;

.field result:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 47
    sput-object v0, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->tcmClient:Ljava/lang/Object;

    .line 48
    sput-object v0, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->mTcmRegisterMethod:Ljava/lang/reflect/Method;

    .line 49
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->lockObj:Ljava/lang/Object;

    .line 44
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/ClientConnectionManager;)V
    .locals 10
    .param p1, "connManager"    # Lorg/apache/http/conn/ClientConnectionManager;

    .prologue
    const/4 v6, 0x0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->log:Lorg/apache/commons/logging/Log;

    .line 50
    iput-object v6, p0, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->result:Ljava/lang/Object;

    .line 54
    sget-object v6, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->lockObj:Ljava/lang/Object;

    monitor-enter v6

    .line 55
    :try_start_0
    iput-object p1, p0, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->connectionManager:Lorg/apache/http/conn/ClientConnectionManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    :try_start_1
    sget-object v5, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->mTcmRegisterMethod:Ljava/lang/reflect/Method;

    if-eqz v5, :cond_0

    sget-object v5, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->tcmClient:Ljava/lang/Object;

    if-nez v5, :cond_1

    .line 61
    :cond_0
    new-instance v4, Ldalvik/system/PathClassLoader;

    const-string/jumbo v5, "/system/framework/tcmclient.jar"

    .line 62
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    .line 61
    invoke-direct {v4, v5, v7}, Ldalvik/system/PathClassLoader;-><init>(Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 63
    .local v4, "tcmClassLoader":Ldalvik/system/PathClassLoader;
    const-string/jumbo v5, "com.qti.tcmclient.DpmTcmClient"

    invoke-virtual {v4, v5}, Ldalvik/system/PathClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 64
    .local v3, "tcmClass":Ljava/lang/Class;
    const-string/jumbo v5, "getInstance"

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Class;

    invoke-virtual {v3, v5, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 65
    .local v2, "mGetTcmMethod":Ljava/lang/reflect/Method;
    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v2, v7, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    sput-object v5, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->tcmClient:Ljava/lang/Object;

    .line 66
    const-string/jumbo v5, "registerTcmMonitor"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Class;

    const-class v8, Lcom/quicinc/tcmiface/DpmTcmIface;

    const/4 v9, 0x0

    aput-object v8, v7, v9

    invoke-virtual {v3, v5, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    sput-object v5, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->mTcmRegisterMethod:Ljava/lang/reflect/Method;

    .line 68
    .end local v2    # "mGetTcmMethod":Ljava/lang/reflect/Method;
    .end local v3    # "tcmClass":Ljava/lang/Class;
    .end local v4    # "tcmClassLoader":Ldalvik/system/PathClassLoader;
    :cond_1
    sget-object v5, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->mTcmRegisterMethod:Ljava/lang/reflect/Method;

    if-eqz v5, :cond_2

    sget-object v5, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->tcmClient:Ljava/lang/Object;

    if-eqz v5, :cond_2

    .line 69
    sget-object v5, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->mTcmRegisterMethod:Ljava/lang/reflect/Method;

    sget-object v7, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->tcmClient:Ljava/lang/Object;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p0, v8, v9

    invoke-virtual {v5, v7, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->result:Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    :goto_0
    monitor-exit v6

    .line 53
    return-void

    .line 73
    :catch_0
    move-exception v1

    .line 74
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    iget-object v5, p0, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Failed to load tcmclient "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 54
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    monitor-exit v6

    throw v5

    .line 71
    :catch_1
    move-exception v0

    .local v0, "e":Ljava/lang/ClassNotFoundException;
    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized OnCloseIdleConn()V
    .locals 4

    .prologue
    monitor-enter p0

    .line 82
    :try_start_0
    iget-object v0, p0, Lorg/apache/http/impl/conn/TcmIdleTimerMonitor;->connectionManager:Lorg/apache/http/conn/ClientConnectionManager;

    const-wide/16 v2, 0x0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v2, v3, v1}, Lorg/apache/http/conn/ClientConnectionManager;->closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    .line 80
    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
