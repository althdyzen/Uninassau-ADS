import { Directive, HostBinding } from "@angular/core";

@Directive({
	selector: "[mudaCor]",
})
export class MudaCorDirective {
	@HostBinding("style.backgroundColor") bgColor = "red";

	constructor() {}

	ngOnInit() {
		console.log("AAAAAAA");
	}
}
