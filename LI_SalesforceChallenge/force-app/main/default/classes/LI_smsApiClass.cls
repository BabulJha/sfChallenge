/*
 * ClassName- Twillio SMS Api Class
 * Param - 
 * Returns - Response
 * */

public class LI_smsApiClass {
    //LI_twillioSMSServiceClass.sendSMS();
    @AuraEnabled
     @future (callout=true)
    public static void sendSms(String phNumber,String smsBody){            
        // Just for this test purpose if account doesnt have any mobile number or different then my twilio registered number 
        phNumber ='+91000000000';
       
        //In a production env. below will be saved in named credentials record and then refered in Apex code. 
        String accountSid = 'Xxxxxxxxxxxxxxxxxxxx';        
        String token = '0xxxxxxxxxxxxxxxxxf2';        
        String fromPhNumber = '+17742739126';    // This will be saved in a custom metadata record for production           
        HttpRequest req = new HttpRequest();        
        req.setEndpoint('https://api.twilio.com/2010-04-01/Accounts/'+accountSid+'/SMS/Messages.json');   //Url could be also saved in a custom metadata record for production     
        req.setMethod('POST');        
        String VERSION  = '3.2.0';        
        req.setHeader('X-Twilio-Client', 'salesforce-' + VERSION);        
        req.setHeader('User-Agent', 'twilio-salesforce/' + VERSION);       
        req.setHeader('Accept', 'application/json');        
        req.setHeader('Accept-Charset', 'utf-8');        
        req.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(Blob.valueOf(accountSid+':' +token)));        
        req.setBody('To='+EncodingUtil.urlEncode(phNumber,'UTF-8')+'&From='+EncodingUtil.urlEncode(fromPhNumber,'UTF-8')+'&Body='+smsBody);        
        Http http = new Http();        
        HTTPResponse res = http.send(req);        
        System.debug(res.getBody());        
        if(res.getStatusCode()==201) 
        System.Debug('Message sending Successful');        
        else{            
        System.Debug('Message sending Unsuccessful');
        }
    } 
}