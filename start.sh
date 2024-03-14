# question 5
ssh root@servera dnf install -y httpd 
ssh root@servera systemctl disable httpd 
ssh root@servera sed -i 's/Listen 80/Listen 88/g' /etc/httpd/conf/httpd.conf 
ssh root@servera echo "Good job" > /var/www/html/mock.txt 
ssh root@servera echo "Hello World" > /var/www/html/index.html 
ssh root@servera semanage fcontext -m -t default_t /var/www/html/mock.txt 
ssh root@servera restorecon -v /var/www/html/mock.txt 
ssh root@servera systemctl restart httpd 2> /dev/null 


# question 3
ssh root@servera dnf config-manager --disable rhel-9.0-for-x86_64-appstream-rpms 
ssh root@servera mv /etc/yum.repos.d/rhel_dvd.repo /root/rhel_dvd.repo

# question 9 
ssh root@servera dnf remove -y bzip2 

# question 11
ssh root@servera echo -e "FROM docker.io/library/alpine\nCMD echo hehe is working" > /home/student/container/containerfile

# question 2.3
ssh root2@serverb parted /dev/vdb mklabel gpt
ssh root@serverb parted /dev/vdb mkpart swap-1 linux-swap 1 202MiB 
ssh root@serverb udevadm settle 
ssh root@serverb echo "/dev/vdb1 swap   swap default  0   0" >> /etc/fstab 
ssh root@serverb mkswap /dev/vdb1


# answer 5
    3. To modify the security context of the original /var/www/html/page1 file, use:
    # semanage fcontext -m -t httpd_sys_content_t "/var/www/html/page1"
    4. To refresh the security context, use:
    # restorecon -R -v /var/www/html/page1
    5. To verify, use:
    # ls -Z /var/www/html/*
    6. To release port 88, use:
    # semanage port -a -t http_port_t -p tcp 88
