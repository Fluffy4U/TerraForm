resource "oci_core_instance" "ubuntu_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = oci_identity_compartment.tf-compartment.id
    shape = "VM.Standard.A1.Flex"
    shape_config {
        ocpus = "1"
        memory_in_gbs = "6"
    }
    source_details {
        source_id = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaaadazle32svd6dhz4ano5iqxh22bqoy3c6gaodvhg7x7iaq23yxnq"
        source_type = "image"
    }

    # Optional
    display_name = "PelleInstance"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = oci_core_subnet.vcn-public-subnet.id
    }
    metadata = {
        ssh_authorized_keys = file("C:/Users/melin/.ssh/pellbossh.pub")
    } 
    preserve_boot_volume = false
}