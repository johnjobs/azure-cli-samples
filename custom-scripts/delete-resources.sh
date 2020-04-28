#!/usr/bin/env bash

az resource delete -g EULogicAppsB2B -n EUB2BKeyVault --resource-type "Microsoft.KeyVault/vaults"
