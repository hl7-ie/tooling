// IE PPSN Extension – FSH source
// Canonical: https://hl7-ie.github.io/tooling/fhir/StructureDefinition/ie-ppsn-extension

Extension: IEPPSNExtension
Id: ie-ppsn-extension
Title: "IE PPSN Extension"
Description: "Extension to carry the Irish Personal Public Service Number (PPSN) on a Patient resource."
Context: Patient

* value[x] only Identifier
* value[x] 1..1
* value[x] ^short = "PPSN Identifier"
