echo "firing Node1"
docker exec -it node1 -c 'start_indy_node node1 0.0.0.0 9701 0.0.0.0 9702'
sleep 2
echo "firing Node2"
docker exec -it node2 -c 'start_indy_node node2 0.0.0.0 9703 0.0.0.0 9704'
sleep 2
echo "firing Node3"
docker exec -it node3 -c 'start_indy_node node3 0.0.0.0 9705 0.0.0.0 9706'
sleep 2
echo "firing Node4"
docker exec -it node4 -c 'start_indy_node node4 0.0.0.0 9707 0.0.0.0 9708'
sleep 2