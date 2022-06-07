public class LI_sendCustomSMSController {
 @AuraEnabled
    public static String sendSms(Id accId,String smsBody){ 
        String response = '';
        Account acc = [select id, phone, LI_Customer_Type__c from Account where id =: accId   WITH SECURITY_ENFORCED ];
        if(acc.LI_Customer_Type__c == 'GOLD'){
            response = LI_twillioSMSServiceClass.sendSms(acc.Phone,smsBody);
        }
        else{
            //The account is not GOLD
            response = 'Non-Gold';
        }
        return response;
    }
}