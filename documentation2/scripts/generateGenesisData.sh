echo "changing directory to csv files"
cd ../csvfiles
echo $PWD
echo "copying generator and other csv files fo indyCli for generating genesis transactions"
docker cp create_genesis.py indyCli:/home/indy/
docker cp stewards.csv indyCli:/home/indy/
docker cp trustees.csv indyCli:/home/indy/

echo "generating genesis transactions files"

docker exec -it indyCli bash -c './create_genesis.py --trustees trustees.csv --stewards stewards.csv'
sleep 3

echo "generated..."
echo "again changing the directory back to main folder"
cd ..
echo "Downloading Transactions files to host machine from indyCli container"
sleep 2
docker cp indyCli:/home/indy/domain_transactions_genesis $PWD/genesisfiles
docker cp indyCli:/home/indy/pool_transactions_genesis $PWD/genesisfiles
sleep 1
echo "done"
sleep 2