#!/usr/bin/env
cwlVersion: v1.2
class: CommandLineTool

requirements:
  ResourceRequirement:
    coresMax: 1
    ramMin: 1000

inputs:
  source_file:
    type: File
    inputBinding:
      position: 1

  destination_file_name:
    type: string
    inputBinding:
      position: 2

baseCommand: [ cp ]

outputs:
  copied_file:
    type: File
    outputBinding:
      glob: $(inputs.destination_file_name)

$namespaces:
 edam: http://edamontology.org/
 s: http://schema.org/
$schemas:
 - http://edamontology.org/EDAM_1.16.owl
 - https://schema.org/version/latest/schemaorg-current-http.rdf

s:license: "https://www.apache.org/licenses/LICENSE-2.0"
s:copyrightHolder: "EMBL - European Bioinformatics Institute"
