import { LightningElement } from 'lwc';
 
export default class ConsoleComponent extends LightningElement {

    handleChange (event) {
        console.log(event.target);
        console.log(event.detail);
    }

}