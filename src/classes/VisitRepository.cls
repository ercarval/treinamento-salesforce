/**
 * @author: ercarval
 */
public class VisitRepository {

    public List<Visita__c> findByZipCode (String zipCode) {
        return [ SELECT Id, Name, Cep__c
                , RecordType.Name, RecordType.DeveloperName 
                FROM Visita__c
                WHERE Cep__c LIKE :zipCode
                LIMIT 100 ];
    } 
 
}