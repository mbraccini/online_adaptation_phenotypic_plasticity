for i in output-*
do
	cat $i | tr '\033' ' ' | tr 'm' ' ' > $i"_"conv.txt
done
