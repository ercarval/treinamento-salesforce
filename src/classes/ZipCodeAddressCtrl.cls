public with sharing class ZipCodeAddressCtrl {

    public Account account {get; set;}

    GetAddressOutboundService service;

    public ZipCodeAddressCtrl () {
        service = new GetAddressOutboundService();
    }

    public ZipCodeAddressCtrl ( ApexPages.StandardController standardController ) {
        this();
        this.account = (Account) standardController.getRecord();
    }

    public void loadZipCode () {

        ZipCodeAddress address = service
                                 .getAddressByZipCode (account.billingPostalCode);

        account.billingStreet = address.logradouro;
        account.billingCity = address.localidade;
        account.billingState = address.uf;

    }

}