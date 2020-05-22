/**
 * @author: ercarval
 */
@isTest
public class RestProxyTest {

    @isTest
    public static void sendHttpGetTest () {
        String payload = '{"uf":"SP","logradouro":"Rua Uiramiris","localidade":"São José dos Campos","ibge":"3549904","gia":"6452","complemento":"","cep":"12227-660","bairro":"Jardim Uirá"}';

        Test.setMock ( HttpCalloutMock.class, new RestProxyMock(payload) );

        RestProxy proxy = new RestProxy (
            new RestProxy.Configuration ('https://viacep.com.br/ws/'
                                         , 'GET'));

        String response = proxy.get ('12345678/json/');

        System.assertEquals ( payload, response );
    }

    public class RestProxyMock implements HttpCalloutMock {
        String payload;
        public RestProxyMock (String payload) {
            this.payload = payload;
        }

        public HttpResponse respond (HttpRequest request) {
            HttpResponse response = new HttpResponse();
            response.setBody (payload);
            return response;
        }

    }


}