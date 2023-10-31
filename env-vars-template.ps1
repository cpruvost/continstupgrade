### Authentication details
$env:TF_VAR_tenancy_ocid="ocid1.tenancy.oc1..****************************"
$env:TF_VAR_user_ocid="ocid1.user.oc1..**********************************"
$env:TF_VAR_fingerprint="38:4b:39:f0:03:39:1f:******************"
$env:TF_VAR_private_key_path="C:\Travail\*****\Demos\*****\NewAPIKeys\************.pem"

### Compartment
$env:TF_VAR_compartment_ocid="ocid1.compartment.oc1..*****************************"

### Region
$env:TF_VAR_region="eu-frankfurt-1"

### Network
$env:TF_VAR_private_subnet_ocid="ocid1.subnet.oc1.eu-frankfurt-1.*************************"
$env:TF_VAR_public_subnet_ocid="ocid1.subnet.oc1.eu-frankfurt-1.**************************"

### Availability Domain
$env:TF_VAR_availability_domain="Vihs:EU-FRANKFURT-1-AD-1"

### IMAGE URL and Registry Secret
$env:TF_VAR_ci_image_url="fra.ocir.io/*********/*********:0.0.4-SNAPSHOT"
$env:TF_VAR_ci_image_url_bis="fra.ocir.io/*********/*********:0.0.4-SNAPSHOT"
$env:TF_VAR_ci_registry_secret="ocid1.vaultsecret.oc1.eu-frankfurt-1.****************"

### NUMBER of CI
$env:TF_VAR_ci_count=1
$env:TF_VAR_ci_count_bis=1

# Container ENV variables
$env:TF_VAR_ci_container_env_variables='{ DATABASE_URL = "mysql://username:xyz@ip:port/db-name", DEVELOPMENT_MODE = "on" }'

# DNS Zone Name
$env:TF_VAR_zone_name="test.com"

# API Gateway Name
$env:TF_VAR_gateway_display_name="CI_GATEWAY"

# API Gateway Name
$env:TF_VAR_api_public_subnet_ocid="ocid1.subnet.oc1.eu-frankfurt-1.**************************"

