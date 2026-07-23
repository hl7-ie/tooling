// IE Patient Profile – FSH source
// Canonical: https://hl7-ie.github.io/tooling/fhir/StructureDefinition/ie-patient

Profile: IEPatient
Parent: Patient
Id: ie-patient
Title: "IE Patient Profile"
Description: "Baseline Patient profile for HL7 Ireland FHIR R4 implementations. Adds an optional slice for the Irish PPSN identifier."

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice on identifier system"

* identifier contains ppsn 0..1 MS
* identifier[ppsn] ^short = "Irish PPSN"
* identifier[ppsn] ^definition = "The Irish Personal Public Service Number (PPSN)."
* identifier[ppsn].system 1..1
* identifier[ppsn].system = "https://hl7-ie.github.io/tooling/fhir/identifier/ppsn" (exactly)
* identifier[ppsn].value 1..1

* name 1..* MS
* birthDate MS
* gender MS
* address MS
