read x
read y
echo $x
echo $y

if (($x>$y); then
	echo X is greater than y
elif (($x<$y)); then
	echo Y is greater than  y
else
	echo x is equal to y
fi

