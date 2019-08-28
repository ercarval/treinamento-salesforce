/**
 * @author: ercarval
 */
trigger Visit on Visita__c (before insert, before update, after insert, after update) {
    
    List<Visita__c> newVisits = Trigger.new;

    Map<Id, Visita__c> oldVisits = Trigger.oldMap;

    System.debug( JSON.serialize (newVisits) );

    if ( oldVisits != null ) {
        System.debug( JSON.serialize (oldVisits) );
    }

    if ( Trigger.operationType == TriggerOperation.BEFORE_UPDATE ) {
        System.debug(' Visita__c on BEFORE_UPDATE  ');
    }

    if ( Trigger.operationType == TriggerOperation.BEFORE_INSERT ) {
        System.debug(' Visita__c on BEFORE_INSERT  ');
    }

    if ( Trigger.operationType == TriggerOperation.AFTER_INSERT ) {
        System.debug(' Visita__c on AFTER_INSERT  ');
    }

    if ( Trigger.operationType == TriggerOperation.AFTER_UPDATE ) {
        System.debug(' Visita__c on AFTER_UPDATE  ');
    }

}