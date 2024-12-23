
# Born2beRootBdarija

## الجزء الأول: تحميل الماشين الفيرتويل
1. سير لهاد الرابط: https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/
2. نزل للتحت ديال الصفحة وكليكي على "debian-xx.x.x-amd64-netinst.iso"
* هاد الخطوات غادي يعاونوك باش تحمل نظام ديبيان اللي غادي تستعمل فالماشين الفيرتويل ديالك.
  ## الجزء الثاني: تثبيت الماشين الفيرتويل
1. حل برنامج VirtualBox وكليكي على "New"
2. بدل المجلد فين غادي تحط الماشين ل `sgoinfre/students/your_intra_login/Virtual Machine`
3. حط الميموار على  1024 MB  
4. دير `Create a Virtual Hard Disk Now` وخليه على 12.00 GB
5. من بعد سير ل `Settings` و `Storage` وزيد الفيشي ديال ديبيان اللي حملتي قبيلا
* هاد الخطوات كيعاونوك باش تصاوب الماشين الفيرتويل ديالك وتجهزها للتثبيت.
* ## الجزء الثالث: بدء الماشين الفيرتويل
1. كليكي على السهم الخضر باش تبدا الماشين
2. ختار `Install` وتبع الخطوات ديال التثبيت
3. حط الباسوورد ديالك وخليه فبالك، غادي تحتاجو من بعد
4. ملي توصل للبارتيشن، ختار `Guided - use entire disk and set up encrypted LVM`
* هاد الجزء كيورّيك كيفاش تبدا الماشين وتثبت النظام بطريقة آمنة.
  ## الجزء الرابع: إعداد الماشين الفيرتويل
1. ثبت  `sudo: apt-get install sudo`
2. زيد المستخدم ديالك لمجموعة `sudo: usermod -aG sudo your_username `
3. ثبت وكونفيگيري SSH على البور 4242 
4. ثبت وكونفيگيري UFW (جدار الحماية) 
5. حط سياسة الباسووردات القوية 
* هاد الخطوات كيساعدوك باش تجهز الماشين ديالك بالأدوات والإعدادات الأمنية اللازمة.
* ## الجزء الخامس: الاتصال عبر SSH
1. كونفيگيري البور فورواردينگ فVirtualBox
2. اتصل بالماشين من الطرمينال ديالك:` ssh your_username@127.0.0.1 -p 4242`
* هاد الجزء كيورّيك كيفاش تقدر تتحكم فالماشين ديالك عن بعد بطريقة آمنة.
* ## الجزء السادس: إعدادات إضافية 
1. دير مجموعات جديدة: user42 و evaluating 
2. زيد مستخدمين جدد وحطهم فهاد المجموعات
3. كونفيگيري ملف sudo.log
4. عدل إعدادات crontab باش تشغل سكريبت المراقبة كل 10 دقايق
* هاد الخطوات الأخيرة كيكملو الإعداد ديال الماشين ديالك وكيجهزوها للتقييم.
  



