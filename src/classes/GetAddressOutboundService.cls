/**
 * @author: ercarval
 */
public class GetAddressOutboundService {

    RestProxy proxy;

    public GetAddressOutboundService () {
        proxy = new RestProxy (
            new RestProxy.Configuration ('https://viacep.com.br/ws/'
                                         , 'GET'));
    }

    public ZipCodeAddress getAddressByZipCode ( String zipCode ) {

        String payload = proxy.get (zipCode + '/json/');

        return (ZipCodeAddress) JSON.deserialize ( payload
                , ZipCodeAddress.class );

    }

    //4 injection
    public void setProxy (RestProxy proxy) {
        this.proxy = proxy;
    }
}