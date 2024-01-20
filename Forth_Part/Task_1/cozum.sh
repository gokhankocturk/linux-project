# YAPILACAKLAR
# "terraform.tf" dosyasının 40.satırında "https://ec2-private_ip:6443"
# içerisinde geçen "ec2-private_ip" yerine "info.json" dosyasında 
# "PrivateIpAddress" KEYine karsilik gelen VALUEyu alıp yazmamiz isteniyor.

# Solution 1
grep PrivateIpAddress info.json | head -1 | cut -d '"' -f4
sed "s/ec2-private_ip/$(grep PrivateIpAddress info.json | head -1 | cut -d '"' -f4)/" terraform.tf

# Solution 2
grep PrivateIpAddress info.json | head -1 | cut -d ":" -f2 | tr -d ' ",'
sed "s/ec2-private_ip/$(grep PrivateIpAddress info.json | head -1 | cut -d ":" -f2 | tr -d ' ",')/" terraform.tf

# Solution 3
grep PrivateIpAddress info.json | head -1 | cut -d '"' -f4
sed -i "s/ec2-private_ip/$(grep PrivateIpAddress info.json | head -1 | cut -d '"' -f4)/" terraform.tf

