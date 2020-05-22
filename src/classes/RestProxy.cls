/**
 * @author: ercarval
 */
public virtual class RestProxy {

    Configuration config;

    public RestProxy (Configuration config) {
        this.config = config;
    }

    private HttpRequest setup () {

        HttpRequest request = new HttpRequest();
        request.setEndpoint ( config.endpoint );
        request.setMethod ( config.method );

        return request;
    }

    virtual
    public String get ( String path ) {

        HttpRequest request = setup ();
        request.setEndpoint ( request.getEndpoint() + path );

        Http http = new Http();

        HttpResponse response = http.send (request);

        return response.getBody();
    }

    public class Configuration {

        public String endpoint;
        public String method;

        public Configuration (String endpoint, String method) {
            this.endpoint = endpoint;
            this.method = method;
        }

        // poderia ter info de authorization

    }

}