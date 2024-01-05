Instance: UpdateMetadata
InstanceOf: OperationDefinition
Usage: #example
Title: "update-metadata"
* insert Meta-Inst
* url = "https://gematik.de/fhir/isik/v3/Dokumentenaustausch/OperationDefinition/UpdateMetadata"
* title = "Update document metadata"
//* status = #draft
* kind = #operation
* name = "update-metadata"
* description = "Update selected, uncritical document metadata in a safe and controlled manner without having to replace the whole document"
* code = #update-metadata
* comment = "
    Expected behaviour:
* Servers SHALL update the DocumentReference.docStatus with the submitted values
* Servers SHALL ensure that DocumentReference.text reflects this change
"
* resource = #DocumentReference
* system = false
* type = false
* instance = true
//* inputProfile = Canonical(UpdateMetadata)
//* outputProfile = Canonical(SubmitDocumentOutput)
* parameter[+]
  * name = #docStatus
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "new value for element `docStatus`"
  * type = #code
  * binding 
    * strength = #required 
    * valueSet = "http://hl7.org/fhir/ValueSet/composition-status"