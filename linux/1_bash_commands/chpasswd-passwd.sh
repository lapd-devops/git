#change pass in one line command ( only by root)
echo "passssssword" | passwd root --stdin > /dev/null
#or
echo root:passssssword | chpasswd
