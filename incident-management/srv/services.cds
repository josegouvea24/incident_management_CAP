using { sap.capire.incidents as my } from '../db/schema';

// Service used by support personell, i.e. incident "processors".
service ProcessorService {
    entity Incidents as projection on my.Incidents;

    @readonly
    entity Customers as projection on my.Customers;
}

// Service used by administrators to manage costumer and incident data.
service AdminService {
    entity Incidents as projection on my.Incidents;
    entity Customers as projection on my.Customers;
}

annotate ProcessorService.Incidents with @odata.draft.enabled;
annotate ProcessorService with @(requires: 'support'); //adding CAP role restrictions to service entities
annotate AdminService with @(requires: 'admin');


