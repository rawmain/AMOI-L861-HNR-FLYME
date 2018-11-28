.class Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;
.super Landroid/content/BroadcastReceiver;
.source "WorldPhoneOm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;


# direct methods
.method constructor <init>(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    .prologue
    .line 272
    iput-object p1, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 274
    const-string/jumbo v13, "[Receiver]+"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 275
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    .line 276
    .local v1, "action":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Action: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 278
    const-string/jumbo v13, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v13, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_d

    .line 279
    const-string/jumbo v13, "ss"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 280
    .local v10, "simStatus":Ljava/lang/String;
    const-string/jumbo v13, "slot"

    const/4 v14, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v11

    .line 281
    .local v11, "slotId":I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->getMajorSim()I

    move-result v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set5(I)I

    .line 282
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "slotId: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, " simStatus: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, " sMajorSim:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get14()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 283
    const-string/jumbo v13, "IMSI"

    invoke-virtual {v13, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_a

    .line 284
    invoke-static {}, Lcom/android/internal/telephony/uicc/UiccController;->getInstance()Lcom/android/internal/telephony/uicc/UiccController;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set14(Lcom/android/internal/telephony/uicc/UiccController;)Lcom/android/internal/telephony/uicc/UiccController;

    .line 285
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get32()Lcom/android/internal/telephony/uicc/UiccController;

    move-result-object v13

    if-eqz v13, :cond_2

    .line 286
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get10()[Lcom/android/internal/telephony/uicc/IccRecords;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get21()[Lcom/android/internal/telephony/Phone;

    move-result-object v14

    aget-object v14, v14, v11

    invoke-interface {v14}, Lcom/android/internal/telephony/Phone;->getIccCard()Lcom/android/internal/telephony/IccCard;

    move-result-object v14

    invoke-interface {v14}, Lcom/android/internal/telephony/IccCard;->getIccRecords()Lcom/android/internal/telephony/uicc/IccRecords;

    move-result-object v14

    aput-object v14, v13, v11

    .line 292
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get10()[Lcom/android/internal/telephony/uicc/IccRecords;

    move-result-object v13

    aget-object v13, v13, v11

    if-eqz v13, :cond_3

    .line 293
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get11()[Ljava/lang/String;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get10()[Lcom/android/internal/telephony/uicc/IccRecords;

    move-result-object v14

    aget-object v14, v14, v11

    invoke-virtual {v14}, Lcom/android/internal/telephony/uicc/IccRecords;->getIMSI()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v13, v11

    .line 298
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get9()[I

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    invoke-static {v14, v11}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap3(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;I)I

    move-result v14

    aput v14, v13, v11

    .line 299
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "sImsi["

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, "]:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get11()[Ljava/lang/String;

    move-result-object v14

    aget-object v14, v14, v11

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 302
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get12()Z

    move-result v13

    if-eqz v13, :cond_9

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get14()I

    move-result v13

    if-ne v11, v13, :cond_9

    .line 303
    const-string/jumbo v13, "Major SIM"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 304
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get11()[Ljava/lang/String;

    move-result-object v14

    aget-object v14, v14, v11

    invoke-static {v13, v14}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap4(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;Ljava/lang/String;)I

    move-result v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set15(I)I

    .line 305
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get8()[Z

    move-result-object v13

    aget-boolean v13, v13, v11

    if-eqz v13, :cond_0

    .line 306
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get8()[Z

    move-result-object v13

    const/4 v14, 0x0

    aput-boolean v14, v13, v11

    .line 307
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get33()I

    move-result v13

    const/4 v14, 0x1

    if-ne v13, v14, :cond_6

    .line 308
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get23()I

    move-result v13

    const/4 v14, 0x1

    if-ne v13, v14, :cond_4

    .line 309
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    const/16 v14, 0x65

    invoke-static {v13, v14}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap7(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;I)V

    .line 319
    :cond_0
    :goto_0
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get30()[Z

    move-result-object v13

    aget-boolean v13, v13, v11

    if-eqz v13, :cond_1

    .line 320
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get30()[Z

    move-result-object v13

    const/4 v14, 0x0

    aput-boolean v14, v13, v11

    .line 321
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get16()[Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_8

    .line 322
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "IMSI fot slot"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, " now ready, resuming PLMN:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 323
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get16()[Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    aget-object v14, v14, v15

    .line 322
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 323
    const-string/jumbo v14, " with ID:"

    .line 322
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 323
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get29()[I

    move-result-object v14

    aget v14, v14, v11

    .line 322
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 324
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    invoke-static {v13, v11}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap11(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;I)V

    .line 587
    .end local v10    # "simStatus":Ljava/lang/String;
    .end local v11    # "slotId":I
    :cond_1
    :goto_1
    const-string/jumbo v13, "[Receiver]-"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 273
    return-void

    .line 289
    .restart local v10    # "simStatus":Ljava/lang/String;
    .restart local v11    # "slotId":I
    :cond_2
    const-string/jumbo v13, "Null sUiccController"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 290
    return-void

    .line 295
    :cond_3
    const-string/jumbo v13, "Null sIccRecordsInstance"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 296
    return-void

    .line 310
    :cond_4
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get23()I

    move-result v13

    const/4 v14, 0x2

    if-ne v13, v14, :cond_5

    .line 311
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    const/16 v14, 0x64

    invoke-static {v13, v14}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap7(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;I)V

    goto :goto_0

    .line 313
    :cond_5
    const-string/jumbo v13, "Region unknown"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 315
    :cond_6
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get33()I

    move-result v13

    const/4 v14, 0x2

    if-eq v13, v14, :cond_7

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get33()I

    move-result v13

    const/4 v14, 0x3

    if-ne v13, v14, :cond_0

    .line 316
    :cond_7
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    const/16 v14, 0x64

    invoke-static {v13, v14}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap7(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;I)V

    goto/16 :goto_0

    .line 326
    :cond_8
    const-string/jumbo v13, "sNwPlmnStrings is Null"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    goto :goto_1

    .line 330
    :cond_9
    const-string/jumbo v13, "Not major SIM or in maual selection mode"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 331
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get11()[Ljava/lang/String;

    move-result-object v14

    aget-object v14, v14, v11

    invoke-static {v13, v14}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap4(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;Ljava/lang/String;)I

    .line 332
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get30()[Z

    move-result-object v13

    aget-boolean v13, v13, v11

    if-eqz v13, :cond_1

    .line 333
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get30()[Z

    move-result-object v13

    const/4 v14, 0x0

    aput-boolean v14, v13, v11

    .line 334
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "IMSI fot slot"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, " now ready, resuming with ID:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 335
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get29()[I

    move-result-object v14

    aget v14, v14, v11

    .line 334
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 336
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get4()[Lcom/android/internal/telephony/CommandsInterface;

    move-result-object v13

    aget-object v13, v13, v11

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get29()[I

    move-result-object v14

    aget v14, v14, v11

    const/4 v15, 0x0

    invoke-interface {v13, v14, v15}, Lcom/android/internal/telephony/CommandsInterface;->setResumeRegistration(ILandroid/os/Message;)V

    goto/16 :goto_1

    .line 339
    :cond_a
    const-string/jumbo v13, "ABSENT"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_c

    .line 340
    const/4 v13, 0x0

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set4(Ljava/lang/String;)Ljava/lang/String;

    .line 341
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get11()[Ljava/lang/String;

    move-result-object v13

    const-string/jumbo v14, ""

    aput-object v14, v13, v11

    .line 342
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get8()[Z

    move-result-object v13

    const/4 v14, 0x1

    aput-boolean v14, v13, v11

    .line 345
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get30()[Z

    move-result-object v13

    const/4 v14, 0x0

    aput-boolean v14, v13, v11

    .line 346
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get9()[I

    move-result-object v13

    const/4 v14, 0x0

    aput v14, v13, v11

    .line 347
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get14()I

    move-result v13

    if-ne v11, v13, :cond_b

    .line 348
    const-string/jumbo v13, "Major SIM removed, no world phone service"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 349
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap10(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)V

    .line 350
    const/4 v13, 0x0

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set15(I)I

    .line 351
    const/4 v13, 0x1

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set2(I)I

    .line 352
    const/16 v13, -0x63

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set5(I)I

    goto/16 :goto_1

    .line 354
    :cond_b
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "SIM"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, " is not major SIM"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 357
    :cond_c
    const-string/jumbo v13, "READY"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 358
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "reset sIsInvalidSim by solt:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 359
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get13()[Z

    move-result-object v13

    const/4 v14, 0x0

    aput-boolean v14, v13, v11

    goto/16 :goto_1

    .line 361
    .end local v10    # "simStatus":Ljava/lang/String;
    .end local v11    # "slotId":I
    :cond_d
    const-string/jumbo v13, "android.intent.action.SERVICE_STATE"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 362
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v13

    if-eqz v13, :cond_1

    .line 363
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v13

    invoke-static {v13}, Landroid/telephony/ServiceState;->newFromBundle(Landroid/os/Bundle;)Landroid/telephony/ServiceState;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set12(Landroid/telephony/ServiceState;)Landroid/telephony/ServiceState;

    .line 364
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get28()Landroid/telephony/ServiceState;

    move-result-object v13

    if-eqz v13, :cond_10

    .line 365
    const-string/jumbo v13, "slot"

    const/4 v14, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v11

    .line 366
    .restart local v11    # "slotId":I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get28()Landroid/telephony/ServiceState;

    move-result-object v13

    invoke-virtual {v13}, Landroid/telephony/ServiceState;->getOperatorNumeric()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set6(Ljava/lang/String;)Ljava/lang/String;

    .line 367
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get28()Landroid/telephony/ServiceState;

    move-result-object v13

    invoke-virtual {v13}, Landroid/telephony/ServiceState;->getVoiceRegState()I

    move-result v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set16(I)I

    .line 368
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get28()Landroid/telephony/ServiceState;

    move-result-object v13

    invoke-virtual {v13}, Landroid/telephony/ServiceState;->getRilVoiceRegState()I

    move-result v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set11(I)I

    .line 369
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get28()Landroid/telephony/ServiceState;

    move-result-object v13

    invoke-virtual {v13}, Landroid/telephony/ServiceState;->getRilVoiceRadioTechnology()I

    move-result v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set10(I)I

    .line 370
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get28()Landroid/telephony/ServiceState;

    move-result-object v13

    invoke-virtual {v13}, Landroid/telephony/ServiceState;->getDataRegState()I

    move-result v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set1(I)I

    .line 371
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get28()Landroid/telephony/ServiceState;

    move-result-object v13

    invoke-virtual {v13}, Landroid/telephony/ServiceState;->getRilDataRegState()I

    move-result v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set9(I)I

    .line 372
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get28()Landroid/telephony/ServiceState;

    move-result-object v13

    invoke-virtual {v13}, Landroid/telephony/ServiceState;->getRilDataRadioTechnology()I

    move-result v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set8(I)I

    .line 373
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "slotId: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, ", "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get9()[I

    move-result-object v14

    aget v14, v14, v11

    invoke-static {v14}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->iccCardTypeToString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 374
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "sMajorSim: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get14()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 375
    invoke-static {}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->getActiveModemType()I

    move-result v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->modemToString(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 376
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "sPlmnSs: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get17()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 377
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "sVoiceRegState: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get34()I

    move-result v14

    invoke-static {v14}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->stateToString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 378
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "sRilVoiceRegState: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get27()I

    move-result v14

    invoke-static {v14}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->regStateToString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 379
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "sRilVoiceRadioTech: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get28()Landroid/telephony/ServiceState;

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get26()I

    move-result v14

    invoke-static {v14}, Landroid/telephony/ServiceState;->rilRadioTechnologyToString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 380
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "sDataRegState: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get5()I

    move-result v14

    invoke-static {v14}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->stateToString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 381
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "sRilDataRegState: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get25()I

    move-result v14

    invoke-static {v14}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->regStateToString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 382
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "sRilDataRadioTech: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get28()Landroid/telephony/ServiceState;

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get24()I

    move-result v14

    invoke-static {v14}, Landroid/telephony/ServiceState;->rilRadioTechnologyToString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 383
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "sIsAutoSelectEnable: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get12()Z

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 384
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "sRadioTechModeForWp: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get22()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 388
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get14()I

    move-result v13

    if-ne v11, v13, :cond_1

    .line 389
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get12()Z

    move-result v13

    if-eqz v13, :cond_f

    .line 390
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap1(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)Z

    move-result v13

    if-eqz v13, :cond_e

    .line 391
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap5(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)V

    goto/16 :goto_1

    .line 392
    :cond_e
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap0(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 393
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get17()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set4(Ljava/lang/String;)Ljava/lang/String;

    .line 394
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap10(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)V

    .line 395
    const-string/jumbo v13, "reset sIsInvalidSim"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 396
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get13()[Z

    move-result-object v13

    const/4 v14, 0x0

    aput-boolean v14, v13, v11

    goto/16 :goto_1

    .line 399
    :cond_f
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap0(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 400
    const-string/jumbo v13, "reset sIsInvalidSim in manual mode"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 401
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get17()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set4(Ljava/lang/String;)Ljava/lang/String;

    .line 402
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get13()[Z

    move-result-object v13

    const/4 v14, 0x0

    aput-boolean v14, v13, v11

    goto/16 :goto_1

    .line 407
    .end local v11    # "slotId":I
    :cond_10
    const-string/jumbo v13, "Null sServiceState"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 410
    :cond_11
    const-string/jumbo v13, "android.intent.action.ACTION_SHUTDOWN_IPO"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_17

    .line 412
    const/4 v2, 0x0

    .line 413
    .local v2, "ci":Lcom/android/internal/telephony/CommandsInterface;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->isCdmaLteDcSupport()Z

    move-result v13

    if-nez v13, :cond_12

    .line 414
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get4()[Lcom/android/internal/telephony/CommandsInterface;

    move-result-object v13

    const/4 v14, 0x0

    aget-object v2, v13, v14

    .line 418
    .local v2, "ci":Lcom/android/internal/telephony/CommandsInterface;
    :goto_2
    if-nez v2, :cond_13

    .line 419
    const-string/jumbo v13, "SHUTDOWN_IPO getActiveCi fail, switch not executed!"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 420
    return-void

    .line 416
    .local v2, "ci":Lcom/android/internal/telephony/CommandsInterface;
    :cond_12
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    const/4 v14, 0x0

    invoke-static {v13, v14}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap2(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;I)Lcom/android/internal/telephony/CommandsInterface;

    move-result-object v2

    .local v2, "ci":Lcom/android/internal/telephony/CommandsInterface;
    goto :goto_2

    .line 424
    :cond_13
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get6()I

    move-result v13

    const/16 v14, 0x64

    if-ne v13, v14, :cond_15

    .line 425
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->isLteSupport()Z

    move-result v13

    if-eqz v13, :cond_14

    .line 426
    const/4 v13, 0x5

    invoke-static {v2, v13}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->reloadModem(Lcom/android/internal/telephony/CommandsInterface;I)V

    .line 429
    const-string/jumbo v13, "Reload to FDD CSFB modem"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 431
    :cond_14
    const/4 v13, 0x3

    invoke-static {v2, v13}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->reloadModem(Lcom/android/internal/telephony/CommandsInterface;I)V

    .line 434
    const-string/jumbo v13, "Reload to WG modem"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 436
    :cond_15
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get6()I

    move-result v13

    const/16 v14, 0x65

    if-ne v13, v14, :cond_1

    .line 437
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->isLteSupport()Z

    move-result v13

    if-eqz v13, :cond_16

    .line 438
    const/4 v13, 0x6

    invoke-static {v2, v13}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->reloadModem(Lcom/android/internal/telephony/CommandsInterface;I)V

    .line 441
    const-string/jumbo v13, "Reload to TDD CSFB modem"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 443
    :cond_16
    const/4 v13, 0x4

    invoke-static {v2, v13}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->reloadModem(Lcom/android/internal/telephony/CommandsInterface;I)V

    .line 446
    const-string/jumbo v13, "Reload to TG modem"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 449
    .end local v2    # "ci":Lcom/android/internal/telephony/CommandsInterface;
    :cond_17
    const-string/jumbo v13, "android.intent.action.ACTION_ADB_SWITCH_MODEM"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1a

    .line 451
    const-string/jumbo v13, "mdType"

    const/4 v14, 0x0

    .line 450
    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v12

    .line 452
    .local v12, "toModem":I
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "toModem: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 453
    const/4 v13, 0x3

    if-eq v12, v13, :cond_18

    .line 454
    const/4 v13, 0x4

    if-ne v12, v13, :cond_19

    .line 457
    :cond_18
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    const/4 v14, 0x0

    invoke-virtual {v13, v14, v12}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->setModemSelectionMode(II)V

    goto/16 :goto_1

    .line 455
    :cond_19
    const/4 v13, 0x5

    if-eq v12, v13, :cond_18

    .line 456
    const/4 v13, 0x6

    if-eq v12, v13, :cond_18

    .line 459
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    const/4 v14, 0x1

    invoke-virtual {v13, v14, v12}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->setModemSelectionMode(II)V

    goto/16 :goto_1

    .line 461
    .end local v12    # "toModem":I
    :cond_1a
    const-string/jumbo v13, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1c

    .line 462
    const-string/jumbo v13, "state"

    const/4 v14, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v13

    if-nez v13, :cond_1b

    .line 463
    const-string/jumbo v13, "Leave flight mode"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 464
    const/4 v13, 0x0

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set4(Ljava/lang/String;)Ljava/lang/String;

    .line 465
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_3
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get1()I

    move-result v13

    if-ge v7, v13, :cond_1

    .line 466
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get13()[Z

    move-result-object v13

    const/4 v14, 0x0

    aput-boolean v14, v13, v7

    .line 465
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 469
    .end local v7    # "i":I
    :cond_1b
    const-string/jumbo v13, "Enter flight mode"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 470
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_4
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get1()I

    move-result v13

    if-ge v7, v13, :cond_1

    .line 471
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get8()[Z

    move-result-object v13

    const/4 v14, 0x1

    aput-boolean v14, v13, v7

    .line 470
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 474
    .end local v7    # "i":I
    :cond_1c
    const-string/jumbo v13, "android.intent.action.ACTION_SET_RADIO_CAPABILITY_DONE"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1d

    .line 476
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->getMajorSim()I

    move-result v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set5(I)I

    .line 478
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap6(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)V

    goto/16 :goto_1

    .line 479
    :cond_1d
    const-string/jumbo v13, "com.mediatek.phone.ACTION_SET_RADIO_TECHNOLOGY_START"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1f

    .line 480
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->isCdmaLteDcSupport()Z

    move-result v13

    if-eqz v13, :cond_1e

    .line 481
    const/4 v13, 0x0

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set7(I)I

    goto/16 :goto_1

    .line 483
    :cond_1e
    const/4 v13, 0x1

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set7(I)I

    goto/16 :goto_1

    .line 485
    :cond_1f
    const-string/jumbo v13, "com.mediatek.phone.ACTION_SET_RADIO_TECHNOLOGY_DONE"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_20

    .line 505
    const/4 v13, 0x1

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set7(I)I

    goto/16 :goto_1

    .line 507
    :cond_20
    const-string/jumbo v13, "android.intent.action.ACTION_TEST_WORLDPHOE"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_29

    .line 508
    const-string/jumbo v13, "FAKE_USER_TYPE"

    const/4 v14, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 509
    .local v5, "fakeUserType":I
    const-string/jumbo v13, "EXTRA_FAKE_REGION"

    const/4 v14, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 510
    .local v4, "fakeRegion":I
    const/4 v6, 0x0

    .line 512
    .local v6, "hasChanged":Z
    if-nez v5, :cond_21

    if-nez v4, :cond_21

    .line 513
    const-string/jumbo v13, "Leave ADB Test mode"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 515
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get18()Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/ArrayList;->clear()V

    .line 516
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get19()Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/ArrayList;->clear()V

    .line 517
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get20()Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/ArrayList;->clear()V

    .line 518
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get15()Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/ArrayList;->clear()V

    .line 519
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap8()V

    goto/16 :goto_1

    .line 521
    :cond_21
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->getMajorSim()I

    move-result v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set5(I)I

    .line 522
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get14()I

    move-result v13

    const/16 v14, -0x63

    if-eq v13, v14, :cond_28

    .line 523
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get14()I

    move-result v13

    const/4 v14, -0x1

    if-eq v13, v14, :cond_28

    .line 525
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get11()[Ljava/lang/String;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get14()I

    move-result v14

    aget-object v8, v13, v14

    .line 526
    .local v8, "imsi":Ljava/lang/String;
    if-eqz v8, :cond_22

    const-string/jumbo v13, ""

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_24

    .line 543
    :cond_22
    const-string/jumbo v13, "Imsi of sMajorSim is unknown"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 546
    :goto_5
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get16()[Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    aget-object v3, v13, v14

    .line 547
    .local v3, "currentMcc":Ljava/lang/String;
    if-eqz v3, :cond_23

    const-string/jumbo v13, ""

    invoke-virtual {v3, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_23

    .line 548
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v13

    const/4 v14, 0x5

    if-ge v13, v14, :cond_25

    .line 549
    :cond_23
    const-string/jumbo v13, "Invalid sNwPlmnStrings"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 566
    .end local v3    # "currentMcc":Ljava/lang/String;
    .end local v8    # "imsi":Ljava/lang/String;
    :goto_6
    if-eqz v6, :cond_1

    .line 567
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "sPlmnType1:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get18()Ljava/util/ArrayList;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 568
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "sPlmnType1Ext:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get19()Ljava/util/ArrayList;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 569
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "sPlmnType3:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get20()Ljava/util/ArrayList;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 570
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "sMccDomestic:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get15()Ljava/util/ArrayList;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 571
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    invoke-virtual {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleRadioTechModeSwitch()V

    goto/16 :goto_1

    .line 527
    .restart local v8    # "imsi":Ljava/lang/String;
    :cond_24
    const/4 v13, 0x0

    const/4 v14, 0x5

    invoke-virtual {v8, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 528
    packed-switch v5, :pswitch_data_0

    .line 540
    :pswitch_0
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Unknown fakeUserType:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 530
    :pswitch_1
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get18()Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 531
    const/4 v6, 0x1

    .line 532
    goto/16 :goto_5

    .line 535
    :pswitch_2
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get20()Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 536
    const/4 v6, 0x1

    .line 537
    goto/16 :goto_5

    .line 551
    .restart local v3    # "currentMcc":Ljava/lang/String;
    :cond_25
    const/4 v13, 0x0

    const/4 v14, 0x3

    invoke-virtual {v3, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 552
    const/4 v13, 0x1

    if-ne v4, v13, :cond_26

    .line 553
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get15()Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 554
    const/4 v6, 0x1

    goto/16 :goto_6

    .line 555
    :cond_26
    const/4 v13, 0x2

    if-ne v4, v13, :cond_27

    .line 556
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-get15()Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 557
    const/4 v6, 0x1

    goto/16 :goto_6

    .line 559
    :cond_27
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Unknown fakeRegion:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    goto/16 :goto_6

    .line 563
    .end local v3    # "currentMcc":Ljava/lang/String;
    .end local v8    # "imsi":Ljava/lang/String;
    :cond_28
    const-string/jumbo v13, "sMajorSim is Unknown or Capability OFF"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    goto/16 :goto_6

    .line 575
    .end local v4    # "fakeRegion":I
    .end local v5    # "fakeUserType":I
    .end local v6    # "hasChanged":Z
    :cond_29
    const-string/jumbo v13, "android.bluetooth.sap.profile.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 576
    const-string/jumbo v13, "android.bluetooth.profile.extra.STATE"

    const/4 v14, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    .line 577
    .local v9, "sapState":I
    const/4 v13, 0x2

    if-ne v9, v13, :cond_2a

    .line 578
    const-string/jumbo v13, "BT_SAP connection state is CONNECTED"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 579
    const/4 v13, 0x1

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set0(I)I

    goto/16 :goto_1

    .line 580
    :cond_2a
    if-nez v9, :cond_2b

    .line 581
    const-string/jumbo v13, "BT_SAP connection state is DISCONNECTED"

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    .line 582
    const/4 v13, 0x0

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-set0(I)I

    goto/16 :goto_1

    .line 584
    :cond_2b
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "BT_SAP connection state is "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->-wrap9(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 528
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
