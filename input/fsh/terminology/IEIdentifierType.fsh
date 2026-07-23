// IE Identifier Type CodeSystem and ValueSet – FSH source

CodeSystem: IEIdentifierType
Id: ie-identifier-type
Title: "IE Identifier Type Code System"
Description: "Codes representing Irish national identifier types used in HL7 Ireland FHIR implementations."

* #PPSN "Personal Public Service Number"
    "The Irish Personal Public Service Number (PPSN), a unique reference number assigned to each Irish citizen and resident."
* #GMS "GMS Number"
    "General Medical Services (GMS) scheme patient number."
* #IEHR "Individual Electronic Health Record Identifier"
    "The unique identifier assigned to an individual's Electronic Health Record in Ireland."
* #CHI "Child Health Identifier"
    "The Child Health Identifier assigned to children in Ireland."

ValueSet: IEIdentifierTypeVS
Id: ie-identifier-type
Title: "IE Identifier Type Value Set"
Description: "Value set of Irish national identifier types for use in HL7 Ireland FHIR resources."

* include codes from system IEIdentifierType
