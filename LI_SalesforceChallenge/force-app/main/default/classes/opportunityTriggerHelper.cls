public without sharing class opportunityTriggerHelper {
    public opportunityTriggerHelper() {
        System.debug('Inside opportunityTriggerHelper Constructor');
    }
    public void sendSMStoCEO() {
        string ceoNumber = [Select id,Phone from user where UserRoleId in (select id from UserRole Where name = 'CEO') LIMIT 1].phone;
         String smsBody = 'Hi Boss, This deal is closed and won now, throw us a party now!';
        LI_smsApiClass.sendSms(ceoNumber,smsBody);
        System.debug('Inside Task 1');
    }
    
}