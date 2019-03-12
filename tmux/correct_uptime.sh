uptime | awk '{for(i=2;i<=4;i++)printf "%s ",$i;printf "\n"}' |sed 's/,//'
