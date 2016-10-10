# 3501-KOG-S1R_2016_gr3
Materiały do warsztatów "Statystyka I z R" dla kierunku kognitywistyka na UW, w semestrze zimowym 2016 r.

# Instalowanie R i powiązanych aplikacji

  - [R](https://cran.r-project.org) jako taki.
    - W przypadku systemów operacyjnych Windows warto też zainstalować zestaw [dodatkowych narzędzi](https://cran.r-project.org/bin/windows/Rtools).
  - [RStudio](https://www.rstudio.com/products/rstudio/download3) - IDE, z którym praca będzie bez porównania prostsza.
    - Jeśli ktoś woli Eclipse'a, też może z niego [skorzystać](https://www.r-bloggers.com/eclipse-an-alternative-to-rstudio-part-1/).
  - [Git](https://git-scm.com/download) - system kontroli wersji.
    - Lub - jeśli zamierzasz korzystać z [GitHuba](https://guides.github.com/activities/hello-world) do przechowywania swojego kodu i dzielenia się nim z innymi - Gita opakowanego w [GitHub Desktop](https://desktop.github.com).
    - Jeśli używasz Linuxa, niemal napewno masz już zainstalowany Git.
  - [MikTeX](http://miktex.org/download) - lub inną dystrybucję LateXa.
    - Posiadanie LaTeXa jest konieczne do generowania PDFów (w szczególności raportów w tym formacie).
  - Podczas instalacji powyższych aplikacji, jeśli nie jesteś pewien, jakie opcje wybrać, zgadzaj się na domyślnie wybrane.

# Najpotrzebniejsze informacje o korzystaniu z Gita w RStudio w celu pobierania danych na zajęcia

## Co to jest Git

Git jest otwartym programem służącym do kontroli wersji plików, w szczególności (choć bynajmniej wyłącznie) zawierających kod źródłowy. Pierwotnie powstał w celu wspomagania rozwoju kolejnych wersji Linuxa, a obecnie jest jednym z najszerzej wykorzystywanych narzędzi wspomagających prace w projektach informatyczny i dotyczących analizy dany. Więcej o Gicie możesz dowiedzieć się [tutaj](https://git-scm.com/book/pl/v1/Pierwsze-kroki). Na tych zajęciach wykorzystujemy Gita, aby zapewnić (względnie) łatwe i niezawodne udostępnianie materiałów do zajęć.

## Tworzenie nowego projektu w RStudio

  - Otwórz RStudio.
  - Wybierz w menu: File -> New project...
  - Wybierz opcję *Version Control*, a następnie *Git*
  - Wpisz:
    - w *Repository URL*: "https://github.com/tzoltak/3501-KOG-S1R_2016_gr3",
    - w "Project directory name": jakąś rozsądną nazwę **niezawierającą polskich znaków**,
    - Wybierz rozsądnie folder, w którym ma zostać utworzony nowy folder z projektem (domyślny wybór, oznaczony jako "~" jest rozsądny i w systemie Windows wskazuje na folder "Moje dokumenty" aktywnego użytkownika).
  - Po kliknięciu *Create Project* utworzony zostanie katalog z projektem, do którego zapisany zostanie aktualny stan zdalnego repozytorium.
    
## Aktualizacja repozytorium

Poniżej opisany zostanie sposób pracy z repozytorium Git przy pomocy interfejsu do tego programu zawartego w RStudio. Sytuacja, z którą mamy do czynienia podczas tego kursu opisana została w *Przypadku 3.*, jednak aby lepiej zrozumieć sens wykonywanych czynności, dobrze będzie prześledzić wcześniej dwa prostsze przypadki użycia.

Na końcu opisany jest sposób rozwiązania typowych problemów.

### Przypadek 1. Praca wyłącznie z lokalnym repozytorium

Kiedy sami pracujemy na **lokalnym repozytorium** z kontrolą wersji typowy schemat działań wygląda następująco:

  1. Dokonujemy aktualizacji kodu (np. piszemy kod wykonujący pewne analizy).
     - Zmiany, które dokonaliśmy (utworzenie nowych plików, modyfikacja wcześniej istniejących, usunięcie plików, zmiana nazwy plików) są w efekcie zapisane w systemie plików, ale nie w repozytorium.
     - Niemniej system kontroli wersji śledzi dokonane przez nas zmiany i jest nam w stanie wskazać, że dokonaliśmy modyfikacji (włączając w to pojęcie utworzenie czy skasowanie) danych plików w stosunku do stanu zapisanego w repozytorium.
     - W RStudio objawia się to pojawieniem w zakładce *Git* nazw zmodyfikowanych plików (względnie folderów).
  2. Kiedy zakończymy dany etap prac chcemy zapisać ich stan do repozytorium. W tym celu musimy:
     - Oznaczyć systemowi kontroli wersji, stan których plików chcemy zapisać (nie muszą to być wszystkie pliki, które zmodyfikowaliśmy).
     - W tym celu w RStudio zaznaczamy pola wyboru przy nazwach odpowiednich plików, które znajdują się w kolumnie *Staged* w zakładce *Git* (oznaczone w ten sposób pliki przyjęło się po polsku określać jako *przebywające w poczekalni*).
     - Następnie nakazać zapisanie (zarejestrowanie) nowego stanu wybranych plików w repozytorium, która to operacja po angielsku określana jest jako *commit*.
     - Aby jej dokonać, w zakładce *Git* w RStudio klikamy przycisk *Commit*.
     - Pokaże nam się okno, w którym: 1) możemy podejrzeć, na czym polegają zmiany w porównaniu do poprzedniej zapisanej wersji, 2) możemy jeszcze dodać lub usunąć jakieś pliki do/z *poczekalni*, 3) musimy zwięźle opisać nasz *commit* (okienko *Commit message*).
     - Jeśli upewniliśmy się, że oznaczyliśmy te pliki, co trzeba i dodaliśmy opis, klikamy przycisk *Commit* i następuje zapisanie w systemie kontroli wersji nowego stanu.
     - W efekcie pliki, których stan zapisaliśmy przestają być oznaczone jako zmodyfikowane.
  3. Kiedy dochodzimy do wniosku, że w wyniku wprowadzanych zmian coś zepsuliśmy i nie jesteśmy w stanie łatwo tego wyprostować, najprostszym rozwiązaniem może być powrót do poprzedniej, działającej wersji.
     - Dla każdego pliku możemy łatwo przywrócić jego ostatni zapisany w systemie kontroli wersji stan używając polecenia *revert*.
     - W tym celu w zakładce *git* w RStudio klikamy prawym klikiem na nazwie zmodyfikowanego pliku i wybieramy opcję "Revert...".
     - Zostaniemy ostrzeżeni, że w efekcie utracimy zmiany dokonane w tym pliku od ostatniego zapisu stanu repozytorium. Jeśli nie zmieniliśmy zdania, potwierdzamy wykonanie operacji.
     - Możliwe jest też oczywiście cofnięcie stanu całego repozytorium na raz, w tym do stanów wcześniejszych niż ostatni zapisany stan, ale nie będziemy tu omawiać sposobów wykonania takich operacji.

### Przypadek 2. Praca z zewnętrznym repozytorium, model I

W tym przypadku oprócz tego, że wykorzystujemy Git lokalnie na własnym komputerze do archiwizowania stanu naszego projektu, korzystamy również zewnętrzne repozytorium, które pozwoli dzielić się z innymi wynikami naszej pracy. Zakładamy przy tym, że inni użytkownicy jedynie zapoznają się z wynikami naszej pracy, jednak w żaden sposób ich nie modyfikują.

  1. Praca z naszym lokalnym repozytorium przebiega w ten sam sposób, co opisany w przypadku 1.
  2. Po dokonaniu zapisu nowego stanu w naszym lokalnym repozytorium chcemy jednak *wypchnąć* go również do zewnętrznego repozytorium, na którym będą dostępne dla innych.
     - W tym celu musimy zdefiniować takie zewnętrzne repozytorium powiązane z naszym lokalnym.
     - Zakładając, że jako zewnętrzne repozytorium wykorzystujemy konto na GitHubie (jak w przypadku tego kursu), najprostszym sposobem osiągnięcia tego celu jest przystępując do pracy najpierw utworzyć repozytorium na GitHubie, a potem lokalnie utowrzyć nowy projekt w RStudio związany z tym repozytorium zgodnie z wcześniej opisaną procedurą (przy okazji zostanie utworzone lokalne repozytorium Git na naszym komputerze, powiązane z tym na GitHubie).
     - Aby dokonać *wypchnięcia* najnowszego **zapisanego w lokalnym repozytorium** stanu na zewnętrzne repozytorium posługujemy się komendą *push* - w interfejsie RStudio za jej uruchomienie odpowiada zielona strzałka wskazująca w górę, w zakładce *Git*.
  3. Jeśli ktoś chce śledzić nasz projekt, musi utworzyć sobie swoje własne lokalne repozytorium Git, powiązane z uzywanym przez nas zewnętrznym repozytorium, np. stosując opisaną wyżej procedurę tworzenia projektu na podstawie repozytorium w RStudio.
  4. Aby śledzić zmiany podsyłane przez nas sukcesywnie do zewnętrznego repozytorium taka osoba musi co jakiś czas synchronizować stan swojego repozytorium z repozytorium zewnętrznym.
     - Służy temu polecenie *pull*, w interfejsie RStudio uruchamiane przy pomocy niebieskiej strzałki wskazującej w dół w zakładce *Git*.
     - Jeśli stan zewnętrznego repozytorium jest nowszy niż lokalnego repozytorium danego użytkownika, zaktualizowany stan (i cała ew. historia stanów, które zmieniły się w międzyczasie) zostanie zapisany do lokalnego repozytorium tego użytkownika. W przeciwnym wypadku otrzyma on komuniakt, że stan repozytorium się nie zmienił.

### Przypadek 3. Praca z zewnętrznym repozytorium, model II

W tym przypadku praca przebiega jak w przypadku 2., ale dodatkowo zakładamy, że inni użytkownicy (tu: student) dokonują pewnych własnych modyfikacji w kodzie, jednakże pozostają one jedynie na ich własnych, lokalnych repozytoriach.

  1. Ogólny model pracy jest taki, jak opisano w przypadku powyżej.
  2. Pojawia się jednak problem, co się stanie, jeśli inny użytkownik (student) zmodyfikuje u siebie stan lokalnego repozytorium a jednocześnie autor projektu (prowadzący zajęcia) zmodyfikuje do nowej wersji stan zewnętrznego repozytorium.
     - W takiej sytuacji wciąż możliwe jest zsynchronizowanie lokalnego repozytorium innego użytkownika (studenta) z zewnętrznym repozytorium tak, aby lokalnie zachować zmiany, jakie we własnym, lokalnym repozytorium naniósł na projekt dany użytkownik (student).
     - Aby było to jednak możliwe, dany użytkownik (student) musi dokonać zapisania dokonanych przez siebie zmian jako nowego stanu swojego lokalnego repozytorium (wykonać *commit* - p. *przypadek 1.*).
     - Jeśli użytkownik dokonawszy lokalnie zmian, ale nie dokonawszy operacji *commit* spróbuje wykonać operację *push* z zewnętrznego repozytorium, zostanie poinformowany o niemożliwości jej wykonania.
     - Jeśli operację *push* wykona on po dokonaniu operacji *commit*, Git zintegruje zmiany dokonane lokalnie przez danego użytkownika i zmiany w zewnętrznym repozytorium dokonane tam przez autora projektu (prowadzącego), tworząc w efekcie nowy stan lokalnego repozytorium.
     - Istnieje nawet możliwość integracji zmian naniesionych na te same pliki.

### Typowe problemy

#### Nie można wykonać commitu z powodu niezdefiniowanego użytkownika

Próbując wykonać *commit* napotykamy błąd, z komunikatem w rodzaju *Please tell me who you are.*, czy *fatal: unable to auto-detect email address*.

Git zapisując historię wersji repozytorium odnotowuje również, kto wprowadzał do niego zmiany. Użytkownik jest przy tym identyfikowany zarówno przez swoją nazwę, jak i adres email. Ten drugi domyślnie nie jest do niczego wykorzystywany, jednak jakiś musi zostać podany. Jeśli przy instalacji Gita, nie zostały wpisane odpowiednie dane, wykonanie *commitu* nie będzie możliwe, dopóki tych danych Gitowi nie podamy. Przy tym jeśli nie masz ochoty podawać Gitowi swojego prawdziwego adresu email (np. dlatego, że pracujesz na wspólnym dla wszystkich studentów koncie na komputerze w pracowni), nic nie stoi na przeszkodzie, żeby podać jakiś nieistniejący.

Aby rozwiązać problem należy otworzyć konsolę Gita, klikając w panelu *Git* w RStudio ikonę zębatki i wybierając opcję *Shell...*. W konsolę, która się pojawi, należy wpisać polecenia (w zależności od swoich preferencji podstaw za nazwę użytkownika i adres email swoje dane, albo zostaw to, co jest):

  - `git config user.name "Nazwa Użytkownika"`,
  - `git config user.email "adres@email.com"`.

#### Problem z dodaniem pliku do poczekalni

W RStudio typowo dodajemy pliki do *poczekalni* zaznaczając pola wyboru przy plikach w zakładce *Git*. Czasem zdarza się jednak, że RStudio zacina się i mimo prób nie chce zaznaczyć pola przy danym pliku.

W takim przypadku należy otworzyć konsolę Gita, klikając w panelu *Git* w RStudio ikonę zębatki i wybierając opcję *Shell...*. W konsolę, która się pojawi, należy wpisać: `git add "nazwa pliku z.rozszerzeniem"`.
