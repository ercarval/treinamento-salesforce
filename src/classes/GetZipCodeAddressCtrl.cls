
public class GetZipCodeAddressCtrl {

    @AuraEnabled
    public static ZipCodeAddress findAddressByZipCode (String zipCode) {
        return new GetAddressOutboundService().getAddressByZipCode(zipCode);
    }

}