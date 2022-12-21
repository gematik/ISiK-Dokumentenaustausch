Profile: ISiKDokumentenMetadaten
Parent: DocumentReference
Id: ISiKDokumentenMetadaten
Title: "Erforderliche Metadaten für Dokumentenaustausch in ISiK"
* insert Meta
* masterIdentifier 1.. MS
  * ^short = "Versionsspezifische OID des Dokumentes"
  * system 1..1 MS
  * system = "urn:ietf:rfc:3986"
    * ^short = "Namensraum des Identifiers"
    * ^comment = "Fix: `urn:ietf:rfc:3986`"
  * value 1..1 MS
    * ^short = "Wert des Identifiers"
    * ^comment = "OID mit URI-Präfix &quot;urn:oid:&quot;"
* identifier 0..* MS
* identifier ^comment = "Abweichend zu MHD V4.0.1 ist die Angabe eines Identifiers in ISiK nicht erforderlich.
Ein solcher kann bei Bedarf (z.B. zur Weitergabe des Dokumentes per XDS) erzeugt werden.
&#13;[Konsens der Arbeitsgruppe vom 12.11.2021]

Update für Stufe 3:
In MHD 4.2.0 wurde die Verpflichtung zur Angabe eines Identifiers gelockert, das ISiK-Profil ist damit in diesem Punkt wieder kompatibel zu IHE MHD.
"
* status MS
  * ^short = "Status des Dokumentenmetadatensatzes"
  * ^comment = "Der Status des Dokumentes wird in DocumentReference.docStatus gesetzt!"
* docStatus 0..1 MS
  * ^short = "Bearbeitungsstatus des Dokumentes"
  * ^comment = "Abweichend zu MHD V4.0.1 ist die Verwendung von docStatus im ISiK-Kontext erlaubt. Doe Verwendung von docStatus bleibt jedoch optional,
  da nicht alle Dokumentenerzeugende Systeme einen expliziten Freigabe-Workflow haben. Dokumentenserver müssen jedoch in der Lage sein, den Dokumentenstatus
 (sofern vorhanden) zu persistieren, anzuzeigen und zu reproduzieren.
  &#13;[Konsens der Arbeitsgruppe vom 10.12.2021]"
* type 1.. MS
  * ^short = "Dokumententyp"
  * ^comment = "Im ISiK-Kontext ist die Typisierung eines Dokumentes mit Hilfe eines KDL-Codes *und* des IHE-XDS-Type-Codes erforderlich.
  Während ersterer eine feingranulare Dokumentenklassifikation für die gezielte Suche nach medizinischen udn Administrativen Dokumenten ermöglicht,
  ist letzterer für den einrichtungsübergreifenden Dokumentenautausch maßgeblich.
  Der XDS-Type-Code kann mit Hilfe der bereitgestellten [ConceptMaps](https://simplifier.net/kdl/~resources?category=ConceptMap)
  aus dem KDL-Code ermittelt werden. Weitere Typisierungen (z.B. nach SNOMED oder LOINC) sind uneingeschränkt erlaubt.

  [Konsens der Arbeitgruppe vom 18.02.2022]"
* type.coding 1..
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* type.coding contains  KDL 1..1 MS and XDS 0..1 MS
* type.coding[XDS] from http://ihe-d.de/ValueSets/IHEXDStypeCode (required)
  * ^short = "Dokumenttyp gem. IHE-De-Terminologie"
  * ^comment = "Die Übermittlung des XDS-Type-Codes ist im Rahmen der Dokumentenbereitstellung für Clients nicht verpflichtend,
  muss jedoch vom Server bei der Entgegennahme ggf. ergänzt und bei der Dokumentenabfrage zurückgegeben werden. Der XDS-Type-Code kann über die im Rahmen der [KDL-Spezifikation](https://simplifier.net/kdl) publizierten
  [ConceptMaps](https://simplifier.net/kdl/~resources?category=ConceptMap) aus dem KDL-Code ermittelt werden"
* type.coding[KDL] from http://dvmd.de/fhir/ValueSet/kdl (required)
  * ^short = "Dokumenttyp gem. KDL-Terminologie"
  * system 1..1 MS
  * system = "http://dvmd.de/fhir/CodeSystem/kdl"
    * ^short = "Kodiersystem"
    * ^comment = "Fix: &quot;http://dvmd.de/fhir/CodeSystem/kdl&quot;"
  * code 1..1 MS
    * ^short = "Code"
    * ^comment = "Der KDL-Code"
  * display 1..1 MS
    * ^short = "Anzeigetext"
    * ^comment = "Der Anzeigetext zum KDL-Code"
* category 0..1  MS
  * ^short = "Dokumentklasse/-Kategorie"
  * ^comment = "Die Kategorisierung von Dokumenten erfolgt mittels der von IHE Deutschland publizierten XDS-Class-Codes.
  Die übermittlung des XDS-Class-Codes ist im Rahmen der Dokumentenbereitstellung für Clients nicht verpflichtend,
  muss jedoch vom Server bei der Entgegennahme ggf. ergänzt und bei der Dokumentenabfrage zurückgegeben werden.
  Der XDS-Class-Code kann mit Hilfe der bereitgestellten [ConceptMap](https://simplifier.net/kdl/~resources?category=ConceptMap)
  aus dem KDL-Code ermittelt werden."
* category.coding
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category.coding contains XDS 1..1 MS

* category.coding[XDS] from http://ihe-d.de/ValueSets/IHEXDSclassCode (required)
  * system 1..1 MS
    * ^short = "Kodiersystem"
  * code 1..1 MS
    * ^short = "Code"
    * ^comment = "Der XDS-Class-Code"
  * display 1..1 MS
    * ^short = "Anzeigetext"
    * ^comment = "Der Anzeigetext zum XDS-Class-Code"
* subject only Reference(Patient)
* subject 1..1 MS
  * ^short = "Patientenbezug des Dokumentes"
  * ^comment = "Siehe Beschreibung in der [FHIR Kernspezifikation](http://hl7.org/fhir/documentreference-definitions.html#DocumentReference.subject)"
  * reference 1..1 MS
  * reference 1..1 MS
    * ^short = "Absolute oder relative URL des Patienten auf dem Server"
    * ^comment = "Absolute oder relative URL des Patienten auf dem Server"
* date
  * ^comment = "Abweichend zu MHD V4.0.1 ist die Verwendung von date im ISiK-Kontext nicht verpflichtend.
Die Motivation für die verbindliche Verwendung von `date` seitens IHE ist nicht nachvollziehbar.
Ein entsprechender Change Request zur Harmonisierung wurde eingereicht. Das Dokumentendatum wird in attachment.creation gesetzt.

Update für Stufe 3:
In MHD 4.2.0 wurde die Verpflichtung zur Angabe von date gelockert, das ISiK-Profil ist damit in diesem Punkt wieder kompatibel zu IHE MHD.
"
* author MS
  * ^short = "Autor des Dokumentes"
  * ^comment = "In dieser Ausbaustufe ist die Nennung des Namens oder Kürzels des Autors ausreichend.
  Eine darüber hinaus gehende Verlinkung auf einen Pracitioner (auflösbar auf dem Server) ist möglich aber nicht erforderlich."
  * display MS
* custodian ..0
  * ^comment = "Einschränkung der Kardinalität analog MHD V4.0.1"
* description 1..1 MS
  * ^comment = "Genaue menschenlesbare Beschreibung des Dokumentes, z.B. &quot;Lungenfunktionstest vom 18.02.2022&quot;"
* relatesTo MS
* securityLabel 1.. MS
* securityLabel from ISiKConfidentialityCodes (required)
  * ^short = "Vertraulichkeit"
  * ^comment = "Die Bereitstellung des Vertraulichkeitsinformation durch den Ersteller des Dokumentes ist verpflichtend.
Ebenso sind Dokumentenserver verpflichtet, diese Information zu persistieren und bei der Dokumentenabfrage zu reproduzieren.
Die ISiK-Spezifikation trifft jedoch keine Annahmen darüber, wie sich einzelne Vertraulichkeitsstufen auf die Zugriffsberechtigungen
verschiedener benutzer auf ein Dokument auswirken. Im ISiK-Kontext ist die Angabe einer der drei Vertraulichkeitsstufen
N | R | V verpflichtend, jedoch ohne Einschränkung der Verwendung zusätzlicher Vertraulichkeits-Flags.
&#13;

[Konsens der Arbeitsgruppe vom 12.11.2021]"
* content MS
  * ^short = "Beschreibung des Dokumenteninhaltes"
  * attachment MS
    * ^short = "Anhang"
    * contentType 1.. MS
      * ^short = "Mimetype des Dokumentes"
      * ^comment = "Mimetype (Dateityp) des Dokumentes (z.B. &quot;application/pdf&quot;)"
    * language 1.. MS
      * ^short = "Sprache, in der das Dokument verfasst wurde."
      * ^comment = "Kann bei Systemen, die keine Mehrsprachigkeit unterstützen,
      fest auf &quotde&quot; oder &quotde-DE&quot; gesetzt werden."
    * data 0..1 MS
      *  ^short = "Base64-codierte Binärdaten"
      *  ^comment = "Um die Suche nach Dokumenten effizient zu gestalten, dürfen die Dokumente selbst nicht in die DocumentReference eingebettet werden, 
      sondern müssen als separates Datenobjekt referenziert werden. 
      
      Update für Stufe 3:
      Die Ausnahme bildet die Interaktion &quot;Dokumentenbereitstellung&quot;, 
      bei der die Binärdaten des Dokumentes eingebettet in die DocumentReference an den Server übermittelt und dort dann in eine separate 
      Ressource ausgelagert und über Attachment.url referenziert werden."
    * url 0..1 MS
      *  ^short = "Referenz auf Dokument"
      *  ^comment = "Um die Suche nach Dokumenten effizient zu gestalten, dürfen die Dokumente selbst nicht in die DocumentReference eingebettet werden, 
      sondern müssen als separates Datenobjekt referenziert werden. 
      
      Update für Stufe 3:
      Die Ausnahme bildet die Interaktion &quot;Dokumentenbereitstellung&quot;, 
      bei der die Binärdaten des Dokumentes eingebettet in die DocumentReference an den Server übermittelt und dort dann in eine separate 
      Ressource ausgelagert und über Attachment.url referenziert werden." 
    
    * creation 1.. MS
      * ^short = "Dokumentendatum"
      * ^comment = "Es obliegt dem erzeugenden System, zu entscheiden,
      welches Datum als Dokumentendatum geeignet ist, z.B. Datum der Erstellung oder Datum der letzten Änderung"
  * format 1.. MS
  * format from http://ihe-d.de/ValueSets/IHEXDSformatCodeDE (required)
    * ^short = "Format des Dokumentes"
    * ^comment = "Sofern das Dokument nicht auf einem standardisierten,
    strukturierten Austauschformat (z.B. CDA) basiert, für dessen Interpretation ein konkretes Schema herangezogen werden muss,
    genügt die Angabe des Codes
    &quot;urn:ihe:iti:xds:2017:mimeTypeSufficient&quot;"
* context 1.. MS
  * encounter ..1 MS
    * ^comment = "Abweichend zu MHD V4.0.1 ist die Verwendung der Encounter-Referenz im ISiK-Kontext erlaubt.
    Update für Stufe 3: 
    In MHD 4.2.0 wurde das Verbot der Angabe einer Encounter-Referenz gelockert, das ISiK-Profil ist damit in diesem Punkt wieder kompatibel zu IHE MHD.
    "
  * event from http://ihe-d.de/ValueSets/IHEXDSeventCodeList (required)
    * ^comment = "Binding auf IHE-DE Terminologie hinzugefügt"
    * coding 1..1
      * system 1..1
      * code 1..1
//  * period MS
  * facilityType 1.. MS
  * facilityType from http://ihe-d.de/ValueSets/IHEXDShealthcareFacilityTypeCode (required)
    * ^short = "Art der Einrichtung, aus der das Dokument stammt"
    * ^comment = "Kann, sofern keine abweichende Information bekannt ist auf &quot;KHS&quot; gesetzt werden."
  * practiceSetting 1.. MS
  * practiceSetting from http://ihe-d.de/ValueSets/IHEXDSpracticeSettingCode (required)
    * ^comment = "Binding auf IHE-DE Terminologie hinzugefügt"



Instance: dok-beispiel-server
InstanceOf: ISiKDokumentenMetadaten
Usage: #example
Title: "dok-beispiel"
* meta.security = $v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340"
* status = #current
* category = $ihe-de-class#BEF "Befundbericht"
* type.coding[+] = $kdl#PT130102 "Molekularpathologiebefund"
* type.coding[+] = $ihe-de-type#PATH "Pathologiebefundberichte"
* description = "Molekularpathologiebefund vom 31.12.21"
* subject = Reference(PatientinMusterfrau)
* securityLabel = $v3-Confidentiality#N
* content.attachment.contentType = #application/pdf
* content.attachment.url = "https://mein-Dokumentenserver/dokumente/1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340.pdf"
* content.attachment.language = #de
* content.attachment.creation = "2020-12-31T23:50:50-05:00"
* content.format = $ihe-format#urn:ihe:iti:xds:2017:mimeTypeSufficient "mimeType Sufficient"
* context.facilityType = $ihe-de-fac#KHS "Krankenhaus"
* context.practiceSetting = $sct#408467006
* context.encounter = Reference(BeispielBesuch)

Instance: dok-beispiel-client-with-binary-pdf-example-short
InstanceOf: ISiKDokumentenMetadaten
Usage: #example
Title: "dok-beispiel"
Description: ""
* meta.security = $v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340"
* status = #current
* type.coding[+] = $kdl#PT130102 "Molekularpathologiebefund"
* description = "Molekularpathologiebefund vom 31.12.21"
* subject = Reference(PatientinMusterfrau)
* securityLabel = $v3-Confidentiality#N
* content.attachment.contentType = #application/pdf
* content.attachment.data = "JVBERi0xLjUNJeLjz9MNCjEw"
* content.attachment.language = #de
* content.attachment.creation = "2020-12-31T23:50:50-05:00"
* content.format = $ihe-format#urn:ihe:iti:xds:2017:mimeTypeSufficient "mimeType Sufficient"
* context.facilityType = $ihe-de-fac#KHS "Krankenhaus"
* context.practiceSetting = http://ihe-d.de/CodeSystems/AerztlicheFachrichtungen#ALLG
* context.encounter = Reference(BeispielBesuch)

Instance: dok-beispiel-client-with-binary-jpeg-example-short
InstanceOf: ISiKDokumentenMetadaten
Usage: #example
Title: "dok-beispiel"
Description: ""
* meta.security = $v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340"
* status = #current
* type.coding[+] = $kdl#ED020101 "Fotodokumentation Operation"
* description = "Fotodokumentation Operation vom 31.12.21"
* subject = Reference(PatientinMusterfrau)
* securityLabel = $v3-Confidentiality#N
* content.attachment.contentType = #image/jpeg
* content.attachment.data = "4AAQSkZJRgABAQEB"
* content.attachment.language = #de
* content.attachment.creation = "2020-12-31T23:50:50-05:00"
* content.format = $ihe-format#urn:ihe:iti:xds:2017:mimeTypeSufficient "mimeType Sufficient"
* context.facilityType = $ihe-de-fac#KHS "Krankenhaus"
* context.practiceSetting = http://ihe-d.de/CodeSystems/AerztlicheFachrichtungen#ALLG
* context.encounter = Reference(BeispielBesuch)

Instance: dok-beispiel-client-with-binary-jpeg-example
InstanceOf: ISiKDokumentenMetadaten
Usage: #example
Title: "dok-beispiel"
Description: ""
* meta.security = $v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340"
* status = #current
* type.coding[+] = $kdl#ED020101 "Fotodokumentation Operation"
* description = "Fotodokumentation Operation vom 31.12.21"
* subject = Reference(PatientinMusterfrau)
* securityLabel = $v3-Confidentiality#N
* content.attachment.contentType = #image/jpeg
* content.attachment.data = "JVBERi0xLjUNJeLjz9MNCjEwIDAgb2JqDTw8L0xpbmVhcml6ZWQgMS9MIDEzMDA2OC9PIDEyL0UgMTI1NzM1L04gMS9UIDEyOTc2NC9IIFsgNTQ2IDIwNF0+Pg1lbmRvYmoNICAgICAgICAgICAgICAg DQo0MSAwIG9iag08PC9EZWNvZGVQYXJtczw8L0NvbHVtbnMgNS9QcmVkaWN0b3IgMTIPi9GaWx0ZXIvRmxhdGVEZWNvZGUvSURbPDRDRDkwQkY3MkI2NjU5NkVCMEJDQzlBN0ZGNzIwMjE3PjwyOTkwDAzRkY2QTc0OTQ4OEEwNTdBREQzRDdFQTM0Nj5dL0luZGV4WzEwIDU4XS9JbmZvIDkgMCBSL0xlbmd0aCAxMzcvUHJldiAxMjk3NjUvUm9vdCAxMSAwIFIvU2l6ZSA2OC9UeXBlL1hSZWYvV1sxIDMgMV0PnN0cmVhbQ0KaN5iYmRgEGBgYmBgugciGf1AJMNmEMn2H0RyxIJI9slg9k4wuQNMHgCLZ4DJ NLBIJIjkagGbA2abeIDZmiAyvhFsMkic0fApWFwDRPoWgNmhIFIzHMyWBZFWWWD1YSCSyhYXAFsyxUQyXoQSP6XmsbABHT"
* content.attachment.language = #de
* content.attachment.creation = "2020-12-31T23:50:50-05:00"
* content.format = $ihe-format#urn:ihe:iti:xds:2017:mimeTypeSufficient "mimeType Sufficient"
* context.facilityType = $ihe-de-fac#KHS "Krankenhaus"
* context.practiceSetting = http://ihe-d.de/CodeSystems/AerztlicheFachrichtungen#ALLG
* context.encounter = Reference(BeispielBesuch)

Instance: dok-beispiel-client-with-binary-pdf-example
InstanceOf: ISiKDokumentenMetadaten
Usage: #example
Title: "dok-beispiel"
Description: ""
* meta.security = $v3-ActReason#HTEST
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:1.2.840.113556.1.8000.2554.58783.21864.3474.19410.44358.58254.41281.46340"
* status = #current
* type.coding[+] = $kdl#PT130102 "Molekularpathologiebefund"
* description = "Molekularpathologiebefund vom 31.12.21"
* subject = Reference(PatientinMusterfrau)
* securityLabel = $v3-Confidentiality#N
* content.attachment.contentType = #application/pdf
* content.attachment.data = "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"
* content.attachment.language = #de
* content.attachment.creation = "2020-12-31T23:50:50-05:00"
* content.format = $ihe-format#urn:ihe:iti:xds:2017:mimeTypeSufficient "mimeType Sufficient"
* context.facilityType = $ihe-de-fac#KHS "Krankenhaus"
* context.practiceSetting = http://ihe-d.de/CodeSystems/AerztlicheFachrichtungen#ALLG
* context.encounter = Reference(BeispielBesuch)
