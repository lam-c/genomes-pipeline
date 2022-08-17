cwlVersion: v1.2
class: CommandLineTool

hints:
  DockerRequirement:
    dockerPull: debian:stable-slim
  ResourceRequirement:
    coresMin: 1
    ramMin: 1000

baseCommand: [ "mkdir" ]

inputs:
  dirname:
    type: string
    inputBinding:
      position: 1

outputs:
  created_dir:
    type: Directory
    outputBinding:
      glob: $(inputs.dirname)


$namespaces:
 edam: http://edamontology.org/
 s: http://schema.org/
$schemas:
 - http://edamontology.org/EDAM_1.16.owl
 - https://schema.org/version/latest/schemaorg-current-http.rdf

s:license: "https://www.apache.org/licenses/LICENSE-2.0"
s:copyrightHolder: "EMBL - European Bioinformatics Institute"