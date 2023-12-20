#### Prepared by: Hüseyin UZUNYAYLA / OgnitorenKs
- ► Discord: https://discord.gg/7hbzSGTYeZ
- ► Mail: ognitorenks@gmail.com
- ► Site: [https://ognitorenks.blospot.com](https://ognitorenks.blospot.com)
- Supported languages = English │ Turkish

All rights of the work belong to Hüseyin UZUNYAYLA. It is forbidden to develop, copy, change the content of the work. If you want to share the application on different platforms, you need to get permission from me.

# SSDOptimizer
<details><B><+><summary> • English guide</B></+></summary>
<details><B><summary> 1 - Hibernate</B></summary>
When you put the computer into hibernation, it stores the current settings, open files and all programs in the system file "hiberfil.sys". It uses this data to boot the system quickly. SSDs do not need this service as they boot up fast anyway. It will perform a considerable write operation on the disk. This has a negative impact on SSD health.
</details><details><B><summary> 2 - Time stamp</B></summary>
Windows stores the access time for each file. This can cause write errors. Unnecessary writes will negatively affect SSD health.
</details><details><B><summary> 3 - Fast boot</B></summary>
This service prevents the system from shutting down completely. You can think of it as a kind of sleep mode. When you start the computer, it tries to boot the system quickly using the data it has temporarily stored. This service can cause errors in booting. Also, although you shut down the system, the hardware continues to run.
</details><details><B><summary> 4 - Thumbnail cache</B></summary>
Turns off Windows' thumbnail cache. For SSDs, this service is unnecessary. If you have a lot of photos on your system and store them on HDD, you can keep this service on.
</details><details><B><summary> 5 - Ram caching</B></summary>
It tries to compensate for the performance loss of the HDD by keeping 2GB or more of data in Ram memory. Turning this setting off reduces the NT kernel's interference with the disk and ensures stable performance.
</details><details><B><summary> 6 - Prefetch</B></summary>
It allows frequently used applications to be preloaded into RAM. This is an unnecessary service for SSDs. To preserve SSD health by turning off unnecessary caching, it's best to keep this service off.
</details><details><B><summary> 7 - Boot file defragmentation</B></summary>
SSDs by their very nature do not require disk consolidation. This process does more harm than good. For HDDs, this service is necessary and should be performed regularly. For SSD health, it is better to turn off the service.
</details><details><B><summary> 8 - Windows event log</B></summary>
Windows permanently saves all states for the system. This causes unnecessary disk writes. For SSD health, it is better to keep the service turned off.
</details><details><B><summary> 9 - Short names [8dot3]</B></summary>
It is required for compatibility with older 16-bit DOS applications. Current programs do not need it. This service writes short names to files and folders for quick access. It is better to turn it off as this unnecessary writing can have a negative impact on disk health.
</details><details><B><summary> 10 - Trim</B></summary>
Your SSD must support this feature. You can check this on the manufacturer page. Trim is the process of deleting unnecessary data that is not used in SSD memory. This deletes unnecessary data and improves the performance of the SSD. 
The Trim function depends on the Disk defragmentation service. The disk defragmentation service detects if your hardware has SSDs and does not perform disk defragmentation for SSDs, but instead applies the Trim function.
</details><details><B><summary> 11 - Disk defragmentation</B></summary>
This service is especially important for HDDs. Because without disk defragmentation, HDD memory cells will be divided, which will negatively affect its performance and health.
This service was considered harmful for SSDs due to bugs in the early days. However, with updates, it is indispensable for SSDs. Because the Trim function depends on this service. Therefore, if this service is turned off, Trim will not work. This will negatively affect SSD performance and health.
</details><details><B><summary> 12 - Font cache</B></summary>
Optimizes the performance of applications by caching commonly used font data.
</details><details><B><summary> 13 - Windows Search</B></summary>
Windows creates an index file to speed up the search. This causes a reduction in SSD life. If you do not use this feature, it is recommended to turn it off
</details>
</details>
<details><B><summary> • + Türkçe kılavuz</B></summary>
<details><B><summary> 1 - Hazırda beklet</B></summary>
Bilgisayarı hazırda beklet moduna aldığınızda mevcut ayarlar, açık dosyaları ve tüm programları "hiberfil.sys" sistem dosyası içinde saklar. Sistemi hızlı açmak için bu verileri kullanır. SSD'ler zaten hızlı açıldığı için bu hizmete gerek yoktur. Disk üzerinde hatırı sayılır bir yazma işlemi yapacaktır. Bu da SSD sağlığını olumsuz etkileyen bir durumdur.
</details><details><B><summary> 2 - Zaman damgası</B></summary>
Windows her dosya için erişim süresini depolar. Bundan kaynaklı yazma hataları oluşabiliyor. Gereksiz yazma işlemi SSD sağlığını olumsuz etkileyecektir.
</details><details><B><summary> 3 - Hızlı başlat</B></summary>
Bu hizmet sistemin tamamen kapanmasını engeller. Bir nevi uyku modu gibi düşünebilirsiniz. Bilgisayarı başlattığınızda geçici olarak depoladığı verileri kullanarak hızlı bir şekilde sistemi açmaya çalışır. Bu hizmet önyüklemelerde hatalar sebebiyet verebilir. Ayrıca sistemi kapatmanıza rağmen donanım çalışmaya devam etmektedir.
</details><details><B><summary> 4 - Küçük resim önbelleği</B></summary>
Windows'un küçük resim önbelliğini kapatır. SSD'ler için bu hizmet gereksizdir. Sisteminizde çok fazla fotoğraf var ve bunları HDD içinde saklıyorsanız bu hizmeti açık tutabilirsiniz.
</details><details><B><summary> 5 - Ram bellekleme</B></summary>
2GB ve üzeri veriyi Ram belleğinde tutarak HDD'nin performans kaybını gidermeye çalışır. Bu ayarın kapatılması NT çekirdeğinin diske müdahalesini azaltır ve stabil bir performans sunmasını sağlar.
</details><details><B><summary> 6 - Hızlı getir [Prefecth]</B></summary>
Sık kullanılan uygulamaların RAM'e önceden yüklenmesini sağlar. Bu SSD'ler için gereksiz bir hizmettir. Gereksiz önbelleklemeyi kapatarak SSD sağlığını korumak için bu hizmeti kapalı tutmanızda fayda var.
</details><details><B><summary> 7 - Önyükleme dosya birleşimi</B></summary>
SSD'ler yapıları itibariyle disk birleşimi istemezler. Bu işlemin faydadan çok zararı vardır. HDD'ler için bu hizmet gereklidir ve düzenli bir şekilde yapılmalıdır. SSD sağlığı için hizmeti kapatmanızda fayda var.
</details><details><B><summary> 8 - Windows olay günlüğü</B></summary>
Windows sistem için olan tüm durumları kalıcı olarak kayıt eder. Bu durum gereksiz disk yazma işlemine neden olur. SSD sağlığı için hizmeti kapalı tutmakta fayda var.
</details><details><B><summary> 9 - Kısa adlar [8dot3]</B></summary>
Eski 16-bit DOS uygulamalarla uyumluluk için gereklidir. Mevcut programların buna ihtiyacı yoktur. Bu hizmet hızlı erişim için dosya ve klasörlere kısa adlar ile kayıt eder. Bu gereksiz yazma işlemi disk sağlığını olumsuz etkileyeceği için kapatmakta fayda var.
</details><details><B><summary> 10 - Trim</B></summary>
Bu özellik için SSD'nizin desteği olması gerekmektedir. Üretici sayfasından bunu kontrol edebilirsiniz. Trim SSD belleklerinde kullanılmayan gereksiz verileri silme işlemidir. Bu işlem ile gereksiz veriler silinir ve SSD'nin performansı artar. 
Trim işlevi Disk birleştirme hizmetine bağlıdır. Disk birleştirme hizmeti donanımınızda SSD olup olmadığını tespit eder ve SSD'ler için disk birleştirme yapmaz bunun yerine Trim işlevini uygular.
</details><details><B><summary> 11 - Disk birleştirme</B></summary>
Bu hizmet özellikle HDD'ler için çok önemlidir. Çünkü disk birleştirme yapılmadığında HDD bellek hücreleri bölündüğü için performans ve sağlığını olumsuz etkileyecektir
Bu hizmet ilk zamanlardaki hatalardan dolayı SSD'ler için zararlı olarak akıllarda kaldı. Ancak güncellemelerle birlikte SSD'lerde içinde vazgeçilmezdir. Çünkü Trim işlevi bu hizmete bağlıdır. Dolayısıyla bu hizmet kapalı olursa Trim işlemi de çalışmayacaktır. Bu da SSD performansı ve sağlığını olumsuz etkileyecektir.
</details><details><B><summary> 12 - Yazı tipi önbelliği</B></summary>
Yaygın olarak kullanılan yazı tipi verilerini önbelleğe alarak uygulamaların performansını optimize eder.
</details><details><B><summary> 13 - Windows Arama</B></summary>
Aramayı hızlandırmak için Windows dizin dosyası oluşturur. Bu işlem SSD ömrünün kısalmasına neden olur. Bu özelliği kullanmıyorsanız kapatmanız tavsiye edilir
</details>

</details>