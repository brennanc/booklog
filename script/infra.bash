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



