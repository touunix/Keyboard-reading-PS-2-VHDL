# ENG Keyboard reading PS/2 VHDL
###### Description
The system reads signals from the attached PS/2 keyboard and displays the pressed keys on the 7-segment LED display. During the execution of the task, the display AN0 was selected for display.

The system only recognizes the following keys: 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, a, b, c, d, e, f

When another key is pressed, the display goes blank. The system has an additional BTN3 button which, when pressed, acts as an asynchronous reset that turns off the display.

###### Simulation results
<img src="https://user-images.githubusercontent.com/79804729/160300827-5436e2f5-ffdb-477c-8d7a-fda00a9624dd.png" width="100%"></img>

<img src="https://user-images.githubusercontent.com/79804729/160300843-b4ef5cfa-97b7-43cb-b71e-4e798bd4e159.png" width="100%"></img> 

###### Verification results
<img src="https://user-images.githubusercontent.com/79804729/160301447-dc00074a-23ee-4032-9804-a55d08595ef4.gif" width="100%"></img> 

###### Files description
- top_display.vhd - VHDL file with display control of individual segments of the display with frequency divider
- top_odczyt.vhd - main VHDL design file with the operation algorithm
- tb.vhd - testbench file
- iup8.xdc - file with constraints for the Nexys-A7 board (FPGA xc7a100tcsg324-1)

# PL Odczyt klawiatury PS/2 VHDL
###### Opis
Układ po zaprogramowaniu, odczytuje sygnały z dołączonej klawiatury PS/2 i wyświetla na wyświetlaczu 7-segmentowym LED naciśnięte klawisze. Podczas realizacji zadania został wybrany wyświetlacz AN0 do wyświetlania.

Układ rozpoznaje tylko następujące klawisze: 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, a, b, c, d, e, f

W przypadku gdy zostanie wciśnięty inny klawisz, wyświetlacz zostaje wygaszony. Układ posiada dodatkowy przycisk BTN3, który po naciśnięciu działa jako reset asynchroniczny, który wygasza wyświetlacz.

###### Wyniki symulacji
<img src="https://user-images.githubusercontent.com/79804729/160300827-5436e2f5-ffdb-477c-8d7a-fda00a9624dd.png" width="100%"></img>

<img src="https://user-images.githubusercontent.com/79804729/160300843-b4ef5cfa-97b7-43cb-b71e-4e798bd4e159.png" width="100%"></img> 

###### Wyniki weryfikacji
<img src="https://user-images.githubusercontent.com/79804729/160301447-dc00074a-23ee-4032-9804-a55d08595ef4.gif" width="100%"></img> 

###### Opis plików
- top_display.vhd - plik VHDL ze sterowaniem wyświetlania na poszczególnych segmentach wyświetlacza wraz z dzielnikiem częstotliwości
- top_odczyt.vhd - główny plik projektu VHDL z algorytmem działania
- tb.vhd - plik testbench
- iup8.xdc - plik z ograniczeniami projektowymi dla płytki Nexys-A7 (układ FPGA xc7a100tcsg324-1)
