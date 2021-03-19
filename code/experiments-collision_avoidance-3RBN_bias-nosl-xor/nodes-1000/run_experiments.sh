s=1
while test $s -le 100
do
  for bias in 0.1 0.21 0.5 0.79 0.9
  do
    cat bn_robot-rnd_collision_avoidance-3RBN.lua | sed s/"myseed = 0"/"myseed = $s"/ > temp.lua
    cat temp.lua | sed s/"bias = 0"/"bias = $bias"/ > script.lua
    argos3 -c run-batch-collision_avoidance.argos | grep -v INFO > output-$s-$bias.txt
  done
  s=`expr $s + 1`
done
