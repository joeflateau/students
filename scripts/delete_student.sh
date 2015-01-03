name=$1

sudo unlink "/var/www/students.joeflateau.net/$name"
sudo rm -rf "/students/$name"
sudo deluser $1
sudo delgroup $1
