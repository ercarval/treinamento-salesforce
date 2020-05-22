/**
 * @author: ercarval
 */
@isTest
public class GetAddressOutboundServiceTest {

    @isTest
    public static void getAddressByZipCodeTest () {

        ZipCodeAddress expected = new ZipCodeAddress();
        expected.cep = '1311313';
        expected.logradouro = 'Rua X';

        GetAddressOutboundService service = new GetAddressOutboundService();
        service.setProxy ( new RestProxyMock( JSON.serialize (expected) ) );

        ZipCodeAddress zipCodeAddress = service.getAddressByZipCode('1311313');

        System.assertEquals (expected.cep, zipCodeAddress.cep);
        System.assertEquals (expected.logradouro, zipCodeAddress.logradouro);

    }

    public class RestProxyMock extends RestProxy {

        String payload;

        public RestProxyMock (String payload) {
            super(new RestProxy.Configuration ('https://viacep.com.br/ws/'
                                               , 'GET'));
            this.payload = payload;
        }

        override
        public String get (String path) {
            return payload;
        }

    }

}