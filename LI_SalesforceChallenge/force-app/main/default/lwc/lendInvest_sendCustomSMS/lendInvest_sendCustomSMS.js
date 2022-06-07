import { LightningElement, api, track } from 'lwc';
import sendSms from '@salesforce/apex/LI_sendCustomSMSController.sendSms';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'; // import toast message event .
export default class LendInvest_sendCustomSMS extends LightningElement {
    @api recordId;
    response;
    msg = '';
    handleClick(event) {
        this.msg  = this.template.querySelector(`[data-id="smsBody"]`).value;
        if(this.msg!=='')
        { 
            sendSms({accId:this.recordId,smsBody:this.msg})
            .then((result) => {
                if(result=='201'){
                    this.response = 'Your text message has been sent successfully!';     
                }else if(result=='Non-Gold'){
                    this.response = 'You can\'t send message to Non-Gold Accounts';        
                }
            })
            .catch((error) => {
                this.response = 'There was some error while sending the message, Please try again!'+error;
            });
        }
        else{
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Message Center',
                    message: 'Enter Message',
                    variant: 'error'
                }),
            );
        }
    }

}