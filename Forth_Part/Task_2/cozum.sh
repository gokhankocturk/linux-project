# YAPILACAKLAR
# "certificate.pem" dosyasi icerisindeki ifade tek satir. Biz bu ifade icinde
# "\n" yazan yerleri alarak alt satira gecmek istiyoruz. Yani ifadeyi "\n"lerden
# bolerek alt alta duzgun bir sekilde yazdirmak istiyoruz.

# Solution 1
echo -e $(cat certificate.pem) > new1.pem

# Solution 2
# "\n"i komut gibi algilamamasi icin basina bir tane daha ters slash koyuyoruz.
# "sed" komutunda "s/neyi_degistirecek/neyle_degistirecek/global" seklinde yapiyoruz.
cat certificate.pem | sed 's/\\n/\n/g' | tee new2.pem