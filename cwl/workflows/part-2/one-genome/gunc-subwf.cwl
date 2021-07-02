#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow

requirements:
  SubworkflowFeatureRequirement: {}
  MultipleInputFeatureRequirement: {}
  InlineJavascriptRequirement: {}
  StepInputExpressionRequirement: {}
  ScatterFeatureRequirement: {}

inputs:
  input_fasta: File
  input_csv: File

outputs:
  complete-flag:
    type: File?
    outputSource: filter/complete
  empty-flag:
    type: File?
    outputSource: filter/empty

steps:
  gunc:
    run: ../../../tools/GUNC/gunc.cwl
    in:
      input_fasta: input_fasta
      outdir_gunc: { default: "gunc_output" }
    out: [ gunc_tsv ]

  filter:
    run: ../../../tools/GUNC/filter_gunc.cwl
    in:
      csv: input_csv
      gunc: gunc/gunc_tsv
    out:
      - complete
      - empty

