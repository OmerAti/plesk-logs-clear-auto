 Plesk Günlük Temizleyici

Disk alanı sorunlarını önlemeye yardımcı olmak için Plesk’in `/var/www/vhosts/*/logs/` dizinleri altındaki büyük günlük dosyalarını otomatik olarak kısaltır.

Bu komut dosyası, günlük dosyalarını silmek yerine `truncate` komutunu kullanarak **içeriklerini güvenli bir şekilde boşaltır** ve dosya izinlerini ile sahipliğini korur.

## Özellikler

- ✅ Plesk sunucularını destekler
- ✅ Güvenli günlük temizleme (dosyaları silmez)
- ✅ Otomatik olarak bir cron görevi kurar
- ✅ Her 3 günde bir saat 03:00'da çalışır
- ✅ Yalnızca **100 MB**'den büyük günlük dosyalarını temizler
- ✅ Kurulum sırasında ilk temizleme işlemini gerçekleştirir
- ✅ Yinelenen cron girişlerini önler
