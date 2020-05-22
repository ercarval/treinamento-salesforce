import { LightningElement, track } from 'lwc';
 
export default class Adress extends LightningElement {

    @track address;

    constructor () {
        super();
        this.address =  { zipCode : '12222660'
            , street : 'Rua XXXXXX'
            , city : ''
            , state : 'RJ'
            , country : ''
        };
    }

    handleChangedAddress (event) {
        this.address = {...event.detail.address};
        console.log( JSON.stringify(this.address) );
    }


}