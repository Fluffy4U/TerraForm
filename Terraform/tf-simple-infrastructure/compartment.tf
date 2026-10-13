resource "oci_identity_compartment" "tf-compartment" {
    # Required
    compartment_id = "ocid1.tenancy.oc1..aaaaaaaaro2qfe23v6iwteeefvcogtgoitidvto4hdegg73d2vax4i2g5eza"
    description = "Compartment for Terraform resources."
    name = "PellesHem2"
}