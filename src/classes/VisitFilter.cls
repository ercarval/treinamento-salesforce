/**
 * @author: ercarval
 */
public class VisitFilter {

    public List<Visita__c> filterJustExecutedVisitForAccount (
        List<Visita__c> newVisits
        , Map<Id, Visita__c> oldVisits) {

        List<Visita__c> executedVisits = new List<Visita__c>();

        for ( Visita__c visit : newVisits ) {

            if (visit.Conta__c == null) continue;

            Visita__c oldVisit;

            if (oldVisits != null) {
                oldVisit = oldVisits.get (visit.Id);
            }

            if ( oldVisit == null
                    && visit.Status__c == 'REALIZADA' ) {
                executedVisits.add (visit);
                continue;
            }

            if ( visit.Status__c == 'REALIZADA'
                    && oldVisit.Status__c != visit.Status__c ) {
                executedVisits.add (visit);
            }

        }

        return executedVisits;
    }

}