# Database_and_image_matching
Biblioteka zawiera funkcje w programie matlab do akwizycji obrazów z sensorów Kinect Xbox 360, Kinect Xbox One oraz Flir A325sc.  Program przeprowadza analizę dopasowania obrazów - w trakcie tworzenia

W celu uruchomienia tworzenia bazy danych należy użyć:
start_acquisionion(1000);
-liczba w nawiasie odpowiada liczbie klatek, które zostaną zarejestrowane dla każdej z kamer.

W celu uruchomienia dopasowania obrazów można użyć funkcji:
match3_img (333);
w nawiasie podając numer zdjęcia w folderze.
