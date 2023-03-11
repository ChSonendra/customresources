# Setting up Indy Network From Scratch

## Images
  I am assuming that you have access to indy_node and indy_cli images.

## startEverything.sh 
  this script will bring up 4 node containers and one cli container.

## generateDIDs.sh
 this script will access indy-cli container and generate keys for nodes and trustees.
   
## generateCryptoMaterial.sh
 this script will access indy-cli container and generate cryptomaterial for nodes.

## generateGenesisdata.sh
this script will require IP of your machine and also it will use default ports 9701 9702 9703 9704 9705 9706 9707 9708s for nodes to generate genesisdata

## setupNodes.sh
this script will setup genesis data keys and cryptomaterial that is generated for nodes.

## fireNodes.sh
this script will fire all four Nodes.
