public without sharing class opportunityTriggerHandler implements TriggerHandler {
    private boolean triggerIsExecuting;
    private integer triggerSize;
    public opportunityTriggerHelper helper;
    public opportunityTriggerHandler(boolean triggerIsExecuting, integer triggerSize) {
        this.triggerIsExecuting = triggerIsExecuting;
        this.triggerSize = triggerSize;
        this.helper = new opportunityTriggerHelper();
    }
    
    public void afterInsert(List<opportunity> newopportunity, Map<ID, SObject> newopportunityMap) {
      
    }
    public void afterUpdate(List<opportunity> oldopportunity, List<opportunity> newopportunities, Map<ID, SObject> oldopportunityMap, Map<ID, SObject> newopportunityMap) {
        for(opportunity opp : newopportunities){
            if(opp.StageName == 'closed Won'){
                helper.sendSMStoCEO();
            }
        }
    }
    
}