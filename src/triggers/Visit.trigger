/**
 * @author: ercarval
 */
trigger Visit on Visita__c (before insert, before update, after insert, after update) {
    
    new VisitTH().run();

}