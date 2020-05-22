/**
 * @author: ercarval
 */
@isTest
public class VisitFixtureFactory {

    public static Visita__c buildVisit ( String zipCode ) {

        Visita__c visit = new Visita__c();
        visit.Endereco__c = 'R XXX';
        visit.Bairro__c = 'Bairro YYY';
        visit.Cep__c = zipCode;
        visit.Cidade__c = 'Cidade XXX';
        return visit;
    }

    public static Visita__c buildVisit ( Account account, String zipCode ) {

        Visita__c visit = buildVisit (zipCode);
        visit.Conta__c = account.Id;

        return visit;
    }

    public static Visita__c create ( String zipCode ) {
        return create ( buildVisit(zipCode) );
    }

    public static Visita__c create ( Account account, String zipCode ) {
        return create ( buildVisit(account, zipCode) );
    }

    public static Visita__c create ( Visita__c visit ) {

        insert visit;

        return visit;
    }


}