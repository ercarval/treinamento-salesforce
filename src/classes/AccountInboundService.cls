/**
 * @author: ercarval
 */
@RestResource ( urlMapping='/api/account/*')
global class AccountInboundService {

    webservice
    static Customer store (Customer customer) {

        Account account = new Account ( Name = customer.name
                            , BillingStreet = customer.billingAddress );

        new AccountRepository().save (account);

        customer.Id = account.Id;

        return customer;
    }
    /*
    @HttpPost
    global static Account save (Account account) {
        return store(account);
    }
    */
}