/**
 * @author: ercarval
 */
@isTest
public class AccountFixtureFactory {

    public static Account buildAccount (String name) {
        return new Account ( Name = name );
    }

    public static Account create (String name) {
        return create ( buildAccount (name));
    }

    public static Account create (Account account) {
        insert account;
        return account;
    }

}