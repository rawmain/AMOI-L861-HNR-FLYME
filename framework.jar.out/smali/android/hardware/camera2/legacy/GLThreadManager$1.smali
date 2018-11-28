.class Landroid/hardware/camera2/legacy/GLThreadManager$1;
.super Ljava/lang/Object;
.source "GLThreadManager.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/hardware/camera2/legacy/GLThreadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mCleanup:Z

.field private mConfigured:Z

.field private mDroppingFrames:Z

.field final synthetic this$0:Landroid/hardware/camera2/legacy/GLThreadManager;


# direct methods
.method constructor <init>(Landroid/hardware/camera2/legacy/GLThreadManager;)V
    .locals 1
    .param p1, "this$0"    # Landroid/hardware/camera2/legacy/GLThreadManager;

    .prologue
    const/4 v0, 0x0

    .line 73
    iput-object p1, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->this$0:Landroid/hardware/camera2/legacy/GLThreadManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-boolean v0, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->mCleanup:Z

    .line 75
    iput-boolean v0, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->mConfigured:Z

    .line 76
    iput-boolean v0, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->mDroppingFrames:Z

    .line 73
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v5, 0x1

    .line 81
    iget-boolean v2, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->mCleanup:Z

    if-eqz v2, :cond_0

    .line 82
    return v5

    .line 85
    :cond_0
    :try_start_0
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 126
    :pswitch_0
    iget-object v2, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->this$0:Landroid/hardware/camera2/legacy/GLThreadManager;

    invoke-static {v2}, Landroid/hardware/camera2/legacy/GLThreadManager;->-get0(Landroid/hardware/camera2/legacy/GLThreadManager;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Unhandled message "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p1, Landroid/os/Message;->what:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " on GLThread."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    :goto_0
    :pswitch_1
    return v5

    .line 87
    :pswitch_2
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/hardware/camera2/legacy/GLThreadManager$ConfigureHolder;

    .line 88
    .local v0, "configure":Landroid/hardware/camera2/legacy/GLThreadManager$ConfigureHolder;
    iget-object v2, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->this$0:Landroid/hardware/camera2/legacy/GLThreadManager;

    invoke-static {v2}, Landroid/hardware/camera2/legacy/GLThreadManager;->-get3(Landroid/hardware/camera2/legacy/GLThreadManager;)Landroid/hardware/camera2/legacy/SurfaceTextureRenderer;

    move-result-object v2

    invoke-virtual {v2}, Landroid/hardware/camera2/legacy/SurfaceTextureRenderer;->cleanupEGLContext()V

    .line 89
    iget-object v2, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->this$0:Landroid/hardware/camera2/legacy/GLThreadManager;

    invoke-static {v2}, Landroid/hardware/camera2/legacy/GLThreadManager;->-get3(Landroid/hardware/camera2/legacy/GLThreadManager;)Landroid/hardware/camera2/legacy/SurfaceTextureRenderer;

    move-result-object v2

    iget-object v3, v0, Landroid/hardware/camera2/legacy/GLThreadManager$ConfigureHolder;->surfaces:Ljava/util/Collection;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/legacy/SurfaceTextureRenderer;->configureSurfaces(Ljava/util/Collection;)V

    .line 90
    iget-object v3, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->this$0:Landroid/hardware/camera2/legacy/GLThreadManager;

    iget-object v2, v0, Landroid/hardware/camera2/legacy/GLThreadManager$ConfigureHolder;->collector:Landroid/hardware/camera2/legacy/CaptureCollector;

    invoke-static {v2}, Lcom/android/internal/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/camera2/legacy/CaptureCollector;

    invoke-static {v3, v2}, Landroid/hardware/camera2/legacy/GLThreadManager;->-set0(Landroid/hardware/camera2/legacy/GLThreadManager;Landroid/hardware/camera2/legacy/CaptureCollector;)Landroid/hardware/camera2/legacy/CaptureCollector;

    .line 91
    iget-object v2, v0, Landroid/hardware/camera2/legacy/GLThreadManager$ConfigureHolder;->condition:Landroid/os/ConditionVariable;

    invoke-virtual {v2}, Landroid/os/ConditionVariable;->open()V

    .line 92
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->mConfigured:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 129
    .end local v0    # "configure":Landroid/hardware/camera2/legacy/GLThreadManager$ConfigureHolder;
    :catch_0
    move-exception v1

    .line 130
    .local v1, "e":Ljava/lang/Exception;
    iget-object v2, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->this$0:Landroid/hardware/camera2/legacy/GLThreadManager;

    invoke-static {v2}, Landroid/hardware/camera2/legacy/GLThreadManager;->-get0(Landroid/hardware/camera2/legacy/GLThreadManager;)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "Received exception on GL render thread: "

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 131
    iget-object v2, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->this$0:Landroid/hardware/camera2/legacy/GLThreadManager;

    invoke-static {v2}, Landroid/hardware/camera2/legacy/GLThreadManager;->-get2(Landroid/hardware/camera2/legacy/GLThreadManager;)Landroid/hardware/camera2/legacy/CameraDeviceState;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/hardware/camera2/legacy/CameraDeviceState;->setError(I)V

    goto :goto_0

    .line 95
    .end local v1    # "e":Ljava/lang/Exception;
    :pswitch_3
    :try_start_1
    iget-boolean v2, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->mDroppingFrames:Z

    if-eqz v2, :cond_1

    .line 96
    iget-object v2, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->this$0:Landroid/hardware/camera2/legacy/GLThreadManager;

    invoke-static {v2}, Landroid/hardware/camera2/legacy/GLThreadManager;->-get0(Landroid/hardware/camera2/legacy/GLThreadManager;)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "Ignoring frame."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 102
    :cond_1
    iget-boolean v2, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->mConfigured:Z

    if-nez v2, :cond_2

    .line 103
    iget-object v2, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->this$0:Landroid/hardware/camera2/legacy/GLThreadManager;

    invoke-static {v2}, Landroid/hardware/camera2/legacy/GLThreadManager;->-get0(Landroid/hardware/camera2/legacy/GLThreadManager;)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "Dropping frame, EGL context not configured!"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 106
    :cond_2
    :try_start_2
    iget-object v2, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->this$0:Landroid/hardware/camera2/legacy/GLThreadManager;

    invoke-static {v2}, Landroid/hardware/camera2/legacy/GLThreadManager;->-get3(Landroid/hardware/camera2/legacy/GLThreadManager;)Landroid/hardware/camera2/legacy/SurfaceTextureRenderer;

    move-result-object v2

    iget-object v3, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->this$0:Landroid/hardware/camera2/legacy/GLThreadManager;

    invoke-static {v3}, Landroid/hardware/camera2/legacy/GLThreadManager;->-get1(Landroid/hardware/camera2/legacy/GLThreadManager;)Landroid/hardware/camera2/legacy/CaptureCollector;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/legacy/SurfaceTextureRenderer;->drawIntoSurfaces(Landroid/hardware/camera2/legacy/CaptureCollector;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 107
    :catch_1
    move-exception v1

    .line 108
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v2, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->this$0:Landroid/hardware/camera2/legacy/GLThreadManager;

    invoke-static {v2}, Landroid/hardware/camera2/legacy/GLThreadManager;->-get0(Landroid/hardware/camera2/legacy/GLThreadManager;)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "Can not Draw into surface!"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 112
    .end local v1    # "e":Ljava/lang/Exception;
    :pswitch_4
    iget-object v2, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->this$0:Landroid/hardware/camera2/legacy/GLThreadManager;

    invoke-static {v2}, Landroid/hardware/camera2/legacy/GLThreadManager;->-get3(Landroid/hardware/camera2/legacy/GLThreadManager;)Landroid/hardware/camera2/legacy/SurfaceTextureRenderer;

    move-result-object v2

    invoke-virtual {v2}, Landroid/hardware/camera2/legacy/SurfaceTextureRenderer;->cleanupEGLContext()V

    .line 113
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->mCleanup:Z

    .line 114
    const/4 v2, 0x0

    iput-boolean v2, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->mConfigured:Z

    goto/16 :goto_0

    .line 117
    :pswitch_5
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->mDroppingFrames:Z

    goto/16 :goto_0

    .line 120
    :pswitch_6
    const/4 v2, 0x0

    iput-boolean v2, p0, Landroid/hardware/camera2/legacy/GLThreadManager$1;->mDroppingFrames:Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_0

    .line 85
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method
