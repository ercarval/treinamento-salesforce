import { LightningElement, api } from 'lwc';
 
export default class ReciveFunctionAsApi extends LightningElement {

    @api callback;

    connectedCallback () {
        this.doAction();
    }

    doAction () {
        if (typeof this.callback !== "function") return;
        this.callback();
    }

}