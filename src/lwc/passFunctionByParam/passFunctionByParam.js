import { LightningElement } from 'lwc';
 
export default class PassFunctionByParam extends LightningElement {

    value = 'Hello Parent';

    sayHelloFunction = this.sayHello.bind(this);

    connectedCallback () {
        
    }

    sayHello () {

        console.log ('say hello: ' + this.value);
    }

}