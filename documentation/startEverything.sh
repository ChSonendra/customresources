
# echo "Setting up Directories for indy Nodes to collect crypto keys"

# rm -R ${PWD}/keys_nodes/*
# mkdir ${PWD}/keys_nodes/node1/
# mkdir ${PWD}/keys_nodes/node2/
# mkdir ${PWD}/keys_nodes/node3/
# mkdir ${PWD}/keys_nodes/node4/

# mkdir ${PWD}/keys_nodes/node1/indy
# mkdir ${PWD}/keys_nodes/node2/indy
# mkdir ${PWD}/keys_nodes/node3/indy
# mkdir ${PWD}/keys_nodes/node4/indy

# mkdir ${PWD}/keys_nodes/node1/indy/indyNetwork
# mkdir ${PWD}/keys_nodes/node2/indy/indyNetwork
# mkdir ${PWD}/keys_nodes/node3/indy/indyNetwork
# mkdir ${PWD}/keys_nodes/node4/indy/indyNetwork

# mkdir ${PWD}/keys_nodes/node1/indy/indyNetwork/keys/
# mkdir ${PWD}/keys_nodes/node2/indy/indyNetwork/keys/
# mkdir ${PWD}/keys_nodes/node3/indy/indyNetwork/keys/
# mkdir ${PWD}/keys_nodes/node4/indy/indyNetwork/keys/

# # ./keysgeneration/generatekeys.sh


# # step1 ----- generating image out of dockerfile for indy node
# echo "step1 ----- generating image out of dockerfile for indy node"
# docker stop $(docker ps -aq)
# sleep 5
# docker rm $(docker ps -aq)
# sleep 5
# docker rmi indy_node:1.0
# sleep 5
# image_builder_logs=$(docker build -t indy_node:1.0 .)
# sleep 5
# echo "STEP 1 LOGS :::::::::::::::::::::: " > logs.txt
# echo "$image_builder_logs" >> logs.txt


# # step2 ----- starting containers for nodes, but not starting nodes
# echo "step2 ----- starting containers for nodes, but not starting nodes"
# docker_compose_logs=$(docker-compose up -d)
# sleep 10
# echo "STEP 2 LOGS :::::::::::::::::::::: " >> logs.txt
# echo "$docker_compose_logs" >> logs.txt


# # step3 ----- Installing indy cli on the machine
# # echo "step3 ----- Installing indy cli on the machine"
# # sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88 && sudo add-apt-repository "deb https://repo.sovrin.org/sdk/deb xenial stable" && sudo apt-get update
# # sleep 10
# # indy_cli_logs=$(sudo apt-get install -y indy-cli)
# # sleep 10
# # echo "STEP 2 LOGS :::::::::::::::::::::: " >> logs.txt
# # echo "$indy_cli_logs" >> logs.txt

# # step4 ----- Installing indy node on the machine
# # echo "waiting last command to get over"
# # sudo apt-get update -y && apt-get install -y \ apt-transport-https \ ca-certificates
# # apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CE7709D068DB5E88
# # bash -c 'echo "deb https://repo.sovrin.org/deb xenial stable" >> /etc/apt/sources.list'
# # sleep 5

# # indy_nodes_logs=$(sudo apt-get update -y && sudo apt-get install -y \ indy-node=1.12.6 \ indy-plenum=1.12.6 \ && rm -rf /var/lib/apt/lists/*)
# # echo "STEP 2 LOGS :::::::::::::::::::::: " >> logs.txt
# # echo "$indy_nodes_logs" >> logs.txt



# # awk '{if (index($1, "NETWORK_NAME") != 0) {print("NETWORK_NAME = \"'$INDY_NETWORK_NAME'\"")} else print($0)}' /etc/indy/indy_config.py> /tmp/indy_config.py
# # mv /tmp/indy_config.py /etc/indy/indy_config.py

# echo "creating keys for nodes 1"

# INDY_NETWORK_NAME="indyNetwork"
# INDY_NODE_NAME="node1"
# INDY_NODE_SEED="00000000000000000000000011111111"

# result=$(init_indy_keys --name $INDY_NODE_NAME --seed $INDY_NODE_SEED)
# echo $result > ${PWD}/keys_nodes/node1/keys.txt
# sleep 3

# cp -R /var/lib/indy/indyNetwork/keys/node1/ ${PWD}/keys_nodes/node1/indy/indyNetwork/keys/
# cp -R /var/lib/indy/indyNetwork/keys/node1C/ ${PWD}/keys_nodes/node1/indy/indyNetwork/keys/

# echo "creating keys for nodes 2"

# INDY_NODE_NAME="node2"
# INDY_NODE_SEED="00000000000000000000000011111112"

# result=$(init_indy_keys --name $INDY_NODE_NAME --seed $INDY_NODE_SEED)
# echo $result > ${PWD}/keys_nodes/node2/keys.txt
# sleep 3

# cp -R /var/lib/indy/indyNetwork/keys/node2/ ${PWD}/keys_nodes/node2/indy/indyNetwork/keys/
# cp -R /var/lib/indy/indyNetwork/keys/node2C/ ${PWD}/keys_nodes/node2/indy/indyNetwork/keys/

# echo "creating keys for nodes 3"

# INDY_NODE_NAME="node3"
# INDY_NODE_SEED="00000000000000000000000011111113"

# result=$(init_indy_keys --name $INDY_NODE_NAME --seed $INDY_NODE_SEED)
# echo $result > ${PWD}/keys_nodes/node3/keys.txt

# sleep 3

# cp -R /var/lib/indy/indyNetwork/keys/node3/ ${PWD}/keys_nodes/node3/indy/indyNetwork/keys/
# cp -R /var/lib/indy/indyNetwork/keys/node3C/ ${PWD}/keys_nodes/node3/indy/indyNetwork/keys/

# echo "creating keys for nodes 4"

# INDY_NODE_NAME="node4"
# INDY_NODE_SEED="00000000000000000000000011111114"


# result=$(init_indy_keys --name $INDY_NODE_NAME --seed $INDY_NODE_SEED)
# echo $result > ${PWD}/keys_nodes/node4/keys.txt

# sleep 3

# cp -R /var/lib/indy/indyNetwork/keys/node4/ ${PWD}/keys_nodes/node4/indy/indyNetwork/keys/
# cp -R /var/lib/indy/indyNetwork/keys/node4C/ ${PWD}/keys_nodes/node4/indy/indyNetwork/keys/


# echo "creating DIDd and VerKeys using indy-cli"

# # Start a new tmux session and window
# tmux new-session -d -s indi
# tmux new-window -t indi:2 -n "indi-cli"

# # Run indi-cli in the new window
# tmux send-keys -t indi:2 "indy-cli" Enter

# # Wait for indi-cli to start
# sleep 2

# # Send commands to indi-cli and save the output to a file
# tmux send-keys -t indi:2 "wallet delete newNetwork key=key" Enter
# sleep 1
# tmux capture-pane -p -t indi:2 -S -1000 > version.txt

# tmux send-keys -t indi:2 "wallet create newNetwork key=key" Enter
# sleep 1
# tmux capture-pane -p -t indi:2 -S -1000 > version.txt


# tmux send-keys -t indi:2 "wallet open newNetwork key=key" Enter
# sleep 1
# tmux capture-pane -p -t indi:2 -S -1000 > version.txt


# tmux send-keys -t indi:2 "did new seed=000000000000000000000000Trustee1" Enter
# sleep 1
# tmux capture-pane -p -t indi:2 -S -1000 > version.txt


# tmux send-keys -t indi:2 "did new seed=000000000000000000000000Trustee2" Enter
# sleep 1
# tmux capture-pane -p -t indi:2 -S -1000 > version.txt



# tmux send-keys -t indi:2 "did new seed=000000000000000000000000Trustee3" Enter
# sleep 1
# tmux capture-pane -p -t indi:2 -S -1000 > version.txt



# tmux send-keys -t indi:2 "did new seed=00000000000000000000000011111111" Enter
# sleep 1
# tmux capture-pane -p -t indi:2 -S -1000 > version.txt

# tmux send-keys -t indi:2 "did new seed=00000000000000000000000011111112" Enter
# sleep 1
# tmux capture-pane -p -t indi:2 -S -1000 > version.txt


# tmux send-keys -t indi:2 "did new seed=00000000000000000000000011111113" Enter
# sleep 1
# tmux capture-pane -p -t indi:2 -S -1000 > version.txt

# tmux send-keys -t indi:2 "did new seed=00000000000000000000000011111114" Enter
# sleep 1
# tmux capture-pane -p -t indi:2 -S -1000 > version.txt

# tmux send-keys -t indi:2 "exit" Enter

# # Kill the tmux session
# tmux kill-session -t indi



# echo "changing Directory to createGenesis"

# cd /home/indy_test/documentation/creategenesis

# echo "Collecting keys for node1"

# node convertkeysdatatojson.js node1 /home/indy_test/documentation/keys_nodes/node1/keys.txt

# sleep 3
# echo "Collecting keys for node2"

# node convertkeysdatatojson.js node2 /home/indy_test/documentation/keys_nodes/node2/keys.txt

# sleep 3
# echo "Collecting keys for node3"

# node convertkeysdatatojson.js node3 /home/indy_test/documentation/keys_nodes/node3/keys.txt

# sleep 3
# echo "Collecting keys for node4"
# node convertkeysdatatojson.js node4 /home/indy_test/documentation/keys_nodes/node4/keys.txt

# sleep 3

# echo "creating csv file"

# node jsontocsv.js
# sleep 2
# node createTrustees.js
# sleep 2

# echo "create GEnesis data"

# ./create_genesis.py --trustees trustees.csv --stewards stewards.csv

# sleep 5

# echo "copying keys and genesis data into node containers"
# ############################################################################################### node 1
# #Start a new tmux session and window
# tmux new-session -d -s node1
# tmux new-window -t node1:1 -n "docker exec -it node1 bash"

# # Wait for node1 terminal
# sleep 5

# # Send commands to indi-cli and save the output to a file
# tmux send-keys -t node1:1 "INDY_NETWORK_NAME=indyNetwork" Enter
# sleep 1
# tmux capture-pane -p -t node1:1 -S -1000 > indy_comm41.txt

# tmux send-keys -t node1:1 "awk '{if (index($1, "NETWORK_NAME") != 0) {print("NETWORK_NAME = \"'$INDY_NETWORK_NAME'\"")} else print($0)}' /etc/indy/indy_config.py> /tmp/indy_config.py" Enter
# sleep 1
# tmux capture-pane -p -t node1:1 -S -1000 > indy_comm1.txt


# tmux send-keys -t node1:1 "mv /tmp/indy_config.py /etc/indy/indy_config.py" Enter
# sleep 1
# tmux capture-pane -p -t node1:1 -S -1000 > indy_comm1.txt

# tmux send-keys -t node1:1 "mkdir /var/lib/indy/indyNetwork" Enter
# sleep 1
# tmux capture-pane -p -t node1:1 -S -1000 > indy_comm1.txt


# tmux send-keys -t node1:1 "exit" Enter

# # Kill the tmux session
# tmux kill-session -t node1

# sleep 5

# echo "Done for node 1"
# ################################################################################################# node 2
# # Start a new tmux session and window
# tmux new-session -d -s node2
# tmux new-window -t node2:1 -n "docker exec -it node2 bash"



# # Wait for node2 terminal
# sleep 8

# # Send commands to indi-cli and save the output to a file
# tmux send-keys -t node2:1 "INDY_NETWORK_NAME=indyNetwork" Enter
# sleep 1
# tmux capture-pane -p -t node2:1 -S -1000 > indy_comm2.txt

# tmux send-keys -t node2:1 "awk '{if (index($1, "NETWORK_NAME") != 0) {print("NETWORK_NAME = \"'$INDY_NETWORK_NAME'\"")} else print($0)}' /etc/indy/indy_config.py> /tmp/indy_config.py" Enter
# sleep 1
# tmux capture-pane -p -t node2:1 -S -1000 >> indy_comm2.txt


# tmux send-keys -t node2:1 "mv /tmp/indy_config.py /etc/indy/indy_config.py" Enter
# sleep 1
# tmux capture-pane -p -t node2:1 -S -1000 >> indy_comm2.txt

# tmux send-keys -t node2:1 "mkdir /var/lib/indy/indyNetwork" Enter
# sleep 1
# tmux capture-pane -p -t node2:1 -S -1000 >> indy_comm2.txt


# tmux send-keys -t node2:1 "exit" Enter

# # Kill the tmux session
# tmux kill-session -t node2
# echo "Done for node 2"
# sleep 5
# ##########################################################################################################  node 3
# # Start a new tmux session and window
# tmux new-session -d -s node3
# tmux new-window -t node3:1 -n "docker exec -it node3 bash"



# # Wait for node1 terminal
# sleep 5

# # Send commands to indi-cli and save the output to a file
# tmux send-keys -t node3:1 "INDY_NETWORK_NAME=indyNetwork" Enter
# sleep 1
# tmux capture-pane -p -t node3:1 -S -1000 > indy_comm3.txt

# tmux send-keys -t node3:1 "awk '{if (index($1, "NETWORK_NAME") != 0) {print("NETWORK_NAME = \"'$INDY_NETWORK_NAME'\"")} else print($0)}' /etc/indy/indy_config.py> /tmp/indy_config.py" Enter
# sleep 1
# tmux capture-pane -p -t node3:1 -S -1000 > indy_comm3.txt


# tmux send-keys -t node3:1 "mv /tmp/indy_config.py /etc/indy/indy_config.py" Enter
# sleep 1
# tmux capture-pane -p -t node3:1 -S -1000 > indy_comm3.txt

# tmux send-keys -t node3:1 "mkdir /var/lib/indy/indyNetwork" Enter
# sleep 1
# tmux capture-pane -p -t node3:1 -S -1000 > indy_comm3.txt


# tmux send-keys -t node3:1 "exit" Enter

# # Kill the tmux session
# tmux kill-session -t node3
# echo "Done for node 3"
# sleep 5
# #########################################################################################################  Node 4
# # Start a new tmux session and window
# tmux new-session -d -s node4
# tmux new-window -t node4:1 -n "docker exec -it node4 bash"



# # Wait for node1 terminal
# sleep 5

# # Send commands to indi-cli and save the output to a file
# tmux send-keys -t node4:1 "INDY_NETWORK_NAME=indyNetwork" Enter
# sleep 1
# tmux capture-pane -p -t node4:1 -S -1000 > indy_comm4.txt

# tmux send-keys -t node4:1 "awk '{if (index($1, "NETWORK_NAME") != 0) {print("NETWORK_NAME = \"'$INDY_NETWORK_NAME'\"")} else print($0)}' /etc/indy/indy_config.py> /tmp/indy_config.py" Enter
# sleep 1
# tmux capture-pane -p -t node4:1 -S -1000 > indy_comm4.txt


# tmux send-keys -t node4:1 "mv /tmp/indy_config.py /etc/indy/indy_config.py" Enter
# sleep 1
# tmux capture-pane -p -t node4:1 -S -1000 > indy_comm4.txt

# tmux send-keys -t node4:1 "mkdir /var/lib/indy/indyNetwork" Enter
# sleep 1
# tmux capture-pane -p -t node4:1 -S -1000 > indy_comm4.txt


# tmux send-keys -t node4:1 "exit" Enter

# # Kill the tmux session
# tmux kill-session -t node4
# echo "Done for node 4"
# sleep3

echo $PWD
cd /home/indy_test/documentation
echo $PWD/creategenesis/domain_transactions_genesis

sudo docker cp $PWD/creategenesis/domain_transactions_genesis node1:/var/lib/indy/indyNetwork/
sudo docker cp $PWD/creategenesis/domain_transactions_genesis node2:/var/lib/indy/indyNetwork/
sudo docker cp $PWD/creategenesis/domain_transactions_genesis node3:/var/lib/indy/indyNetwork/
sudo docker cp $PWD/creategenesis/domain_transactions_genesis node4:/var/lib/indy/indyNetwork/

sudo docker cp $PWD/creategenesis/pool_transactions_genesis node1:/var/lib/indy/indyNetwork/
sudo docker cp $PWD/creategenesis/pool_transactions_genesis node2:/var/lib/indy/indyNetwork/
sudo docker cp $PWD/creategenesis/pool_transactions_genesis node3:/var/lib/indy/indyNetwork/
sudo docker cp $PWD/creategenesis/pool_transactions_genesis node4:/var/lib/indy/indyNetwork/

sudo docker cp $PWD/keys_nodes/node1/indy/indyNetwork/ node1:/var/lib/indy/indyNetwork/
sudo docker cp $PWD/keys_nodes/node1/indy/indyNetwork/ node2:/var/lib/indy/indyNetwork/
sudo docker cp $PWD/keys_nodes/node1/indy/indyNetwork/ node3:/var/lib/indy/indyNetwork/
sudo docker cp $PWD/keys_nodes/node1/indy/indyNetwork/ node4:/var/lib/indy/indyNetwork/
echo "keys and genesis copied successfully"
################################################################################################ node 1
#Start a new tmux session and window
echo "changing network name and starting node in running container for node 1"
tmux new-session -d -s node1
tmux new-window -t node1:1 -n "docker exec -it node1 bash"



# Wait for node1 terminal
sleep 5

# Send commands to indi-cli and save the output to a file
tmux send-keys -t node1:1 "start_indy_node node1 0.0.0.0 9701 0.0.0.0 9702" Enter
sleep 1
tmux capture-pane -p -t node1:1 -S -1000 > indy_comm41.txt

tmux send-keys -t node1:1 "exit" Enter

# Kill the tmux session
tmux kill-session -t node1
echo "done for node 1"
echo "changing network name and starting node and starting node in running container for node 2"
sleep 3
################################################################################################# node 2
# Start a new tmux session and window
tmux new-session -d -s node2
tmux new-window -t node2:1 -n "docker exec -it node2 bash"



# Wait for node1 terminal
sleep 5

# Send commands to indi-cli and save the output to a file
tmux send-keys -t node2:1 "start_indy_node node2 0.0.0.0 9703 0.0.0.0 9704" Enter
sleep 1
tmux capture-pane -p -t node2:1 -S -1000 > indy_comm2.txt

tmux send-keys -t node2:1 "exit" Enter

# Kill the tmux session
tmux kill-session -t node2
echo "done for node 2"
echo "changing network name and starting node and starting node in running container for node 3"
sleep 3
##########################################################################################################  node 3
# Start a new tmux session and window
tmux new-session -d -s node3
tmux new-window -t node3:1 -n "docker exec -it node3 bash"



# Wait for node1 terminal
sleep 5

# Send commands to indi-cli and save the output to a file
tmux send-keys -t node3:1 "start_indy_node node3 0.0.0.0 9705 0.0.0.0 9706" Enter
sleep 1
tmux capture-pane -p -t node3:1 -S -1000 > indy_comm3.txt

tmux send-keys -t node3:1 "exit" Enter

# Kill the tmux session
tmux kill-session -t node3
echo "done for node 3"
echo "changing network name and starting node and starting node in running container for node 4"
sleep 3

#########################################################################################################  Node 4
# Start a new tmux session and window
tmux new-session -d -s node4
tmux new-window -t node4:1 -n "docker exec -it node4 bash"



# Wait for node1 terminal
sleep 5

# Send commands to indi-cli and save the output to a file
tmux send-keys -t node4:1 "start_indy_node node4 0.0.0.0 9707 0.0.0.0 9708" Enter
sleep 1
tmux capture-pane -p -t node4:1 -S -1000 > indy_comm4.txt

tmux send-keys -t node4:1 "exit" Enter

# Kill the tmux session
tmux kill-session -t node4

echo "done for node 4"