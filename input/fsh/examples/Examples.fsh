// Synthetic example instances – FSH source

Instance: IEPatientExample
InstanceOf: IEPatient
Title: "IE Patient Example"
Description: "Synthetic patient – Aoife Ní Mhurchadha – used for testing and demonstration."
Usage: #example

* identifier[ppsn].use = #official
* identifier[ppsn].system = "https://hl7-ie.github.io/tooling/fhir/identifier/ppsn"
* identifier[ppsn].value = "1234567TW"
* active = true
* name.use = #official
* name.family = "Ní Mhurchadha"
* name.given = "Aoife"
* telecom[0].system = #phone
* telecom[0].value = "+353 1 555 0100"
* telecom[0].use = #home
* gender = #female
* birthDate = "1985-03-15"
* address.use = #home
* address.line = "12 Baile Átha Cliath Street"
* address.city = "Dublin"
* address.postalCode = "D01 AB12"
* address.country = "IE"

Instance: IEEncounterExample
InstanceOf: Encounter
Title: "IE Encounter Example"
Description: "Synthetic GP encounter for Aoife Ní Mhurchadha."
Usage: #example

* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"
* type = http://snomed.info/sct#11429006 "Consultation"
* subject = Reference(IEPatientExample)
* period.start = "2024-04-10T09:00:00+01:00"
* period.end = "2024-04-10T09:20:00+01:00"

Instance: IEObservationExample
InstanceOf: Observation
Title: "IE Observation Example"
Description: "Synthetic body temperature vital sign for Aoife Ní Mhurchadha."
Usage: #example

* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code = http://loinc.org#8310-5 "Body temperature"
* subject = Reference(IEPatientExample)
* encounter = Reference(IEEncounterExample)
* effectiveDateTime = "2024-04-10T09:05:00+01:00"
* valueQuantity.value = 38.5
* valueQuantity.unit = "°C"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #Cel
