
Profile: ISiKDokumentenSuchergebnisse
Parent: Bundle
Id: ISiKDokumentenSuchergebnisse
Title: "Suchergebnisse einer Dokumentensuche"
* type = #searchset (exactly)
* total 1..
* entry ^slicing.discriminator[0].type = #profile
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.rules = #open
* entry.fullUrl 1..
* entry contains DocumentReference 0..*
* entry[DocumentReference] ^short = "DocumentReference"
* entry[DocumentReference].resource 1..
* entry[DocumentReference].resource only ISiKDokumentenMetadaten

Profile: ISiKStrukturiertesDokumentBundle
Parent: Bundle
Id: ISiKStrukturiertesDokumentBundle
Title: "ISiKStrukturiertesDokumentBundle"
Description: "A document style representation of the receipt (complete, self-contained, signed)"
* insert Meta
* obeys ISiK-docBundle-1
* type = #document (exactly)
* type MS
* timestamp 1.. MS
* identifier 1.. MS
* entry MS
  * fullUrl 1..1 MS
  * resource 1..1 MS
  * search 0..0
  * request 0..0
  * response 0..0
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "resource.type.coding.code"
  * ^slicing.rules = #open
* entry contains Composition 1..1 MS
* entry[Composition].resource only ISiKBerichtSubSysteme

Invariant: ISiK-docBundle-1
Description: "All referenced Resources must be contained in the Bundle"
Severity: #error
Expression: "Bundle.entry.descendants().reference.distinct().subsetOf(%context.entry.fullUrl)"

/* Profile: ISiKDokumentenBereitstellung
Parent: Bundle
Id: ISiKDokumentenBereitstellung
Title: "Bereitstellung von Dokumenten"
* type = #transaction
* entry MS
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.description = "Slicing based on the profile conformance of the entry"
* entry ^slicing.rules = #closed
* entry.resource MS
* entry contains
    DocumentReference 1..* and
    Binary 1..* and
    Patient 0..1
* entry[DocumentReference] ^short = "Die Dokumentenmetadaten"
* entry[DocumentReference] ^definition = "Metadaten des Dokumentes als DocumentReference-Ressource"
* entry[DocumentReference].resource 1..
* entry[DocumentReference].resource only ISiKDokumentenMetadaten
* entry[DocumentReference].request 1..
* entry[DocumentReference].request.method = #POST
* entry[Binary] ^short = "Das Dokument (PDF/Doc/JPEG/TIFF...)"
* entry[Binary] ^definition = "Base64-codierte Repäsentation des Dokumentes"
* entry[Binary].resource 1..
* entry[Binary].resource only ISiKBinary
* entry[Binary].request 1..
* entry[Binary].request.method = #POST
* entry[Patient] ^short = "der Patient"
* entry[Patient] ^definition = "Stammdaten des Patienten"
* entry[Patient].resource 1..
* entry[Patient].resource only Patient
// */

Profile: ISiKBinary
Parent: Binary
Id: ISiKBinary
Title: "ISiKBinary"
Description: "Base63-codiertes Dokument"
* contentType 1..1 MS
* data 1..1 MS
