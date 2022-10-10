# Pazarama iOS Bootcamp - Hafta 3 - Ödev


## iTunes Client App

Bu haftanın ödev konusu olarak, geliştirdiğimiz iTunes Client App uygulamasını tamamlayacağız. iTunes Search API altında yer alan movie, podcast, music, software, ebook medya tipleri için UITabBarController’a yeni tablar ekleyeceğiz. Ders süresince podcast için bir tab bar eklemiştik. Aynı süreçleri takip ederek diğer tabların eklemesini gerçekleştirebilirsiniz. Her medya tipi için ayrı List/Detail ViewController’lar oluşturabileceğiniz gibi, podcast için oluşturduğumuz ViewController yapılarını daha generic bir hale getirip kullanmanız tavsiye olunur. Tablar değişse de her tab içinde SearchController bulunmalı ve arama sonuçları listelenmelidir. Son olarak bir favoriler tab’i eklenecek ve favorilere eklenen medyalar bu ekranda gösterilercek. Favorilerin kaydı için CoreData kullanılacaktır. Farklı medya tiplerini farklı segmentler altında gösterebilirsiniz. Favorilere eklemek için NavigationBar’a BarButtonItem ekleyebilirsiniz(farklı yöntemler kabul edilecektir.).


## Değerlendirme Kriterleri

1. Uygulamanın sorunsuz bir şekilde(crash free) çalışması.
2. Diğer medya tipleri için tabların eklenmiş olması.
3. UI’ın programmatic(NSLayoutConstraints) olarak oluşturulması.
4. SearchController ile mevcut tabda filtreleme yapılabilmesi.
5. Medyanın favoriler eklenebilmesi ve favoriler ekranında düzgün bir şekilde listelenmesi.


## Faydalı Linkler

- iTunes Search API: https://developer.apple.com/library/archive/documentation/AudioVideo/ Conceptual/iTuneSearchAPI/Searching.html#//apple_ref/doc/uid/TP40017632-CH5-SW1


## Ekran Görüntüleri

<img width="351" alt="Ekran Resmi 2022-10-10 15 07 39" src="https://user-images.githubusercontent.com/58611650/194865189-3fa6cca3-985e-4b21-8b19-81f19badda2a.png">
<img width="361" alt="Ekran Resmi 2022-10-10 15 07 59" src="https://user-images.githubusercontent.com/58611650/194865263-2705a7e5-c047-4e79-8073-96e1c04e40b3.png">
<img width="361" alt="Ekran Resmi 2022-10-10 15 08 17" src="https://user-images.githubusercontent.com/58611650/194865356-2f5c0650-2b3b-43f0-99c5-74be8338de79.png">
<img width="362" alt="Ekran Resmi 2022-10-10 15 08 31" src="https://user-images.githubusercontent.com/58611650/194865374-80bb0bc3-c959-45f1-9000-69b195b15f03.png">
<img width="355" alt="Ekran Resmi 2022-10-10 15 26 48" src="https://user-images.githubusercontent.com/58611650/194866280-924fbcb3-acc6-4eb5-a5b0-2bc239ecf649.png">



