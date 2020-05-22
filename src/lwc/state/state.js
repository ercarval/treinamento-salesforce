import { LightningElement, api, track } from 'lwc';

 
export default class State extends LightningElement {

    @api state;

    @track _state;

    @api required;
    @api label;
    @api disabled;

    connectedCallback () {
        this._state = this.state || '';
    }
    
    states = [
        {value: 'SP', label: 'São Paulo'},
        {value: 'RJ', label: 'Rio de Janeiro'},
    ];

    handleChange(event) {
        this._state = event.target.value;
        this.dispatchChange ();
    }

    dispatchChange () {
        
        const changeEvent = new CustomEvent('changestate', {
            detail: { state : this._state }
        });

        this.dispatchEvent(changeEvent);

    }

}