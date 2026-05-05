# Ürün Görselleri Watermark ve Optimize Sistemi

Bu sistem, ürün klasörlerinin içindeki görselleri otomatik olarak işler.

Yaptığı işlemler:

1. Her ürün klasöründeki görselleri bulur.
2. Görselleri oranı bozulmadan küçültür.
3. Ortasına `logo.png` dosyasını watermark olarak ekler.
4. Görselleri JPG formatında optimize eder.
5. Çıktıları her ürün klasörünün içindeki `watermark` klasörüne kaydeder.
6. İkinci script ile eski görseller silinip watermark klasöründeki yeni görseller ana ürün klasörüne çıkarılabilir.

---

## Klasör Yapısı

Script dosyaları ve `logo.png`, ürün klasörleriyle aynı dizinde olmalıdır.

Örnek yapı:

```text
urunler/
│
├── watermark.py
├── promote_watermark.py
├── logo.png
│
├── ahsap-jaluzi/
├── al-jaluzi/
├── deri-jaluzi/
├── dikey-perde/
├── fon-perde/
├── ikili-perde/
├── karisik/
├── plise-perde/
├── rustik/
├── screen/
├── stor-perde/
├── tul-perde/
└── zebra-perde/
Gereksinimler

Bu sistem Python ile çalışır.

Önce bilgisayarda Python kurulu olmalıdır.

Gerekli kütüphane:

pip install pillow
1. Watermark ve Optimize İşlemi

Bu işlem için kullanılan dosya:

watermark.py
Ne Yapar?

watermark.py çalıştırıldığında:

Tüm ürün klasörlerini gezer.
Klasördeki .jpg, .jpeg, .png, .webp görselleri işler.
Görselleri maksimum belirtilen ölçüye küçültür.
Ortasına logo.png dosyasını watermark olarak ekler.
Yeni görselleri JPG olarak kaydeder.
Çıktıları her klasörün içinde açılan watermark klasörüne atar.

Örnek:

stor-perde/
├── eski-resim-1.jpg
├── eski-resim-2.jpg
└── watermark/
    ├── stor-perde-001.jpg
    └── stor-perde-002.jpg
Çalıştırma

Terminal veya CMD üzerinde urunler klasörüne gel:

cd "C:\Users\hamza\Desktop\...\urunler"

Sonra çalıştır:

python watermark.py
Önemli Ayarlar

watermark.py dosyasının üst kısmında şu ayarlar vardır:

JPG_QUALITY = 88
MAX_WIDTH = 1600
MAX_HEIGHT = 1600
LOGO_TARGET_WIDTH = 360
LOGO_OPACITY = 1.0
JPG_QUALITY

JPG kalite ayarıdır.

JPG_QUALITY = 88

Önerilen değerler:

82  = daha düşük dosya boyutu
88  = dengeli kalite
92  = daha yüksek kalite

Ürün sitesi için genelde 88 yeterlidir.

MAX_WIDTH ve MAX_HEIGHT

Görsellerin maksimum genişlik ve yükseklik değeridir.

MAX_WIDTH = 1600
MAX_HEIGHT = 1600

Görsel oranı bozulmaz.
Küçük görseller büyütülmez.
Büyük görseller küçültülür.

Daha küçük dosya boyutu için:

MAX_WIDTH = 1200
MAX_HEIGHT = 1200

Daha yüksek kalite için:

MAX_WIDTH = 1920
MAX_HEIGHT = 1920
LOGO_TARGET_WIDTH

Watermark logosunun genişliğini belirler.

LOGO_TARGET_WIDTH = 360

Logo küçük gelirse:

LOGO_TARGET_WIDTH = 450

Logo büyük gelirse:

LOGO_TARGET_WIDTH = 280
LOGO_OPACITY

Logo zaten şeffaf PNG olarak hazırlanmışsa:

LOGO_OPACITY = 1.0

Kod üzerinden ekstra şeffaflık vermek istenirse:

LOGO_OPACITY = 0.30
2. Watermark Görsellerini Ana Klasöre Alma

Bu işlem için kullanılan dosya:

promote_watermark.py
Ne Yapar?

Bu script, her ürün klasöründe şu işlemleri yapar:

watermark klasörü dışındaki eski dosyaları siler.
watermark klasörünün içindeki yeni görselleri ana ürün klasörüne taşır.
Boş kalan watermark klasörünü siler.

Örnek işlem öncesi:

zebra-perde/
├── zebra-perde (1).jpg
├── zebra-perde (2).jpg
└── watermark/
    ├── zebra-perde-001.jpg
    ├── zebra-perde-002.jpg
    └── zebra-perde-003.jpg

İşlem sonrası:

zebra-perde/
├── zebra-perde-001.jpg
├── zebra-perde-002.jpg
└── zebra-perde-003.jpg
Güvenli Test Modu

promote_watermark.py ilk başta güvenlik için test modunda çalışır.

Kod içinde şu satır bulunur:

DRY_RUN = True

Bu modda hiçbir dosya silinmez veya taşınmaz.
Sadece ne yapılacağını terminalde gösterir.

Çalıştır:

python promote_watermark.py

Eğer çıktıda görünen silinecek ve taşınacak dosyalar doğruysa gerçek işleme geçilebilir.

Gerçek İşlem

Gerçek silme ve taşıma işlemi için:

DRY_RUN = True

şu hale getirilir:

DRY_RUN = False

Sonra tekrar çalıştırılır:

python promote_watermark.py
Dikkat

DRY_RUN = False yapıldıktan sonra eski görseller kalıcı olarak silinir.

Bu yüzden gerçek işlemden önce ana klasörün yedeğini almak önerilir.

Örneğin:

urunler_backup/

şeklinde bir kopya oluşturulabilir.

Kullanım Sırası

Doğru kullanım sırası şu şekildedir:

1. Logo dosyasını koy

Ana klasöre watermark logosunu koy:

logo.png
2. Watermark işlemini çalıştır
python watermark.py

Bu işlem her ürün klasörünün içine watermark klasörü oluşturur.

3. Çıktıları kontrol et

Her ürün klasöründeki watermark klasörünü kontrol et.

Örnek:

stor-perde/watermark/
zebra-perde/watermark/
tul-perde/watermark/

Görsellerin:

Kalitesi iyi mi?
Logo doğru yerde mi?
Dosya isimleri düzgün mü?
Görseller fazla bozulmuş mu?

kontrol edilmelidir.

4. Taşıma scriptini test modunda çalıştır
python promote_watermark.py

Bu aşamada dosyalar silinmez.
Sadece yapılacak işlemler listelenir.

5. Her şey doğruysa gerçek işleme geç

promote_watermark.py içinde:

DRY_RUN = False

yapılır.

Sonra:

python promote_watermark.py

çalıştırılır.

Dosya İsimlendirme Sistemi

Görseller ürün klasörünün adına göre isimlendirilir.

Örnek:

stor-perde-001.jpg
stor-perde-002.jpg
stor-perde-003.jpg
zebra-perde-001.jpg
zebra-perde-002.jpg
zebra-perde-003.jpg

Bu sistem sunucu ve SEO açısından daha temizdir.

Desteklenen Görsel Formatları

Giriş dosyaları için desteklenen formatlar:

.jpg
.jpeg
.png
.webp

Çıkış formatı:

.jpg
Önerilen Ayarlar

Ürün sitesi için önerilen ayarlar:

JPG_QUALITY = 88
MAX_WIDTH = 1600
MAX_HEIGHT = 1600
LOGO_TARGET_WIDTH = 360
LOGO_OPACITY = 1.0

Bu ayarlar kalite ve dosya boyutu arasında dengeli sonuç verir.

Önemli Notlar
Orijinal görseller watermark.py tarafından silinmez.
watermark.py sadece yeni görselleri watermark klasörüne oluşturur.
Eski görselleri silen script promote_watermark.py dosyasıdır.
promote_watermark.py gerçek işlem için DRY_RUN = False yapılmadıkça dosyalara dokunmaz.
Yanlış klasörde çalıştırmamak için script dosyalarının ürün klasörleriyle aynı dizinde olduğundan emin olunmalıdır.