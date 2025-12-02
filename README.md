# 🎮 Connect 4 – Prolog Project

A fully functional **Connect 4** (4-em-linha) console game implemented in **SWI-Prolog**, using a clean modular architecture.

---

## ✅ How to Run the Game

Open **SWI-Prolog**, go to the project folder, and run:

### **1. Compile**
```prolog
[main].
```
### **1. Run**
```prolog
main.
```
## 🎮 How the Game works

- The board is **6 rows × 7 columns**.  
- **Player 1** chooses a piece color from: `r`, `y`, `b`, `w`.  
- **Player 2** chooses one of the remaining colors.  
- Players alternate turns by choosing a column number **(1–7)**.  
- Pieces fall automatically to the **lowest empty row** (gravity).  
- The game ends when a player connects **four in a row**:
  - Horizontal  
  - Vertical  
  - Diagonal left `/`  
  - Diagonal right `\`  
- Or when the **board is full** (stalemate).  
- After the game, players are asked if they want to **play again**.

---

## 📂 Project Structure
- /main.pl        → Main game controller
- /Board/board.pl → Board creation + printing
- /Game/game.pl   → Insert pieces, board manipulation
- /Game/turns.pl  → Turn management + piece selection
- /Game/state.pl  → Win conditions + stalemate detection

---

## 🧩 Module Descriptions
### main.pl

- Runs the main loop of the game

- Reads user input for moves

- Calls win/stalemate checks

- Prints results and handles replay

### board.pl

- Creates an empty board

- Prints the board with proper alignment

### game.pl

- insert/4 places a piece into a column

- Handles gravity so pieces fall to bottom

- Provides get_element and replace for list operations

### turns.pl

- Manages which player plays

- Ensures players pick different piece colors

- Switches turns between P1 and P2

### state.pl

- Win detection:

    - Horizontal

    - Vertical

    - Diagonal (both directions)

- Board full detection (stalemate)

---

### ✔ Requirements
- **SWI-Prolog**
---

### ✨ Features
- Fully functional Connect 4 game

- Clean text-based board UI

- Win detection in all 4 directions

- Stalemate detection

- Replay option

- Modular project structure
---