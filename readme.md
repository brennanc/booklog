# Vanilla JavaScript App


[Azure Static Web Apps](https://docs.microsoft.com/azure/static-web-apps/overview) allows you to easily build JavaScript apps in minutes. Use this repo with the [quickstart](https://docs.microsoft.com/azure/static-web-apps/getting-started?tabs=vanilla-javascript) to build and customize a new static site.

This repo is used as a starter for a _very basic_ HTML web application using no front-end frameworks.

[Azure Static Web App CLI](https://github.com/Azure/static-web-apps-cli)<br>
`npm install -g @azure/static-web-apps-cli`

[Azure Functions Core Tools](https://github.com/Azure/azure-functions-core-tools)<br>
`npm i -g azure-functions-core-tools@4 --unsafe-perm true`


[Adding an API that uses Table Storage](https://dev.to/azure/giving-todo-mvc-the-api-it-deserves-part-1-todo-creation-19h4)

Create the function API<br>
`func new api`

Add Table Storage support to the function<br>
`func extensions install`

In the extensions.csproj file we need to add the following line to the ItemGroup list:<br>
`<PackageReference Include="Microsoft.Azure.WebJobs.Extensions.Storage" Version="3.0.4" />`

We need to run `func extensions install` again to install any dependencies for this particular extension.

Learned that built-in API's for static web apps do not support managed service identity, which is desired to integrate with Table Storage. With the built-in API's for static web apps, could not find a way to not have to embed the storage account key into the `local.settings.json` file.

Provisioned a F1 tier function app and enabled managed service identity. Then went to the storage account and granted access to the new function app's managed service identity with a Table Storage Contributor role (read, update, delete).