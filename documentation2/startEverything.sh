echo "Setting up Directories for indy Nodes to collect crypto keys $PWD"
sudo rm -R ${PWD}/keys_nodes/*
mkdir ${PWD}/keys_nodes/node1/
mkdir ${PWD}/keys_nodes/node2/
mkdir ${PWD}/keys_nodes/node3/
mkdir ${PWD}/keys_nodes/node4/

mkdir ${PWD}/keys_nodes/node1/indy
mkdir ${PWD}/keys_nodes/node2/indy
mkdir ${PWD}/keys_nodes/node3/indy
mkdir ${PWD}/keys_nodes/node4/indy

touch ${PWD}/keys_nodes/node1/keys.txt
touch ${PWD}/keys_nodes/node2/keys.txt
touch ${PWD}/keys_nodes/node3/keys.txt
touch ${PWD}/keys_nodes/node4/keys.txt


mkdir ${PWD}/keys_nodes/node1/indy/indyNetwork
mkdir ${PWD}/keys_nodes/node2/indy/indyNetwork
mkdir ${PWD}/keys_nodes/node3/indy/indyNetwork
mkdir ${PWD}/keys_nodes/node4/indy/indyNetwork

mkdir ${PWD}/keys_nodes/node1/indy/indyNetwork/keys/
mkdir ${PWD}/keys_nodes/node2/indy/indyNetwork/keys/
mkdir ${PWD}/keys_nodes/node3/indy/indyNetwork/keys/
mkdir ${PWD}/keys_nodes/node4/indy/indyNetwork/keys/

docker stop $(docker ps -aq)
sleep 5
docker rm $(docker ps -aq)
sleep 5
res=$(docker-compose up -d)
sleep 8

cd $PWD/scripts/
echo "generating DIDs and Keys $PWD"
./generateDIDsandKeys.sh

sleep 40
echo "generating CSV Files"
./generateCSVfiles.sh

sleep 27

echo "generating Genesis Data"
./generateGenesisData.sh

sleep 20
echo "Setting up Nodes"
./setupNodes.sh

sleep 15
echo "Firing Nodes"
./fireNodes.sh

sleep 15