kubectl run -it --rm --image=mysql:5.7 -n default --restart=Never mysql-client -- mysql -h mysql.mysql.svc -pVaihdaTämä -e 'status'
echo "You should change root password!"
