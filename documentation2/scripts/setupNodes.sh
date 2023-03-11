echo "changing Directory to genesisFiles"
sleep 1
cd ../genesisfiles
sleep 1
echo "uploading genesis transaction files to all indy Nodes"
docker cp domain_transactions_genesis node1:/var/lib/indy/indyNetwork/
docker cp pool_transactions_genesis node1:/var/lib/indy/indyNetwork/

docker cp domain_transactions_genesis node2:/var/lib/indy/indyNetwork/
docker cp pool_transactions_genesis node2:/var/lib/indy/indyNetwork/

docker cp domain_transactions_genesis node3:/var/lib/indy/indyNetwork/
docker cp pool_transactions_genesis node3:/var/lib/indy/indyNetwork/

docker cp domain_transactions_genesis node4:/var/lib/indy/indyNetwork/
docker cp pool_transactions_genesis node4:/var/lib/indy/indyNetwork/
sleep 2
echo "done"
sleep 2