* @ValidationCode : MjotMjAwODQzMzAyMTpDcDEyNTI6MTUxMTI3MjYwMTk5Mjp4cjQ5dDotMTotMTowOjA6ZmFsc2U6Ti9BOlIxN19BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 21 Nov 2017 14:56:41
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : xr49t
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R17_AMR.0

$PACKAGE BIL.UserCreation

SUBROUTINE BIL.VAL.USER.CREATION
*-----------------------------------------------------------------------------
* Attached to USER,BIL.NEW Version to restrict user access based on user sms
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------------------------------------------------
    $USING EB.SystemTables
    $USING EB.Security
    $USING EB.ErrorProcessing
    
    R.NewUserApp = EB.SystemTables.getRNew(EB.Security.User.UseApplication)
    ApplVal = "@BIL.DEVELOPER"
    
    IF NOT(R.NewUserApp<1,1>) THEN
        EB.SystemTables.setRNew(EB.Security.User.UseApplication,ApplVal)
    END

    R.NewUserApp = EB.SystemTables.getRNew(EB.Security.User.UseApplication)
    
    IF R.NewUserApp<1,1> NE "@BIL.DEVELOPER" THEN
        SAVE.AF = EB.SystemTables.getAf()
        EB.SystemTables.setAf(EB.Security.User.UseApplication)
*        test1 = EB.SystemTables.getAf()
        EB.SystemTables.setEtext("First multi value must be set with User SMS Profile @BIL.DEVELOPER")
        EB.ErrorProcessing.StoreEndError()
*        EB.SystemTables.setAf(SAVE.AF)
*        test2 = EB.SystemTables.getAf()
        RETURN
    END

RETURN

END
