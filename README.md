# Dokümantasyon
# Geospatial Analyst Case Study

Bu proje, verilen örnek sipariş ve depo verileri üzerinden depo bazlı optimum servis alanlarının belirlenmesi, operasyonel ve finansal KPI'ların hesaplanması ve coğrafi-demografik analizlerin yapılmasını amaçlamaktadır.

## İçerik

- [Dokümantasyon](#dokümantasyon)
- [Geospatial Analyst Case Study](#geospatial-analyst-case-study)
  - [İçerik](#i̇çerik)
  - [Proje Amacı](#proje-amacı)
  - [Veri Setleri](#veri-setleri)
  - [Analiz Aşamaları](#analiz-aşamaları)
  - [Kullanılan Araçlar ve Kütüphaneler](#kullanılan-araçlar-ve-kütüphaneler)
  - [Çıktılar](#çıktılar)
  - [Çalıştırma Talimatları](#çalıştırma-talimatları)
  - [1. Sanal Ortam Oluşturun ve Etkinleştirin](#1-sanal-ortam-oluşturun-ve-etkinleştirin)
    - [Windows:](#windows)
    - [macOS / Linux:](#macos--linux)
  - [2. Gerekli Python Kütüphanelerini Yükleyin](#2-gerekli-python-kütüphanelerini-yükleyin)
  - [3. Analizleri Çalıştırın](#3-analizleri-çalıştırın)
  - [4. Çıktılar](#4-çıktılar)
  - [Teslimat İçeriği](#teslimat-i̇çeriği)

---

## Proje Amacı

Bu çalışma kapsamında:
- Sipariş ve depo verileri analiz edilerek, **depo bazlı optimum servis alanları** belirlenmiştir.
- Operasyonel ve finansal KPI'lar hesaplanmıştır.
- Açık kaynak coğrafi ve demografik verilerle, ilçe/mahalle bazında müşteri sipariş metrikleri analiz edilmiş ve haritalandırılmıştır.

## Veri Setleri

- TUİK (nüfus ve demografi)
- Bursa Açık Veri Portalı (coğrafi sınırlar, mahalle/ilçe verileri)
- USGS SRTM (eğim ve yükseklik verisi)

## Analiz Aşamaları

1. **Sipariş Verisinin Mekansal Analizi**
   - Siparişler, konum bazlı ve anlamlı mekansal ölçeklerde (mahalle, ilçe vb.) analiz edildi.
   - Yoğunluk haritaları ve temel istatistikler çıkarıldı.

2. **Optimum Servis Alanlarının Tasarlanması**
   - Sipariş yoğunluğu, teslimat süresi, kâr gibi metriklerle depo bazlı optimum servis alanları oluşturuldu.
   - Araç tipi, yol ağı, eğim, mesafe, hız ve demografik yapı gibi faktörler dikkate alındı.

3. **Servis Alanları KPI Analizi**
   - Her servis alanı için mevcut ve türetilen KPI'lar (ör. ortalama teslimat süresi, toplam kâr, ciro) raporlandı.

4. **Haritalandırma**
   - Analizler ve optimum servis alanları, GIS tabanlı görselleştirme araçlarıyla haritalandırıldı.

5. **Nüfus ve Demografi Analizi**
   - 

## Kullanılan Araçlar ve Kütüphaneler

- **Veri Analizi:** Python (pandas, geopandas, numpy, vb.)
- **Haritalandırma & Görselleştirme:** QGIS, matplotlib, plotly
- **Diğer:** Jupyter Notebook, Git

## Çıktılar

- Analiz kodları ve veri işleme adımları (`notebooks/` klasöründe)
- Veriler ve grafikler (`notebooks/ORDERS_SERVICE_AREA/` klasöründe)
- Sunum dosyası (`presentation/` klasöründe)
- Harita çıktıları (`maps/` klasöründe)
- Bu dokümantasyon dosyası

## Çalıştırma Talimatları

## 1. Sanal Ortam Oluşturun ve Etkinleştirin

Python bağımlılıklarını izole şekilde yönetmek için sanal ortam kullanılması önerilir.

### Windows:
```bash
python -m venv venv
.\venv\Scripts\activate
```

### macOS / Linux:
```bash
python3 -m venv venv
source venv/bin/activate
```

## 2. Gerekli Python Kütüphanelerini Yükleyin

Aşağıdaki komutla gerekli kütüphaneleri yükleyin:

```bash
pip install -r requirements.txt
```

## 3. Analizleri Çalıştırın

Jupyter Notebook dosyasını veya .py uzantılı Python betiklerini çalıştırarak analizleri gerçekleştirebilirsiniz.

## 4. Çıktılar

Üretilen harita ve görseller `plots_workarea/` klasöründe saklanacaktır.

## Teslimat İçeriği

- **Özet Sunum:** Analiz sonuçları, yöntemler ve çıkarımların yer aldığı sunum dosyası
- **GitHub Repository:** Kod, veri işleme adımları, dokümantasyon ve görseller

