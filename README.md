# UPSAddressValidator
UPS street-level address validation integration with Infor's SyteLine.

## Purpose
Linemaster’s purpose for this customization was to reduce shipping errors that occur before product shipment. We often ran into problems where the customer’s address was never validated which then caused late shipments and frustration. Linemaster decided it would be best to find problems with addresses and validate them immediately before they become an issue at the end of the road.

## What is the Customization?
The customization gives you the ability to validate addresses in Syteline through UPS’s web service. It consists of a global script that is designed to modular and can be used just about any form that has an address. By using the customization you will be able to know if the address is valid, invalid, or ambiguous. The user is also given the option to format the address to UPS standards.
It is important to know that validating addresses with UPS does not increase the speed of delivery. However, having a valid address will reduce errors which could prevent shipment delays.

## How Does the Customization Work?
The core of the customization utilizes UPS’s API for street level validation. By using the Mongoose Framework we are able to use VB.NET as global scripts that make HTTP requests to UPS’s API. The global script handles the request and the response from UPS to validate parameters that have been passed in by the Syteline form.
