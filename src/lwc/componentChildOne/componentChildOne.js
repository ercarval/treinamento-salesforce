import { LightningElement, api } from 'lwc';

import findAddressByZipCode from '@salesforce/apex/GetZipCodeAddressCtrl.findAddressByZipCode';
 
export default class ComponentChildOne extends LightningElement {

    @api zipCode;

    _zipCode;

    @api required;
    @api label;
    @api disabled;
    
    loading = false;

    constructor() {
        super();
        console.log ('Child One Component Constructor');
    }

    connectedCallback () {
        console.log ('Child One Component Connected Callback');
        this._zipCode = this.zipCode || '';
        this.label = this.label || 'zipcode';
        this.required = this.required || false;
        this.disabled = this.disabled || false;
    }

    renderedCallback () {
        console.log ('Child One Component renderedCallback');
    }
    
    handleChange (event) {

        event.target.value = this.format( this.keepOnlyNumeric(event.target.value));

        if (event.target.value && event.target.value.length == 9) {
            this._zipCode = event.target.value;
            this.loading = true;
            findAddressByZipCode( { zipCode : this.keepOnlyNumeric(this._zipCode) } ).then ( (response) => {
            

                let address = { zipCode : response.cep
                    , street : response.logradouro
                    , city : response.localidade
                    , state : response.uf
                    , country : ''
                };

                this.dispatchZipCodeAddress(address);
            }).catch((error) => {
                
                console.log ( JSON.stringify(error));

            }).finally(() => {
                this.loading = false;
            });

            this.dispatchChangedZipCode();
        }

    }

    dispatchChangedZipCode () {

        const searchAddressEvent = new CustomEvent('changezipcode', {
            detail: { zipCode : this._zipCode }
        });

        this.dispatchEvent(searchAddressEvent);

    }

    dispatchZipCodeAddress (zipAddress) {
        const searchAddressEvent = new CustomEvent('addressfound', {
            detail: { address : zipAddress }
        });

        this.dispatchEvent(searchAddressEvent);
    }



    keepOnlyNumeric (text) {
        return text.replace(/[^0-9]/g,"");
    }    

    format(zipCode) {
        if (!zipCode) return ''; 
        return zipCode.replace(/(\d{5})(\d)/,"$1-$2");
    }


}