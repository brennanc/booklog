BOOKLOG_GITHUB="https://github.com/brennanc/booklog/src"
LOCATION="centralus"
az account set --subscription "vse - cropdev"
az group create --name booklog-rg --location $LOCATION

# requires --token with Github Personal Token
az staticwebapp create \
	--name booklog-web-app \
	--resource-group booklog-rg \
	--source $BOOKLOG_GITHUB \
	--location $LOCATION \
	--branch main \
	--token $MY_GITHUB_TOKEN

az staticwebapp browse --name booklog-web-app --query "defaultHostname"


# Create storage account for Table Storage
az storage account create \
--name booklogsa \
--resource-group booklog-rg \
--location centralus \
--sku Standard_GRS \
--kind StorageV2

az storage account keys list --account-name booklogsa

export BOOKLOGSA_KEY=""

az storage table create \
--name booklog \
--account-key $BOOKLOGSA_KEY \
--account-name booklogsa


Reader
Author last name
Author first name
Genre
Title
Series title
Number in series
Completed (T/F)