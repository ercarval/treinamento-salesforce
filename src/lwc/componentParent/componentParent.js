import { LightningElement, api, track } from 'lwc';
 
export default class ComponentParent extends LightningElement {

    @api address;

    @track _address;

    constructor () {
        super();
        console.log ('Parent Component Constructor');
    }
    
    renderedCallback () {
        console.log ('Parent Component renderedCallback');
    }
    
    connectedCallback () {
        console.log ('Parent Component Connected Callback');
       
        this._address =  Object.assign({}, this.address );
        //JSON.parse(JSON.stringify(this.address));;
    }
    
    handleZipCode (event) {
        this._address.zipCode = event.detail.zipCode;
        console.log ('Parent Component handleZipCode');
        this.dispatchChangedAddress ();
    }

    handleState (event) {
        this._address.state = event.detail.state;       
        console.log ('Parent Component handleState');
        console.log ('New State Value' + this._address.state );
        this.dispatchChangedAddress ();
    }

    handleTexts (event) {
        let field = event.target.name;
        this._address[field] = event.target.value;
        this.dispatchChangedAddress ();
    }

    dispatchChangedAddress () {
        const changeEvent = new CustomEvent('addresschanged', {
            detail: { address : this._address }
        });

        this.dispatchEvent(changeEvent);
    }

    handleAddressFound (event) {
        this._address = {...event.detail.address};
        this.dispatchChangedAddress (); 
        console.log ('Parent Component handleAddressFound');
    }

}