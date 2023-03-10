# # step1 ----- generating image out of dockerfile for indy node
# cd keysgeneration
# echo "step1 ----- generating image out of dockerfile for indy node"
# docker stop $(docker ps -aq)
# sleep 5
# docker rm $(docker ps -aq)
# sleep 5
# docker rmi keysnode:1.0
# sleep 5
# image_builder_logs=$(docker build -t keysnode:1.0 .)
# sleep 5


# # step2 ----- starting containers for nodes, but not starting nodes
# echo "step2 ----- starting containers for nodes, but not starting nodes"
# docker_compose_logs=$(docker-compose up -d)
# sleep 10

Start a new tmux session and window
tmux new-session -d -s keysnode
tmux new-window -t keysnode:1 -n "docker exec -it keysnode bash"



# Wait for keysnode terminal
sleep 5

# Send commands to indi-cli and save the output to a file
tmux send-keys -t keysnode:1 "INDY_NETWORK_NAME=indyNetwork" Enter
sleep 1
tmux capture-pane -p -t keysnode:1 -S -1000 > indy_comm41.txt

tmux send-keys -t keysnode:1 "awk '{if (index($1, "NETWORK_NAME") != 0) {print("NETWORK_NAME = \"'$INDY_NETWORK_NAME'\"")} else print($0)}' /etc/indy/indy_config.py> /tmp/indy_config.py" Enter
sleep 1
tmux capture-pane -p -t keysnode:1 -S -1000 > indy_comm1.txt


tmux send-keys -t keysnode:1 "mv /tmp/indy_config.py /etc/indy/indy_config.py" Enter
sleep 1
tmux capture-pane -p -t keysnode:1 -S -1000 > indy_comm1.txt

tmux send-keys -t keysnode:1 "mkdir /var/lib/indy/indyNetwork" Enter
sleep 1
tmux capture-pane -p -t keysnode:1 -S -1000 > indy_comm1.txt


tmux send-keys -t keysnode:1 "exit" Enter

# Kill the tmux session
tmux kill-session -t keysnode