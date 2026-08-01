# Plesk Günlük Temizleyici

Disk alanı sorunlarını önlemeye yardımcı olmak için Plesk'in `/var/www/vhosts/*/logs/` dizinleri altındaki günlük dosyalarını otomatik olarak temizler.

Bu betik, günlük dosyalarının bulunduğu `logs` klasörlerinin içeriğini güvenli bir şekilde temizler, ilk kurulumda otomatik olarak çalışır ve ardından her **3 günde bir saat 03:00'te** cron ile tekrar çalıştırılır.

## Özellikler

- ✅ Plesk sunucularını destekler
- ✅ Tüm domainlerin `logs` klasörlerini otomatik temizler
- ✅ Otomatik cron görevi oluşturur
- ✅ Her 3 günde bir saat **03:00**'te çalışır
- ✅ Kurulum sırasında ilk temizlemeyi gerçekleştirir
- ✅ Aynı cron kaydını tekrar eklemez
- ✅ Root yetkisiyle güvenli şekilde çalışır

## Kurulum

```bash
git clone https://github.com/OmerAti/plesk-logs-clear-auto.git
cd plesk-logs-clear-auto
chmod +x install.sh clear_plesk_logs.sh
./install.sh
```

## Manuel Çalıştırma

```bash
/root/clear_plesk_logs.sh
```

## Cron Görevi

Kurulumdan sonra aşağıdaki cron görevi otomatik olarak eklenir.

```cron
0 3 */3 * * /root/clear_plesk_logs.sh >/dev/null 2>&1
```

## Kaldırma

Cron görevini kaldırın:

```bash
crontab -e
```

Ardından aşağıdaki satırı silin:

```cron
0 3 */3 * * /root/clear_plesk_logs.sh >/dev/null 2>&1
```

Betiği kaldırın:

```bash
rm -f /root/clear_plesk_logs.sh
```

## Lisans

MIT License

---

**Geliştirici:** JRodix Internet Hizmetleri  
**GitHub:** https://github.com/OmerAti/plesk-logs-clear-auto
