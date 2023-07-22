# Kalkulator Zarobków [PL]

Prosta aplikacja do kontrolowania swoich zarobków. Aplikacja pozwala każdego dnia zapisać ile się zarobiło, na podstawie przepracowanych godzin oraz stawki. Każdego dnia można dopisać zarobioną kwotę, lub ją nadpisać. Na podsumowaniu wyświetlana jest suma zarobionych pieniędzy danego miesiąca danego roku, od najpoźniejszej daty. Dane (daty, stawki oraz przepracowane godziny każdego dodanego dnia) zapisywane są lokalnie na urządzeniu.

## Co zostało wykorzystane w aplikacji:

- BLoC pattern, a dokładniej to HydratedBloc, by móc zapisywać stany Bloca w urządzeniu w prosty sposób
- responsive design, by aplikacja dostosowywała się pod telefon użytkownika (UWAGA: nie obsłużyłem każdej orientacji oraz typów urządzeń, więc aplikacja może w niektórych przypadkach nie być w pełni responsywna, np. dla telefonu w orientacji poziomej)
- kod napisany w miarę czysto, przynajmniej takie odnoszę wrażenie, jedynie nazwy plików mogły być ustawione na krótsze i bardziej przejrzyste
- proste animacje przy włączaniu aplikacji
- aplikacja zawiera tylko jeden ekran, gdyż jej proste założenie nie wymagało tworzenia dodatkowej ilości ekranów
- wykorzystanie paczek do np. zmiany języka kalendarza na polski lub znalezienia ścieżki, gdzie aplikacja by mogła zapisywać dane

## Krótki film przedstawiający aplikację:

https://github.com/AdamDybcio/Kalkulator-Zarobkow/assets/68535467/98aa632c-3e6f-4f72-bf3e-d5abc07fff18

### Pomysł na aplikację -  aplikacja stworzona do użytku przez mojego przyjaciela na codzień
