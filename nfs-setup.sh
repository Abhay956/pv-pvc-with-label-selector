sudo apt update -y
sudo apt install nfs-kernel-server -y
sudo systemctl start nfs-server
sudo mkdir /test
sudo mkdir /test2
sudo chmod 777 /test
sudo chmod 777 /test2
sudo chown nobody:nogroup /test
sudo chown nobody:nogroup /test2
sudo echo "/test *(rw,sync,no_root_squash)" >> /etc/exports
sudo echo "/test2 *(rw,sync,no_root_squash)" >> /etc/exports
sudo systemctl restart nfs-server
sudo ip add | grep -i enp
sudo systemctl status nfs-server

if [ $? -eq 0 ]
then
sudo echo "########################################################################
##                                                                    ##
##                                                                    ##
##                   ##  NFS-SETUP-DONE  ##                           ##
##                                                                    ##
##                   NFS directory created                            ##
##                     1. /test                                       ##
##                     2. /test2                                      ##
##                                                                    ##
##                                                                    ##
##                                                                    ##
########################################################################"

else

sudo echo "########################################################################
##                                                                    ##
##                                                                    ##
##                   ##  NFS-SETUP-FAIlED  ##                         ##
##                                                                    ## 
##                   NFS directory was not created.                   ##
##                     1. /test                                       ##
##                     2. /test2                                      ##
##                                                                    ##
##                                                                    ##
##                                                                    ##
########################################################################"
fi