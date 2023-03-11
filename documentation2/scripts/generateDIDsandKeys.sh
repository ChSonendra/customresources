echo "creating DIDd and VerKeys using indy-cli"

# Start a new tmux session and window
tmux new-session -d -s indi
tmux new-window -t indi:2 -n "indi-cli"

# Run indi-cli in the new window
tmux send-keys -t indi:2 "docker exec -it indyCli bash -c 'indy-cli'" Enter

# Wait for indi-cli to start
sleep 2

# Send commands to indi-cli and save the output to a file
tmux send-keys -t indi:2 "wallet delete newNetwork key=key" Enter
sleep 1
tmux capture-pane -p -t indi:2 -S -1000 > version.txt

tmux send-keys -t indi:2 "wallet create newNetwork key=key" Enter
sleep 1
tmux capture-pane -p -t indi:2 -S -1000 > version.txt


tmux send-keys -t indi:2 "wallet open newNetwork key=key" Enter
sleep 1
tmux capture-pane -p -t indi:2 -S -1000 > version.txt


tmux send-keys -t indi:2 "did new seed=000000000000000000000000Trustee1" Enter
sleep 1
tmux capture-pane -p -t indi:2 -S -1000 > version.txt


tmux send-keys -t indi:2 "did new seed=000000000000000000000000Trustee2" Enter
sleep 1
tmux capture-pane -p -t indi:2 -S -1000 > version.txt



tmux send-keys -t indi:2 "did new seed=000000000000000000000000Trustee3" Enter
sleep 1
tmux capture-pane -p -t indi:2 -S -1000 > version.txt



tmux send-keys -t indi:2 "did new seed=00000000000000000000000011111111" Enter
sleep 1
tmux capture-pane -p -t indi:2 -S -1000 > version.txt

tmux send-keys -t indi:2 "did new seed=00000000000000000000000011111112" Enter
sleep 1
tmux capture-pane -p -t indi:2 -S -1000 > version.txt


tmux send-keys -t indi:2 "did new seed=00000000000000000000000011111113" Enter
sleep 1
tmux capture-pane -p -t indi:2 -S -1000 > version.txt

tmux send-keys -t indi:2 "did new seed=00000000000000000000000011111114" Enter
sleep 1
tmux capture-pane -p -t indi:2 -S -1000 > version.txt

tmux send-keys -t indi:2 "exit" Enter

# Kill the tmux session
tmux kill-session -t indi
echo "We are in generateDIDsandKeys Script and Current Directory is $PWD"
sleep 2
cd ..
echo $PWD
docker cp $PWD/indy_config.py node1:/etc/indy/
docker cp $PWD/indy_config.py node2:/etc/indy/
docker cp $PWD/indy_config.py node3:/etc/indy/
docker cp $PWD/indy_config.py node4:/etc/indy/


INDY_NODE_NAME="node1"
INDY_NODE_SEED="00000000000000000000000011111111"

result=$(docker exec -it node1 bash -c 'init_indy_keys --name $INDY_NODE_NAME --seed $INDY_NODE_SEED')
echo $result > ${PWD}/keys_nodes/node1/keys.txt


INDY_NODE_NAME="node2"
INDY_NODE_SEED="00000000000000000000000011111111"

result=$(docker exec -it node2 bash -c 'init_indy_keys --name $INDY_NODE_NAME --seed $INDY_NODE_SEED')
echo $result > ${PWD}/keys_nodes/node2/keys.txt




INDY_NODE_NAME="node3"
INDY_NODE_SEED="00000000000000000000000011111113"

result=$(docker exec -it node3 bash -c 'init_indy_keys --name $INDY_NODE_NAME --seed $INDY_NODE_SEED')
echo $result > ${PWD}/keys_nodes/node3/keys.txt



INDY_NODE_NAME="node4"
INDY_NODE_SEED="00000000000000000000000011111114"

result=$(docker exec -it node4 bash -c 'init_indy_keys --name $INDY_NODE_NAME --seed $INDY_NODE_SEED')
echo $result > ${PWD}/keys_nodes/node4/keys.txt