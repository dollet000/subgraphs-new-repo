-include .env
export


DEPLOY_FLAG := graph deploy --product hosted-service 

DEPLOY_KEY := --deploy-key ${THEGRAPH_ACCESS_TOKEN}
NETWORK_STRATEGY5 := --network mainnet --network-file config/strategy5.json
NETWORK_STRATEGY6 := --network arbitrum-one --network-file config/strategy6.json
NETWORK_STRATEGY7 := --network mainnet --network-file config/strategy7.json

# Regenerate the files if new changed were made
generate:; graph codegen

# Building 
build5:; graph build $(NETWORK_STRATEGY5)
build6:; graph build $(NETWORK_STRATEGY6)
build7:; graph build $(NETWORK_STRATEGY7)

# Deploy to the hosted service
deploy5:; $(DEPLOY_FLAG) dollet000/strategy5 $(NETWORK_STRATEGY5) $(DEPLOY_KEY)
deploy6:; $(DEPLOY_FLAG) dollet000/strategy6 $(NETWORK_STRATEGY6) $(DEPLOY_KEY)
deploy7:; $(DEPLOY_FLAG) dollet000/strategy7 $(NETWORK_STRATEGY7) $(DEPLOY_KEY)