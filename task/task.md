# Geospatial Analyst Case Study

## Amaç:

Bu çalışma kapsamında, verilen örnek sipariş ve depo verileri analiz edilerek, depo bazlı optimum servis
alanlarının belirlenmesi ve aşağıda tanımlanan operasyonel ve finansal KPI'ların hesaplanması
hedeflenmektedir.
Ayrıca, açık kaynaklardan temin edilecek coğrafi ve demografik veriler kullanılarak; ilçe, mahalle ve gerekli
görülen ölçeklerde müşteri siparişlerine ait metriklerin analiz edilmesi ve haritalandırılması beklenmektedir.

## Analiz Aşamaları:

## 1. Sipariş Verisi Analizi ve Servis Alanlarının Belirlenmesi

**1.1 Sipariş Verisinin Mekansal Analizi**
● Verilen sipariş verisi, içerdiği KPI’lara göre **mekansal olarak analiz edilmelidir**.
● Analiz sadece nokta (point) bazlı değil, **anlamlı mekansal ölçeklerde** (örneğin mahalle, ilçe veya uygun
görülen sistematik bölgeleme yaklaşımları gibi) yapılmalıdır.
**1.2 Optimum Servis Alanlarının Tasarlanması**
● Sipariş yoğunlukları, teslimat süreleri ve diğer operasyonel veriler kullanılarak **depo bazlı optimum
servis alanları** oluşturulmalıdır.
● Sadece sipariş verisi değil, aynı zamanda:
○ Araç tipi ve özellikleri
○ Yol ağı ve teorik süreler
○ Eğim, mesafe ve hız analizleri
○ Demografik yapı (nüfus, gelir düzeyi vb.)
gibi faktörler de göz önünde bulundurulması beklenmektedir.
**1.3 Servis Alanları KPI Analizi**
● Belirlenen her servis alanı için mevcut ve türetilen KPI’lar raporlanmalıdır.
**1.4 Haritalandırma**
● Hem sipariş analizleri hem de oluşturulan optimum servis alanları, ilgili KPI’larla birlikte **GIS tabanlı
görselleştirme araçlarıyla** haritalandırılmalıdır.


## 2. Nüfus ve Demografi Analizi

**2.1 KPI – Nüfus İlişkisi**
● İlçe ve mahalle bazında:
○ Nüfus verileri ile sipariş verilerine dayalı KPI’lar hesaplanmalı
○ Her bir KPI’ın, nüfus yoğunluğu ve demografik yapı ile olan ilişkisi analiz edilmelidir.
**2.2 Haritalandırma**
● İlçe ve mahalle bazlı KPI sonuçları, nüfus bilgileriyle birlikte **tematik haritalar** üzerinden
görselleştirilmelidir.

## Teknik Gereklilikler

```
● Veri analizi: Python ve/veya SQL
● Haritalandırma ve görselleştirme: QGIS, ArcGIS veya benzeri açık kaynak GIS yazılımları
Kod ve dokümantasyon: Tüm kodlar ve analiz süreci, versiyonlanmış olarak bir GitHub reposu
üzerinden iletilmelidir.
```
## Teslimat İçeriği

```
● Özet Sunum: Analiz sonuçlarının, yöntemlerin ve çıkarımların yer aldığı bir sunum dosyası
GitHub Repository: Kod, veri işleme adımları, dökümantasyon ve görselleri içeren proje reposu
```