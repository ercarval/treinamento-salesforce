/**
 * @author: ercarval
 */
@isTest
private class VisitRepositoryTest {

    @isTest
    public static void findByZipCodeTest () {

        Account account = AccountFixtureFactory.create ('bisso');

        Visita__c visit = VisitFixtureFactory.create(account, '1222343');

        VisitRepository repository = new VisitRepository();

        List<Visita__c> visits = repository.findByZipCode ('122%');

        System.assert ( !visits.isEmpty() );
        System.assertEquals ( visit.Id, visits.get(0).Id );

    }

    @isTest
    public static void notFoundZipCodeTest () {

        Visita__c visit = VisitFixtureFactory.create('2343');

        VisitRepository repository = new VisitRepository();

        List<Visita__c> visits = repository.findByZipCode ('122%');

        System.assert ( visits.isEmpty() );
    }

}