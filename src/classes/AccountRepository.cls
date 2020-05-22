/**
 * @author: ercarval
 */
public class AccountRepository {

    public List<Account> save (List<Account> accounts) {
        update accounts;
        return accounts;
    }

    public Account save (Account account) {
        if (account.Id == null) {
            insert account;
        } else {
            update account;
        }

        return account;
    }

}