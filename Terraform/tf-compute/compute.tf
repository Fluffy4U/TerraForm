resource "oci_core_instance" "ubuntu_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = "ocid1.compartment.oc1..aaaaaaaaova3aw76iyrs2534e52c3onu6qowk6asj224bmjpe2m34bccwh5q"
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
        subnet_id = "ocid1.subnet.oc1.eu-amsterdam-1.aaaaaaaaftj2rel6d4cujsbz5jfxier4ho5xcrf7g5na4whn6pufq27bwoya"
    }
    metadata = {
        ssh_authorized_keys = file("C:/Users/melin/.ssh/pellbossh.pub")
    } 
    preserve_boot_volume = false
}