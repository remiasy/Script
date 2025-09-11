script_key="hTbycokfuDERQISLDhUSPOwpILHiaiYj";
getgenv().Configs = {
    -- แจ้งเตือน ( Notify )
    WebhookUrl = "https://discord.com/api/webhooks/1414198925853724762/fFfEdaR23BiZo2f-LoC636BZP7Ft0FjTtujZiLrDoTqXDwE5FGx7pjMSxYM5L30k-f3z", -- ลิ้ง Webhook Discord
    WebhookOneTime = false, -- ถ้าเป็น true จะแจ้งเฉพาะตอน Diamond ถึงที่กำหนด
    DisableLogRAM = true, -- ปิด Log ของ Account Manager

    -- การฟาร์ม ( Farm )
    LimitDiamond = 0, -- จำกัด Diamond ถ้าถึงกำหนดจะหยุดฟาร์ม / ถ้าเป็น 0 คือฟาร์มเรื่อยๆ
    ServerTimeout = 10, -- กำหนดการหมดเวลายืนในเซิร์ฟ X วิให้ย้าย (ไม่จำเป็นมากเอาไว้กันบัคเท่านั้น)
    ServerFindRange = 1, -- กำหนดจำนวนเซิร์ฟที่จะหาก่อนย้ายไปยังเซิร์ฟที่หาเจอ
    AutoStronghold = true, -- ออโต้สตรองโฮลด์
    MaxStrongholdLevel = 4, -- ระดับสูงสุดของสตรองโฮลด์
    StrongholdFarmTime = 400, -- เวลาฟาร์มในสตรองโฮลด์

    -- คลาส ( Class )
    BuyClass = {"None"}, -- ชื้อคลาส
    DoFirstTimeReroll = false, -- รีร้านคลาสครั้งแรกฟรี ถ้าไม่มีคลาสที่ต้องการขาย
    AutoEquipClass = "", -- เลือกใส่ Class
    UpgradeClass = false, -- อัพเวลคลาสอัตโนมัติ (ไม่ได้ทำเควส แค่อัพเวลตอนมันพร้อมเท่านั้น)

    -- เพิ่มเติม ( Misc )
    ServerHopProtection = true, -- เอาไว้กัน Ronix ไม่ย้ายเซิฟ

}
getgenv().GoogleSheetLog = {
    -- Google Sheet
    Enable = true, -- เปิดใช้ฟีเจอร์
    WebAppURL = "https://script.google.com/macros/s/AKfycbxW_4f-sfF-R2I1O8Xy1EVFv9mDqZQIHNWWQ_kfVCaiOZkGfQuVLV6n_2kqs92KB-hk/exec" -- ใส่ URL ของ Google Apps Script ที่เชื่อมต่อกับ Google Sheets ของคุณ

}
loadstring(game:HttpGet("https://gist.githubusercontent.com/Clehxb/7ea49f500b6e941f7b6332f6879cd059/raw/99NightLoader"))()
