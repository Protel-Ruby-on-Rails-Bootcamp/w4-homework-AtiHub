# w4-homework

Merhaba. 4. hafta odeviniz Ruby on Rails ile kucuk bir proje yapmak olacak. Projeyi Github'a koyacaksiniz ve Heroku'ya ya da istediginiz baska bir yere deploy edip bana linkini DM'den Discord'dan atacaksaniz.

# Global Blog Website (like medium)

Amacimiz insanlarin kendi iceriklerini yazabildikleri, takipcileri ile paylasabildikleri ve diger insanlarin bu iceriklere yorum yapabildigi ve icerikleri puanladiklari bir websitesi yapmak.

Ancak simdilik kucuk adimlarla gittigimiz icin az ozellik yaparak basliyoruz. Bu odevde sizden istediklerim:

1. User signin/signup ve signout olabilmeli. Bunu yapmak icin lutfen Devise Ruby Gem''ni kullanin. User'in email adresi ve username'i olacak.
2. User kendine ait yazilari (post/article) girebilir. Bir icerigin title, content adinda alanlari olacak.
3. User kendi girdigi yazilari editleye bilir ve silebilir.
4. User, diger user'larin gorebilmesini istedigi yazilari ayarlayabilir. Diger user'lar tarafindan gorulmesi istenmeyen yazilar baskalari tarafindan gorulemez. Sadece o yazilari ekleyen gorebilir.
5. http://websiteniz.com adresine gidince bir Welcome sayfasi istiyorum. Bu sayfasi sadece public'ler gorebilir. Login olmadan diger sayfalar gorunemez. Eger kullanici loginse bu sayfada paylasilabilen yazilari listesini ve o yazilari title'ini, kim tarafindan yazildigi ve olusturulma tarihini gorebilir.

Islerin nasil yapilacagini soylemiyorum. Iliskileri kurmak, yeni alanlar ekleyerek yazilarin gorunup, gorunmemesini saglamak tamamen sizin mimari tasariminiza kalmis.

### Validations

- User modelinde email ve username zorunlu alanlar. username'un uzunlugu 5 karakterden az 50 karakterden fazla olamaz.
- Post/Article modelinde title ve content zorunlu alanlar.

### Adim adim yapilacaklar

- http://websitesi.com'a gidince welcome page gorulmeli. signup olunabilmeli. login olunabilmeli. yazilar uzerinde CRUD islemleri yapilabilmeli. Diger insanlarin paylastigi yazilari gorebilmeliyim.

### Dikkat edilecekler

- Kod icerisinde bahsettigimiz butun best practice'ler uygulanmali.
- Tasarim gerekli degil cunku bahsetmedik.
- Scaffold kullanabilirsiniz ancak gereksiz kod gormek istemiyorum.

### Son teslim

Cuma gunu saat 23:59'dan sonra commit'lenen odevler gecersiz sayilacaktir.
