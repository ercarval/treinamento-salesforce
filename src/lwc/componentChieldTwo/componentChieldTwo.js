import { LightningElement, api, track } from 'lwc';
 
export default class ComponentChieldTwo extends LightningElement {

    @api address;

    @track _address;
    
    renderedCallback () {
        console.log ('Child Two Component renderedCallback');
        
        console.log ('Address ' + JSON.stringify(this.address));
        
    }
    
    connectedCallback () {
        console.log ('Child Two Component Connected Callback');
    }
    

}